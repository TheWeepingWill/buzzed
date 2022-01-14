defmodule Buzzed.Games.Buzzer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "buzzers" do
    field :title, :string
    belongs_to :creator, Buzzed.Accounts.User, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(buzzer, attrs) do
    buzzer
    |> cast(attrs, [:title, :creator_id])
    |> validate_required([:title, :creator_id])
  end
end
