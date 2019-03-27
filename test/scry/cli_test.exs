defmodule Scry.CLITest do
  @moduledoc """
  This module holds the tests for the Command Line Interface
  for the various commands parsed to Scry app.
  """
  use ExUnit.Case

  alias Scry.CLI
  @test_data ["--help"]
  @rate ["--btc","rate"]
  @time ["--btc","time"]

  test "command '--help' outputs the usge info" do
    assert CLI.parse_params(@test_data) == :help
    assert CLI.process(:help)== :ok
  end

  test "command '--btc time' outputs time of recorded btc price" do
    assert CLI.parse_params(@time) == :btctime
    assert CLI.process(:btctime)== :ok
  end

  test "command '--btc rate' outputs rate of btc in USD" do
    assert CLI.parse_params(@rate) == :btcrate
    assert CLI.process(:btcrate) == :ok
  end

end
