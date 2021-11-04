#!/bin/bash
mix deps.get
mix deps.compile
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs
#Start
mix phx.server


