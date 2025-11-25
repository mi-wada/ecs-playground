package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"time"
)

const port = 80

var rng = rand.New(rand.NewSource(time.Now().UnixNano()))

var fortunes = []string{"大吉", "吉", "凶", "大凶"}

func omikujiHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Method Not Allowed", http.StatusMethodNotAllowed)
		return
	}

	choice := fortunes[rng.Intn(len(fortunes))]

	b, err := json.Marshal(choice)
	if err != nil {
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.Write(b)
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("OK"))
}

func main() {
	http.HandleFunc("/omikuji", omikujiHandler)
	http.HandleFunc("/health", healthHandler)
	log.Printf("starting server on :%d", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", port), nil))
}
