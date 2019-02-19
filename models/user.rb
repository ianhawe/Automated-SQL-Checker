class User

  attr_accessor :userid, :firstname, :lastname, :rolename, :cohortname, :cohortid


  def self.open_connection

      conn = PG.connect( dbname: "spartaappsql" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT * FROM student"
        results = conn.exec(sql)

        # create an array of post objects
        users = results.map do |tuple| 
            self.hydrate tuple
        end

        users

  end

  def self.hydrate post_data

    user = User.new

  end

  def save
    conn = PG.connect( dbname: "spartaappsql" )
    if self.rolename == 'Trainee'
      sql = "INSERT INTO student(studentid, courseid, firstname , lastname) VALUES (#{self.userid}, #{self.cohortid}, '#{self.firstname}','#{self.lastname}')"
      results = conn.exec(sql)
    end
  end

end