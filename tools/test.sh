#!/bin/bash
# Run AGI system tests and database check
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
"$SCRIPT_DIR/setup_db.sh" "$SCRIPT_DIR/../tests/agi_test.db"
python3 "$SCRIPT_DIR/db_test.py" "$SCRIPT_DIR/../tests/agi_test.db"
make test
