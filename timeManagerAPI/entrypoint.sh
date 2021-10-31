#!/bin/bash
mix deps.get
mix ecto.create
mix ecto.migrate
#Start
mix phx.server

