defmodule Buzzed.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :creator_id, references(:user, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:games, [:creator_id])
  end
end
