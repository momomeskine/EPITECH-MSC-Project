# API Server

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

### Schema

users : `mix phx.gen.json Accounts User users username:string email:string`

clocks : `mix phx.gen.json Clocks Clock clocks time:utc_datetime status:boolean user:references:users`

workingtimes : `mix phx.gen.json Workingtimes Workingtime workingtimes start:utc_datetime end:utc_datetime user:references:users`

route : `resources "/users", UserController, except: [:new, :edit]`

### Migrate

`mix ecto.migrate`

### Seeds

`mix run priv/repo/seeds.exs`

### Reload DB

*Drop the table, create new table, migrate, seed*

`mix ecto.reset`

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
