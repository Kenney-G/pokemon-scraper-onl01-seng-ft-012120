class Pokemon
  require 'pry'
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute(
    "INSERT INTO pokemon (name, type) VALUES (?,?)",
    name, type
    )
  end
  
  def self.find(pokemon_id, db)
	  pokemon_info = db.execute("
	  SELECT *
	  FROM
	  pokemon
	  WHERE
	  id=?", pokemon_id).flatten
	  Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2] hp: pokemon_info[3], db: db)
  end  
    
    
    
end