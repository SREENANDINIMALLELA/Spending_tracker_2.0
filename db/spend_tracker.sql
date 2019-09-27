DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE categories ;
DROP TABLE customers;

CREATE TABLE categories (
  id serial4 ,
  name varchar(255) NOT NULL UNIQUE,
  PRIMARY KEY(id)
);
CREATE TABLE merchants (
  id serial4 primary key ,
  name varchar(255) NOT NULL UNIQUE
);

CREATE TABLE transactions(
  id serial4 primary key,
  category_id INT4 REFERENCES categories(id),
  merchant_id INT4 REFERENCES merchants(id),
  amount INT4,
  transaction_date DATE NOT NULL 
);

CREATE TABLE Customers(
  id serial4 primary key,
    name varchar(255),
    wallet INT8 ,
    budget INT8
);
