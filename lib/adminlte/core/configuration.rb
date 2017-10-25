class Adminlte::Core::Configuration
  attr_accessor :name, :namespace

  def initialize
    @name = 'Demo title'
  end

  def navigation
    @navigation ||= Adminlte::Core::Navigation.new

    yield(@navigation) if block_given?

    @navigation
  end
end
