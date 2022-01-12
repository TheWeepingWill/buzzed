defmodule Buzzed.Games.Buzzer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "buzzers" do
    field :title, :string
    field :players, :binary_id
    field :creator, :binary_id

    timestamps()
  end

  @doc false
  def changeset(buzzer, attrs) do
    buzzer
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
