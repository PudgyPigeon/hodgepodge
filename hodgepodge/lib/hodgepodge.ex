defmodule Hodgepodge do
  @moduledoc """
  Documentation for `Hodgepodge`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Hodgepodge.hello()
      :world

  """
  alias Hodgepodge.Repo
  alias Hodgepodge.Message

  def list_messages do
    Repo.all(Message)
  end

  def create_message(text) do
    %Message{}
    |> Message.changeset(%{content: text})
    |> Repo.insert()
  end

  def check_db do
    case Ecto.Adapters.SQL.query(Repo, "select 1", []) do
      {:ok, _} -> "Database is reachable!"
      {:error, _} -> "Database is down!"
    end
  end
end
