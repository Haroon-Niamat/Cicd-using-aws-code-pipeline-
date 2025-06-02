#!/bin/bash
cd /home/ubuntu/app
docker system prune -f
docker-compose pull
docker-compose up -d
