defmodule TimeManagerAPIWeb.Router do
  use TimeManagerAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/api", TimeManagerAPIWeb do
    pipe_through :api

    scope "/users" do
      get "/", UserController, :search
      get "/:userID", UserController, :show
      post "/", UserController, :create
      post "/signin", UserController, :signin
      put "/:userID", UserController, :update
      delete "/:userID", UserController, :delete
      
    end

    scope "/clocks" do
      get "/", ClockController, :index
      get "/:userID", ClockController, :showByUser
      post "/:userID", ClockController, :create
    end

    scope "/workingtimes" do
      get "/", WorkingtimeController, :index
      get "/:id", WorkingtimeController, :search
      # also get "/:userID?start=XXX&end=YYY"
      post "/:userID", WorkingtimeController, :create
      put "/:id", WorkingtimeController, :update
      delete "/:id", WorkingtimeController, :delete
    end
  end

end
