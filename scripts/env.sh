#!/bin/bash

# Check if the config file exists
if [ ! -f "./.env" ]; then
  echo "Error: config.env file not found in the current directory."
  exit 1
fi

# Load environment variables from the config.env file
export $(cat .env | grep -v '^#' | xargs)

echo "Environment variables loaded from config.env."
