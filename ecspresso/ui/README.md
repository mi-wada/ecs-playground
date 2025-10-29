# ecspresso/ui

Simple Go web UI for the omikuji service.

Features
- Serves a single HTML page (embedded) that lets the user draw an omikuji.
- Provides a same-origin proxy `/api/omikuji` to the backend to avoid CORS.

Running

1. Start the omikuji backend (example: from repo root):

   ```bash
   cd ecspresso/omikuji
   go run .
   # server listens on :8080
   ```

2. Start the UI server:

   ```bash
   cd ecspresso/ui
   go run .
   # listens on :8081 by default
   ```

3. Open http://localhost:8081 in your browser and click the button.

Configuration
- To change the backend URL, set the environment variable `OMIKUJI_BACKEND` or pass `-backend` flag:

  ```bash
  OMIKUJI_BACKEND="http://localhost:8080/omikuji" go run .
  # or
  go run . -backend http://localhost:8080/omikuji
  ```
