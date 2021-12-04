require "sqlite3"
if __FILE__ == $PROGRAM_NAME
  db = SQLite3::Database.new "Example.db"
  schema = <<-SQL
    CREATE TABLE IF NOT EXISTS countries (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(50) NOT NULL UNIQUE,
      language VARCHAR(50),
      population INTEGER
    );
  SQL
  puts ""
  puts schema
  db.execute(schema)
  insert_sql = <<-SQL
    INSERT INTO countries (name, language, population)
    VALUES ('England', 'English', 53012456),
           ('Ethiopia', 'Amharic', 87952991),
           ('Ecuador', 'Spanish', 15223680);
  SQL
  puts ""
  puts insert_sql
  db.execute(insert_sql)
  select_sql = <<-SQL
    SELECT * FROM countries;
  SQL
  puts ""
  puts select_sql
  puts ""
  p db.execute(select_sql)
  db.results_as_hash = true
  puts ""
  puts select_sql
  puts ""
  p db.execute(select_sql)
  results = db.execute(select_sql)
  puts ""
  puts "Country names:"
  results.each do |country|
    puts "- " + country["name"]
  end
  puts ""
  puts db.class
  p db.table_info("countries")
  update_sql = <<-SQL
    UPDATE countries
    SET population = 13721
    WHERE name = 'England';
  SQL
  puts ""
  puts update_sql
  db.execute(update_sql)
  puts select_sql
  puts ""
  p db.execute(select_sql)
  delete_sql = <<-SQL
    DELETE FROM countries;
  SQL
  puts ""
  puts delete_sql
  db.execute(delete_sql)
end
# https://github.com/xynnylol