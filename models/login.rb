class Login

  attr_accessor :id, :email, :password

  def save

      conn = Login.open_connection

      if(!answer.id) 
        # Insert a new record in to the database
        sql = "INSERT INTO studentanswer (questionid , answer) VALUES ('2','boi')"
      else 
        # Update an existing one
        sql = "INSERT INTO studentanswer (questionid , answer) VALUES ('2','boi')"
        # sql = "UPDATE studentanswer SET answer= #{answer.studentanswer} WHERE question.id = #{self.id}"
      end

      conn.exec(sql)

  end

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

    login = Login.new

  
    login.email = post_data['email']
    login.password = post_data['password']
    login.id = post_data['studentid']
  
    login

  end

  def find

  end

end