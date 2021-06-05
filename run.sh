#!/bin/sh
set -e

echo "\nInstalling dependencies..."
mix deps.get

echo "\nCreating database..."
mix ecto.create

echo "\nLaunching Phoenix web server..."
mix phx.server
