class Dog
  attr_accessor :name, :breed, :id
  def initialize(name)
    @name = name[:name]
    @breed = name[:breed]
  end

  def self.create_table
  end
end
