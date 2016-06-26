defmodule Tryexpug.Router do
  use Tryexpug.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tryexpug do
    pipe_through :browser
    get "/", TryController, :index
  end

  scope "/", Tryexpug do
    pipe_through :api
    post "/try/compile", TryController, :compile
  end
end
