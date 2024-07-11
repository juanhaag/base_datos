#!/bin/bash

DB_PATH="db/database.db"
BUILD_DIR="build/ms_windows"

if [ ! -f "$DB_PATH" ]; then
  echo "Error: Database file not found at $DB_PATH"
  exit 1
fi

g++ -Wall -std=c++14 -Iinclude -o $BUILD_DIR/joins src/Handlers.cpp src/main.cpp -Llib -lsqlite3
if [ $? -eq 0 ]; then
  cd $BUILD_DIR
  
  ./joins
else
  echo "No compilo"
fi
