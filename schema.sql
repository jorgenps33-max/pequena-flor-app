CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  role TEXT NOT NULL CHECK(role IN ('admin','seller')),
  code TEXT UNIQUE,
  active INTEGER DEFAULT 1,
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  price REAL NOT NULL,
  active INTEGER DEFAULT 1,
  created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS sales (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  seller_id INTEGER NOT NULL,
  seller_code TEXT NOT NULL,
  amount REAL NOT NULL,
  commission_rate REAL NOT NULL,
  commission_amount REAL NOT NULL,
  customer_name TEXT,
  status TEXT DEFAULT 'confirmed',
  paid INTEGER DEFAULT 0,
  created_at TEXT NOT NULL,
  FOREIGN KEY(seller_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS withdraw_requests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  seller_id INTEGER NOT NULL,
  amount REAL NOT NULL,
  status TEXT DEFAULT 'pending',
  created_at TEXT NOT NULL,
  FOREIGN KEY(seller_id) REFERENCES users(id)
);
