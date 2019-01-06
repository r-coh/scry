defmodule Scry.CLI do
  @moduledoc """
  This main module of the app and is mostly handy at passing options
  for the app.
  """

  alias Scry.{
    Fetch,
    Extract
  }

  @coindesk_api "https://api.coindesk.com/v1/bpi/currentprice.json"

  @doc """
  The main/1 function that starts the script.
  It takes parameters of type one word string
  which serves as the options.
  """
  @spec main(String.t()) :: String.t()
  def main(params) do
    parse_params(params)
      |> process
  end

  @doc """
  This function takes the input string and parses it through the
  OptionParser module and assign the various data retrieved to an
  atom.
  """
  def parse_params(params) do
    parse = OptionParser.parse(params, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      {[help: true], _,_}
        -> :help

      {_, [option],_}
        -> {option}

      {[btc: true], _,_}
        -> :btc

      {[btc: "rate"], _, _}
        -> :btcrate

      {[btc: "time"], _, _}
        -> :btctime
    end
  end

  @doc """
  The process/1 functions are called depending on the parameters that match those recieved from the parse_params/1 function.
  """
  @spec process(Atom.t()) :: String.t() | {:error, String.t()}
  def process({option}) do
    IO.puts """
    SCRY
    ------
    Invalid option, use --help to view usage.
    """
  end

  def process(:help) do
    IO.puts """
    SCRY
    -------------------------------------------
    Run the following commands
      ./scry --btc rate
    to get bitcoin rate at the moment in USD.
      ./scry --btc time
    to get the time at given rate.
    -------------------------------------------

    """
  end

  def process(:btcrate) do
    data = Fetch.fetch(@coindesk_api)
        |> Extract.btc_rate
    IO.puts data
  end

  def process(:btctime) do
    data = Fetch.fetch(@coindesk_api)
          |> Extract.btc_time
    IO.puts data
  end
end

