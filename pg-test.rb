require 'pg'

puts 'Connecting to the database...'
conn = PG.connect(
host: 'localhost',
dbname: 'contactlist',
user: 'development',
password: 'development'
)

 contacts_array = [5]

    puts   conn.exec("UPDATE contacts SET id =5, name = 'New name', email = '")

puts 'DONE'
