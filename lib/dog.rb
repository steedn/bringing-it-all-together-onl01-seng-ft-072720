class Dog
  attr_accessor :name, :breed, :id
  def initialize(name)
    @name = name[:name]
    @breed = name[:breed]
  end

  def self.create_table
    DB[:conn].execute(CREATE TABLE IF NOT EXISTS dogs)
  end
end
