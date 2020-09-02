class Dog
  attr_accessor :name, :breed
  def initialize(name)
    @name = name[:name]
    @breed = name[:breed]
  end
end
