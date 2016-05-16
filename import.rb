require 'pg'
require 'csv'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

data = []
CSV.foreach('sales.csv', headers: true) do |row|
  data << row.to_h
end

db_connection do |conn|
  data.each do |info|

    employee_name = info['employee'][/[^(]+/]
    employee_email = info['employee'][/\(.*?\)/].gsub(/[()]/, "")
    customer_name = info['customer_and_account_no'][/[^(]+/]
    customer_account_no = info['customer_and_account_no'][/\(.*?\)/].gsub(/[()]/, "")
    product_name = info['product_name']
    sale_date = info['sale_date']
    sale_amount = info['sale_amount']
    units_sold = info['units_sold']
    invoice_no = info['invoice_no']
    invoice_frequency = info['invoice_frequency']

    sql_query =  "INSERT INTO customers (name, account_number) VALUES ($1, $2)"
      conn.exec(sql_query, [employee_name, employee_email])
    sql_query = "INSERT INTO customers (name, account_number) VALUES ($1, $2)"
      conn.exec(sql_query, [customer_name, customer_account_no])
    sql_query = "INSERT INTO products (name) VALUES ($1)"
      conn.exec(sql_query, [product_name])
    sql_query = "INSERT INTO sales (sale_date, sale_amount, units_sold, invoice_no, invoice_frequency)
      VALUES ($1, $2, $3, $4, $5)"
      conn.exec(sql_query, [sale_date, sale_amount, units_sold, invoice_no, invoice_frequency])

  end
end
