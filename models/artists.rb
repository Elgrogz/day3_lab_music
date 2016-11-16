require('pg')

class Artist
  attr_accessor :name, :nationality
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @nationality = options['nationality']
    @id = options['id']to_i if options['id'] 
  end

  def save()
    sql = 
  end
end