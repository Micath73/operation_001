import json
import sqlite3
import os

json_path = os.path.join('assets', 'db', 'EntireBible-DR.json')
db_path = os.path.join('assets', 'db', 'bible.db')

print(f"Reading {json_path}...")

with open(json_path, 'r', encoding='utf-8') as f:
    data = json.load(f)

# Connect to database output file
conn = sqlite3.connect(db_path)
cursor = conn.cursor()

cursor.execute('DROP TABLE IF EXISTS CPDV_books')
cursor.execute('DROP TABLE IF EXISTS CPDV_verses')

cursor.execute('''
CREATE TABLE CPDV_books (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
)
''')

cursor.execute('''
CREATE TABLE CPDV_verses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER,
    chapter INTEGER,
    verse INTEGER,
    text TEXT,
    FOREIGN KEY(book_id) REFERENCES CPDV_books(id)
)
''')

book_id = 1
total_verses = 0

def process_chapters(book_id, chapters):
    global total_verses

    # If chapters is a list of chapters
    if isinstance(chapters, list):
        for ch_idx, verses in enumerate(chapters, start=1):
            process_verses(book_id, ch_idx, verses)
    # If chapters is a dict like {"1": [...], "2": [...]}
    elif isinstance(chapters, dict):
        for ch_key, verses in chapters.items():
            try:
                ch_num = int(ch_key)
            except ValueError:
                continue
            process_verses(book_id, ch_num, verses)

def process_verses(book_id, ch_num, verses):
    global total_verses
    # If verses is a list of strings
    if isinstance(verses, list):
        for v_idx, v_val in enumerate(verses, start=1):
            if isinstance(v_val, str):
                cursor.execute('INSERT INTO CPDV_verses (book_id, chapter, verse, text) VALUES (?, ?, ?, ?)',
                               (book_id, ch_num, v_idx, v_val))
                total_verses += 1
            elif isinstance(v_val, dict):
                # If verse item is dict like {"verse": 1, "text": "..."} or {"1": "..."}
                v_num = v_val.get('verse', v_idx)
                v_text = v_val.get('text', str(v_val))
                cursor.execute('INSERT INTO CPDV_verses (book_id, chapter, verse, text) VALUES (?, ?, ?, ?)',
                               (book_id, ch_num, v_num, v_text))
                total_verses += 1
    # If verses is a dict like {"1": "In the beginning...", "2": "..."}
    elif isinstance(verses, dict):
        for v_key, v_text in verses.items():
            try:
                v_num = int(v_key)
            except ValueError:
                v_num = 1
            cursor.execute('INSERT INTO CPDV_verses (book_id, chapter, verse, text) VALUES (?, ?, ?, ?)',
                           (book_id, ch_num, v_num, str(v_text)))
            total_verses += 1

# Process root structure
if isinstance(data, list):
    for item in data:
        if isinstance(item, dict):
            for book_name, chapters in item.items():
                cursor.execute('INSERT INTO CPDV_books (id, name) VALUES (?, ?)', (book_id, book_name))
                process_chapters(book_id, chapters)
                book_id += 1
elif isinstance(data, dict):
    for book_name, chapters in data.items():
        cursor.execute('INSERT INTO CPDV_books (id, name) VALUES (?, ?)', (book_id, book_name))
        process_chapters(book_id, chapters)
        book_id += 1

conn.commit()
conn.close()

file_size = os.path.getsize(db_path)
print(f"✅ SUCCESS: Built database!")
print(f"   Books inserted: {book_id - 1}")
print(f"   Verses inserted: {total_verses}")
print(f"   File size: {file_size} bytes ({round(file_size / (1024*1024), 2)} MB)")