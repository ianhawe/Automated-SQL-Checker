class User

  attr_accessor :userid, :firstname, :lastname, :rolename, :cohortname, :specialisationname


  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT * FROM student"
        results = conn.exec(sql)

        # create an array of post objects
        logins = results.map do |tuple| 
            self.hydrate tuple
        end

        logins

  end

  def self.hydrate post_data

    user = User.new

  end

  def save
    conn = PG.connect( dbname: "spartaappsql" )
    if self.rolename == 'Trainee'
      sql = "INSERT INTO student(courseid, firstname , lastname, email, password) VALUES (1, '#{self.firstname}','#{self.lastname}', 'lisadsadasaspa@spaasdrtaglobal.com', 'Passwasdord1')"
      results = conn.exec(sql)
    end
  end

end