import sqlite3
import os

# Map each database file to its tag
bible_files = {
    "assets/db/african_bible.db": "[African Bible] ",
    "assets/db/nabre.db": "[NABRE] ",
    "assets/db/rsvce.db": "[RSV-CE] ",
    "assets/db/njb.db": "[New Jerusalem Bible] "
}

for relative_path, prefix in bible_files.items():
    db_file = os.path.abspath(relative_path)
    if os.path.exists(db_file):
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()

        # Prepend translation tag to verse text
        cursor.execute(f"UPDATE CPDV_verses SET text = ? || text WHERE text NOT LIKE ?", (prefix, f"{prefix}%"))

        conn.commit()
        conn.close()
        print(f"Successfully updated: {relative_path}")
    else:
        print(f"File not found: {db_file}")