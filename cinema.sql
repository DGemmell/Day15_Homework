DROP TABLE customers CASCADE;
DROP TABLE films CASCADE;
DROP TABLE tickets CASCADE;

CREATE table customers(
id SERIAL PRIMARY KEY,
name VARCHAR,
funds INT
);

CREATE table films(
id SERIAL PRIMARY KEY,
title VARCHAR,
price INT
);

CREATE table tickets(
  id SERIAL PRIMARY KEY,
  price INT,
  filmid INT REFERENCES films(id) ON DELETE CASCADE,
  customerid INT REFERENCES customers(id) ON DELETE CASCADE
);
