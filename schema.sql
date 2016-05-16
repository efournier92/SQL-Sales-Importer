DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

CREATE TABLE employees(
  id     SERIAL PRIMARY KEY,
  name   VARCHAR(100),
  email  VARCHAR(100)
);

CREATE TABLE customers(
  id              SERIAL PRIMARY KEY,
  name            VARCHAR(100),
  account_number  VARCHAR(100)
);

CREATE TABLE products(
  id     SERIAL PRIMARY KEY,
  name   VARCHAR(100)
);

CREATE TABLE sales(
  id                SERIAL PRIMARY KEY,
  employee_id       INT REFERENCES employees(id),
  customer_id       INT REFERENCES customers(id),
  product_id        INT REFERENCES products(id),
  sale_date         DATE,
  sale_amount       VARCHAR(64),
  units_sold        VARCHAR(64),
  invoice_no        INT,
  invoice_frequency VARCHAR(100)
);
