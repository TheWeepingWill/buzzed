defmodule Buzzed.GamesTest do
  use Buzzed.DataCase

  alias Buzzed.Games

  describe "buzzers" do
    alias Buzzed.Games.Buzzer

    import Buzzed.GamesFixtures

    @invalid_attrs %{title: nil}

    test "list_buzzers/0 returns all buzzers" do
      buzzer = buzzer_fixture()
      assert Games.list_buzzers() == [buzzer]
    end

    test "get_buzzer!/1 returns the buzzer with given id" do
      buzzer = buzzer_fixture()
      assert Games.get_buzzer!(buzzer.id) == buzzer
    end

    test "create_buzzer/1 with valid data creates a buzzer" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Buzzer{} = buzzer} = Games.create_buzzer(valid_attrs)
      assert buzzer.title == "some title"
    end

    test "create_buzzer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_buzzer(@invalid_attrs)
    end

    test "update_buzzer/2 with valid data updates the buzzer" do
      buzzer = buzzer_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Buzzer{} = buzzer} = Games.update_buzzer(buzzer, update_attrs)
      assert buzzer.title == "some updated title"
    end

    test "update_buzzer/2 with invalid data returns error changeset" do
      buzzer = buzzer_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_buzzer(buzzer, @invalid_attrs)
      assert buzzer == Games.get_buzzer!(buzzer.id)
    end

    test "delete_buzzer/1 deletes the buzzer" do
      buzzer = buzzer_fixture()
      assert {:ok, %Buzzer{}} = Games.delete_buzzer(buzzer)
      assert_raise Ecto.NoResultsError, fn -> Games.get_buzzer!(buzzer.id) end
    end

    test "change_buzzer/1 returns a buzzer changeset" do
      buzzer = buzzer_fixture()
      assert %Ecto.Changeset{} = Games.change_buzzer(buzzer)
    end
  end
end
