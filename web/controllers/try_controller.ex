defmodule Tryexpug.TryController do
  use Tryexpug.Web, :controller

  @default_code "doctype html\nhtml\n  head\n    title Hello\n  body\n    .hello#box"

  def index(conn, params) do
    conn
    |> assign(:code, params["code"] || @default_code)
    |> render("index.html")
  end

  def frame(conn, params) do
    IO.puts("-> params: #{inspect(params)}")
    conn
    |> assign(:code, params["code"] || @default_code)
    |> render("frame.html")
  end

  def compile(conn, %{"input" => input}) do
    try do
      output = Expug.to_eex!(input)
      conn
      |> json(%{ "output": output })
    rescue err in [Expug.Error] ->
      conn
      |> json(%{ "error": err })
    end
  end
end
