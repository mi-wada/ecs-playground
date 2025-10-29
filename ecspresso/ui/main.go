package main

import (
	"context"
	"embed"
	"encoding/json"
	"fmt"
	"html/template"
	"io"
	"log"
	"net/http"
	"os"
	"time"
)

const port = 8081

// Embed the single template at the package root as requested (index.html)
//
//go:embed index.html
var templatesFS embed.FS

func main() {
	// Simplified configuration: read backend from env or use default.
	backend := os.Getenv("OMIKUJI_BACKEND")
	if backend == "" {
		backend = "http://localhost:8080/omikuji"
	}

	tmpl := template.Must(template.ParseFS(templatesFS, "index.html"))

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/html; charset=utf-8")

		ctx, cancel := context.WithTimeout(r.Context(), 5*time.Second)
		defer cancel()

		req, err := http.NewRequestWithContext(ctx, http.MethodGet, backend, nil)
		if err != nil {
			log.Println("create request:", err)
			http.Error(w, "failed to create backend request", http.StatusInternalServerError)
			return
		}

		resp, err := http.DefaultClient.Do(req)
		if err != nil {
			log.Println("backend request error:", err)
			http.Error(w, "failed to contact backend", http.StatusBadGateway)
			return
		}
		defer resp.Body.Close()

		body, err := io.ReadAll(resp.Body)
		if err != nil {
			log.Println("read backend body:", err)
			http.Error(w, "failed to read backend response", http.StatusBadGateway)
			return
		}

		// backend returns either a JSON string like "大吉" or plain text. Try JSON unmarshal first.
		var result string
		var s string
		if err := json.Unmarshal(body, &s); err == nil {
			result = s
		} else {
			result = string(body)
		}

		data := struct {
			Result  string
			Backend string
		}{Result: result, Backend: backend}

		if err := tmpl.Execute(w, data); err != nil {
			log.Println("template execute:", err)
		}
	})

	log.Printf("starting UI server on :%d (backend=%s)", port, backend)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", port), nil))
}
