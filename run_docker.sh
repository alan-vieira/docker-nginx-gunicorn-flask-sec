#!/bin/bash

echo killing old docker processes
docker-compose down

echo building and starting docker containers
docker-compose up --build -d
