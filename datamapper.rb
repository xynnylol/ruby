require "data_mapper" # Require the data_mapper gem
require "sqlite3"     # Require the sqlite adapter for Ruby
DataMapper::Logger.new($stderr, :debug)
DataMapper.setup(:default, "sqlite::memory:")
class Todo
  include DataMapper::Resource
  property :id, Serial
  property :task, String, required: true
  property :complete, Boolean, default: false
  property :created_at, DateTime, default: proc { DateTime.now }
  def to_s
    x_mark = complete ? "X" : " "
    "#{id} - [#{x_mark}] #{task}"
  end
end
DataMapper.finalize
DataMapper.auto_upgrade!
def seed_db
  Todo.create(task: "Kill someone I hate")
  Todo.create(task: "Order some c4's")
  Todo.create(task: "Learn how to give a fuck")
end
if __FILE__ == $PROGRAM_NAME
  puts ""
  puts "Let's have some \"fun\" (my arse) with DataMapper."
  puts ""
  puts "How many `Todo` records are in the database?"
  puts Todo.count
  puts ""
  puts "Seeding the database. (Haha.)"
  seed_db
  puts ""
  puts "Now how many are there (Too many for me to give a fuck abt)?"
  puts Todo.count
  puts ""
  puts "Retrieving all of the records. (kk idc tho)"
  puts Todo.all
  puts ""
  puts "retrieving record with id 2 (hurry ur arse up)"
  puts task = Todo.get(2)
  puts ""
  puts "Marking that shit as completed."
  task.complete = true
  puts task
  puts ""
  puts "Saved to todo database? (dont care + didnt ask)"
  puts task.dirty?
  puts ""
  puts "Saving."
  task.save
  puts task.dirty?
end
# https://github.com/xynnylol