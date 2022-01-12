defmodule Buzzed.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Buzzed.Games` context.
  """

  @doc """
  Generate a buzzer.
  """
  def buzzer_fixture(attrs \\ %{}) do
    {:ok, buzzer} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Buzzed.Games.create_buzzer()

    buzzer
  end
end
