defmodule Buzzed.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Buzzed.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Buzzed.Games.create_game()

    game
  end
end
