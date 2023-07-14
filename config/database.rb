ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: 'mysql',
  port: 3306,
  database: ENV['DATABASE'],
  username: ENV['MYSQL_USER'],
  password: ENV['MYSQL_PASSWORD']
)