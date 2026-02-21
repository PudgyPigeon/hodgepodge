Elixir stuff in hodgepodge dir for now - has its own README.md 

May change as clojure or rust microservices are added.

## Tentative design
Elixir will act as entry point API
Elixir will also act as dashboard/UI - use GraphQL?
- Simple API 
- Communicates with Clojure via gRPC using HTTP/3 and UDP for speed
    - QUIC
    - need repropagator for dropped calls
- Clojure does a random task - Loom or Asami

DB
- Managed with Ecto for now
- Maybe move to schemachange or flyway later

Orchestration
- Proposed Kubernetes
- Kind or K3S

Builds:
- Nix
- Baremetal (?)