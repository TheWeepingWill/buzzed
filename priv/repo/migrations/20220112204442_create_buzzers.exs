defmodule Buzzed.Repo.Migrations.CreateBuzzers do
  use Ecto.Migration

  def change do
    create table(:buzzers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :players, references(:users, on_delete: :nothing, type: :binary_id)
      add :creator, references(:user, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:buzzers, [:players])
    create index(:buzzers, [:creator])
  end
end
