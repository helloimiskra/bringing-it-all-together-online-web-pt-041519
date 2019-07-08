class Dog

  attr_accessor :id, :name, :breed

  def initialize (name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end

  def self.create_table
    sql = "CREATE TABLE dogs (id INTEGER PRIMARY KEY, name TEXT, breed TEXT);"

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE dogs;"

    DB[:conn].execute(sql)
  end

  def save
    if self.id
      self.update
    else
      self.insert
   end
  end

  def self.new_from_db(row)
    

  end

  def self.find_by_name(name)
    sql = "SELECT * FROM dogs WHERE name = ?"
    result = DB[:conn].execute(sql, name)[0]
    Dog.new(result[0], result[1], result[2])
  end
    
  end

  def update
  end

  def insert
    sql = "INSERT dogs (name, breed) VALUES (?, ?);"

    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  end
end
