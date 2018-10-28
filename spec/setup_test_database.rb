require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users CASCADE;')
  # Add the test data
  connection.exec("INSERT INTO users(user_id, email_id, user_name, user_handle, password) VALUES(1, 'joe.bloggs@chitters.com', 'Joe Bloggs', 'jbloggs','dummy');")
  connection.exec("INSERT INTO users(user_id, email_id, user_name, user_handle, password) VALUES(2, 'john.doe@chitters.com', 'John Doe', 'jdoe','dummy');")
  connection.exec("INSERT INTO users(user_id, email_id, user_name, user_handle, password) VALUES(3, 'jules.winny@chitters.com', 'Jules Winny', 'jwinny','dummy');")
end
