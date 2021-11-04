defmodule TimeManagerAPIWeb.Router do
  use TimeManagerAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug TimeManagerAPI.Auth.Admin
  end

  pipeline :manager do
    plug TimeManagerAPI.Auth.Manager
  end

  pipeline :generalmanager do
    plug TimeManagerAPI.Auth.ManagerGeneral
  end

  pipeline :authentifie do
    plug TimeManagerAPI.Auth.Authentification
  end

  scope "/api", TimeManagerAPIWeb do
    pipe_through :api
    post "/signin", UserController, :signin
    post "/signup", UserController, :create
  end

  scope "/api", TimeManagerAPIWeb do
    pipe_through :authentifie
    pipe_through :api
    # connected user
    get "/users/logout", UserController, :logout
    get "/users/:userID", UserController, :show
    put "/users/:userID", UserController, :update
    get "/clocks/:userID", ClockController, :showByUser
    post "/clocks/:userID", ClockController, :create
  end

  # Manager
  scope "/api", TimeManagerAPIWeb do
    pipe_through :manager
    pipe_through :api
    pipe_through :authentifie
    get "/users/", UserController, :search
    get "/clocks/", ClockController, :index
    post "/workingtimes/:userID", WorkingtimeController, :create
    get "/workingtimes/", WorkingtimeController, :index
    get "/workingtimes/:id", WorkingtimeController, :search
    # also get "/:userID?start=XXX&end=YYY"
  end

  # General Manager
  scope "/api", TimeManagerAPIWeb do
    pipe_through :generalmanager
    pipe_through :api
    pipe_through :authentifie
    delete "/users/:userID", UserController, :delete
    put "/workingtimes/:id", WorkingtimeController, :update
    delete "/workingtimes/:id", WorkingtimeController, :delete
  end
end
