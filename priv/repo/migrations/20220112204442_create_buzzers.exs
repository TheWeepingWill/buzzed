defmodule Buzzed.Repo.Migrations.CreateBuzzers do
  use Ecto.Migration

  def change do
    create table(:buzzers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :creator_id, references(:user, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:buzzers, [:creator_id])
  end
end
