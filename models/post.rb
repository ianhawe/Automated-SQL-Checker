class Post

    attr_accessor :id, :title, :body
  
    def save
  
        conn = Post.open_connection
  
        if(!self.id) 
          # Insert a new record in to the database
          sql = "INSERT INTO studentanswer (questionid , answer) VALUES ( post.id, 'question-#{post.id}-text')"
        else 
          # Update an existing one
          sql = "UPDATE post SET title='kjashdkajsdha', body='askdjakjdhaskj' WHERE id = #{self.id}"
        end
  
        conn.exec(sql)
  
    end
  
    def self.open_connection
  
        conn = PG.connect( dbname: "spartaappsql" )
  
    end
  
    def self.all
  
          conn = self.open_connection
  
          sql = "SELECT * FROM question"
          results = conn.exec(sql)
  
          # create an array of post objects
          posts = results.map do |tuple| 
              self.hydrate tuple
          end
  
          posts
  
    end
  
    def self.find id
  
          conn = self.open_connection
  
          sql = "SELECT * FROM question WHERE"
  
          # PG always returns an array
          posts = conn.exec(sql)
  
          # bind just the first and return
          post = self.hydrate posts[0]
  
          post
  
    end
  
  
    def self.hydrate post_data
  
      post = Post.new
  
    
      post.title = post_data['question']
      post.id = post_data['questionid']
    #   post.body = post_data['body']
  
      post
  
    end
  
  end