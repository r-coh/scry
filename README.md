# Scry

**TODO: Add description**

## Building from this repository

For Scry to work on your machine ensure you have `erlang` and `elixir` installed.
Build app by running:
  ```
  mix deps.get
  mix escript.build  
  ```
these commands will generate an executable `scry` on the root folder, that serves
as our app. You can run commands on your terminal in the following format.
  ``` 
  ./scry --help
  ```
  


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `scry` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:scry, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/scry](https://hexdocs.pm/scry).

