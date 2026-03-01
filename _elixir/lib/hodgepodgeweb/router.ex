defmodule HodgepodgeWeb.Router do
  use Plug.Router

  # Pipeline: these run on every request
  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  plug :dispatch

  # Routes
  # Get all the messages from DB
  get "/api/messages" do
    messages = Hodgepodge.list_messages()
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(messages))
  end

  # Post /api/messages
  post "/api/messages" do
    case Hodgepodge.create_message(conn.body_params["content"]) do
      {:ok, message} -> send_resp(conn, 201, Jason.encode!(message))
      {:error, _changeset} -> send_resp(conn, 422, Jason.encode!(%{error: "Invalid data"}))
    end
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end

end
