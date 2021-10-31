#!/bin/bash
mix ecto.create
mix ecto.migrate
#Start
mix phx.server

