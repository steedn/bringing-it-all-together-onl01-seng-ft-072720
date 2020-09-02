class Dog
  attr_accessor :name, :breed, :id
  def initialize(name)
    @name = name[:name]
    @breed = name[:breed]
  end

  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs(
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT
    );"
    DB[:conn].execute(sql)
  end
  def self.drop_table
    sql = "DROP TABLE IF EXISTS dogs"
    DB[:conn].execute(sql)
  end
  def save
    if self.id
     self.update
   else
     sql = "
       INSERT INTO dogs (name, breed)
       VALUES (?, ?)
     "
     DB[:conn].execute(sql, self.name, self.breed)
     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
   end
   self
 end
 def self.create(rent)
   dog = Dog.new(rent)
   dog.save
 end
 def self.new_from_db(rent)
   sql = "SELECT *
        FROM dogs
        WHERE name = ?
        AND breed = ?
        LIMIT 1"

  dog = DB[:conn].execute(sql,name,breed)
  # binding.pry
 end
end
