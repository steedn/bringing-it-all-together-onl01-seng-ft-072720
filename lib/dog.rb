class Dog
  attr_accessor :name, :breed, :id
  def initialize(name:, breed:)
    @name = name
    @breed = breed
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
   dog = Dog.new(name: rent[0], breed: rent[1])
   dog.save
 end
 def self.new_from_db(rent)
   sql = "SELECT *
        FROM dogs
        WHERE name = ?
        AND breed = ?
        LIMIT 1"

  dog = DB[:conn].execute(sql,rent[1], rent[2])
  # binding.pry
  if !dog.empty?
     dog_data = dog[0]
     dog = Dog.new(name: dog_data[1], breed: dog_data[2])
   else
     dog = self.create(name: name, breed: breed)
   end
   dog
 end
end
