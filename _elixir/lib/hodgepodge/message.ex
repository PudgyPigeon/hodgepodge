defmodule Hodgepodge.Message do
  use Ecto.Schema
  import Ecto.Changeset

  # This tells Jason to only include these three fields
  # in the JSON response
  @derive {Jason.Encoder, only: [:id, :content, :inserted_at, :updated_at]}
  schema "messages" do
    field(:content, :string)
    timestamps()
  end

  # Validate data before it hits DB
  def changeset(message, attrs) do
      message
      |> cast(attrs, [:content])
      |> validate_required([:content])
  end
end
