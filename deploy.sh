#!/bin/bash
set -e  # Exit on any error
set -o pipefail  # Catch failures in piped commands

LOG_FILE="/home/ubuntu/deploy.log"

{
  echo "---- Starting deployment at $(date) ----"
  cd /home/ubuntu/app
  docker-compose pull
  docker-compose up -d
  echo "---- Deployment completed successfully ----"
} >> "$LOG_FILE" 2>&1
