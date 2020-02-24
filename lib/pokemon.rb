class Pokemon
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
    poke_card = db.execute("
	  SELECT *
	  FROM
	  pokemon
	  WHERE
	  id=?", pokemon_id).flatten
	  Pokemon.new(id: poke_card[0], name: poke_card[1], type: poke_card[3], db: db)
  end  
    
    
end