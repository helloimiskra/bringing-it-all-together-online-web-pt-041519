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
    sql = <<-SQL INSERT INTO dogs (name, breed) VALUES (?, ?);
    SQL

    DB[:conn].execute(sql, self.name, self.album)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
  end

end
