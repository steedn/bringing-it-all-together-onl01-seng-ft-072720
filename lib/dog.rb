class Dog
  attr_accessor :name, :breed, :idf
  def initialize(name)
    @name = name[:name]
    @breed = name[:breed]
  end
end
