# Hodgepodge

# How to Run
`iex -S mix`

Should open the server live

then:
```
curl -X POST http://localhost:4000/api/messages \
     -H "Content-Type: application/json" \
     -d '{"content": "First message from the command line!"}'
```


# Ecto Migrations

`mix ecto.gen.migration <arbitrary-name-like-create_messages>`, Creates a new migration file in <repo>/priv

`mix ecto.migrate`,Runs all pending migrations.

`mix ecto.rollback`,Reverts the last migration (useful if you made a typo).

`mix ecto.status`,"Shows you which migrations have run and which are ""down."""

`mix ecto.reset`,"Drops the DB, creates it, and runs all migrations (The ""Nuclear Option"")."

