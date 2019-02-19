class Course

  attr_accessor :courseid, :coursename


  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT * FROM course"
        results = conn.exec(sql)

        # create an array of post objects
        logins = results.map do |tuple| 
            self.hydrate tuple
        end

        logins

  end

  def self.hydrate post_data

  end

  def save
    conn = PG.connect( dbname: "spartaappsql" )
    if self.rolename == 'Trainee'
      sql = "INSERT INTO student(courseid, firstname , lastname) VALUES (1, '#{self.firstname}','#{self.lastname}')"
      results = conn.exec(sql)
    end
  end

end