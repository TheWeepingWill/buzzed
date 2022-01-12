defmodule Buzzed.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias Buzzed.Repo

  alias Buzzed.Games.Buzzer

  @doc """
  Returns the list of buzzers.

  ## Examples

      iex> list_buzzers()
      [%Buzzer{}, ...]

  """
  def list_buzzers do
    Repo.all(Buzzer)
  end

  @doc """
  Gets a single buzzer.

  Raises `Ecto.NoResultsError` if the Buzzer does not exist.

  ## Examples

      iex> get_buzzer!(123)
      %Buzzer{}

      iex> get_buzzer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_buzzer!(id), do: Repo.get!(Buzzer, id)

  @doc """
  Creates a buzzer.

  ## Examples

      iex> create_buzzer(%{field: value})
      {:ok, %Buzzer{}}

      iex> create_buzzer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_buzzer(attrs \\ %{}) do
    %Buzzer{}
    |> Buzzer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a buzzer.

  ## Examples

      iex> update_buzzer(buzzer, %{field: new_value})
      {:ok, %Buzzer{}}

      iex> update_buzzer(buzzer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_buzzer(%Buzzer{} = buzzer, attrs) do
    buzzer
    |> Buzzer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a buzzer.

  ## Examples

      iex> delete_buzzer(buzzer)
      {:ok, %Buzzer{}}

      iex> delete_buzzer(buzzer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_buzzer(%Buzzer{} = buzzer) do
    Repo.delete(buzzer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking buzzer changes.

  ## Examples

      iex> change_buzzer(buzzer)
      %Ecto.Changeset{data: %Buzzer{}}

  """
  def change_buzzer(%Buzzer{} = buzzer, attrs \\ %{}) do
    Buzzer.changeset(buzzer, attrs)
  end
end
