#SQL Sales Importer

This is an exercise I did to practice defining a database schema to store information in a normalized format. I built the example code for a company called Korning, which manufactures glass, ceramics, and related materials.

`app.rb` contains a script to import data from a `sales.csv`, and write it to a PostgresSQL database.

###DB Setup Instructions

```no-highlight
$ createdb sales
$ psql sales < schema.sql
$ ruby app.rb
```
