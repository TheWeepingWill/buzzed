defmodule :"Elixir.Buzzed.Repo.Migrations.Add slug" do
  use Ecto.Migration

  def change do
    alter table("games") do
      add :slug, :string
      
    end

  end
end
