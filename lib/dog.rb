class Dog
  attr_accessor :name, :breed, :id
  def initialize(name)
    @name = name[:name]
    @breed = name[:breed]
  end

  def self.create_table
    sql = "CREATE IF NOT EXISTS dogs(
    id INTEGER PRIMARY KEY, 
    name TEXT, 
    breed TEXT
    );"
    DB[:conn].execute(sql)
  end
end
