#!/bin/bash

set -e

# Write environment variables to backend/.env
echo "Initializing backend environment variables..."
env | grep -E '^MY_|^GIT_|^BASE_' > /app/backend/.env

# Start the frontend and backend applications
echo "Starting frontend and backend..."
cd /app/backend && npm start &
cd /app/frontend && npm run start -- --host 0.0.0.0