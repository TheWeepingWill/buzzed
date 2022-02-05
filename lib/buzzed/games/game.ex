defmodule Buzzed.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @derive {Phoenix.Param, key: :slug}
  schema "games" do
    field :title, :string
    field :slug, :string
    belongs_to :creator, Buzzed.Accounts.User, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:title, :creator_id, :slug])
    |> validate_required([:title, :creator_id])
    |> maybe_make_slug()
  end

 def maybe_make_slug(changeset) do
  IO.inspect("#######################")
  IO.inspect(get_field(changeset, :slug))
  slug = get_field(changeset, :slug)
  length = 8

  if is_nil(slug) do
    put_change(changeset, :slug, :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length))
  else
    changeset
  end
 end
end
