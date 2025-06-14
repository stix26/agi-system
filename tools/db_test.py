#!/usr/bin/env python3
"""Simple sanity check for the SQLite database."""
import sqlite3
import sys

DB_FILE = sys.argv[1] if len(sys.argv) > 1 else "agi.db"

conn = sqlite3.connect(DB_FILE)
cur = conn.cursor()

# Ensure table exists
cur.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='agi_logs'")
row = cur.fetchone()
if not row:
    print("Table agi_logs not found")
    sys.exit(1)

# Insert and count
cur.execute("INSERT INTO agi_logs(message) VALUES ('test entry')")
conn.commit()
cur.execute("SELECT COUNT(*) FROM agi_logs")
count = cur.fetchone()[0]
print(f"Rows in agi_logs: {count}")
conn.close()
