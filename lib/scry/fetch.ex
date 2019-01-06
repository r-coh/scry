defmodule Scry.Fetch do
  @moduledoc """
  This module handles the fetching of the json data once
  given a public api url.
  """

  @doc """
  fetch/1 takes an api url and returns the json data object fetched.
  """
  @spec fetch(String.t()) :: JSON.t()
  def fetch(url) do
    url
      |> HTTPoison.get
      |> handle_json
  end

  @doc """
  handle_json/1 functions are executed depending of the matching results
  passed to it as recieved from the fetch/1 function above.
  """
  def handle_json({:ok, %{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  def handle_json({_, _}) do
    {:error, "No Connection!"}
  end

end
