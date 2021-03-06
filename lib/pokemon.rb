class Pokemon
    attr_accessor :id, :name, :type, :db, :hp

    def initialize(id:, name:, type:, db:, hp: nil)
      @id = id
      @name = name
      @type = type
      @db = db
      @hp = hp
    end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
      poke_vals = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
      Pokemon.new(id: poke_vals[0], name: poke_vals[1], type: poke_vals[2], hp: poke_vals[3], db: db)
    end

    def alter_hp(hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
    end
end
