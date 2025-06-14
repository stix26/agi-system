#!/bin/bash
# Initialize SQLite database for AGI system
set -e
DB_FILE=${1:-agi.db}
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
sqlite3 "$DB_FILE" < "$SCRIPT_DIR/../sql/init.sql"
echo "Database initialized at $DB_FILE"
