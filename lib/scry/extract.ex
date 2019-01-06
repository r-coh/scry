defmodule Scry.Extract do
  @moduledoc """
  This module is responsible for the extract functions that extract
  various date from the fetched data.
  """

  use Timex

  @doc """
  The btc_rate/1 function takes a map of json data fetched from the
  btc public api and extrates the current rate in USD.
  """
  @spec btc_rate(Map.t()) :: String.t()
  def btc_rate(map) do
    case map do
      {:ok, body}
        ->
        rate_in_usd = get_in(body, ["bpi"])
          |> get_in(["USD"])
          |> Map.fetch!("rate_float")
          |> :erlang.float_to_binary([decimals: 2])

        rate_in_usd = String.replace(rate_in_usd, String.at(rate_in_usd, -6), ",", [insert_replaced: 1, global: false])
        |> String.replace(String.at(rate_in_usd, 0), "$", [insert_replaced: 1, global: false])


      {:error, string}
        -> string
    end
  end

  @doc """
  Just as above the btc_time/1 function extracts the time the
  btc rate has been updated from the fetched json data.
  """
  @spec btc_time(Map.t()) :: String.t()
  def btc_time(map) do
    case map do
      {:ok, body}
        ->
          time = get_in(body, ["time"])
            |> Map.fetch!("updatedISO")

          {:ok, data} = Timex.parse(time, "{ISO:Extended:Z}")
          converted_time = Timex.Timezone.convert(data, Timex.Timezone.local())
          "Time:#{converted_time.hour}:#{converted_time.minute}:00"

      {:error, string}
        -> string
    end
  end
end
