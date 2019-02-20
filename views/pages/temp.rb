<body>
                <div class="container">
                  <% @posts.each do |post| %>
                  <div class="row question-<%= post.id %>">
                  </div>
                  <div class="row">
                    <div class="col-lg-10">
                      <label for="Qid">
                        <%= post.id %>
                      </label>
                      <input type="hidden" name="Qid" value=<%=post.id%>>
                      <form method="POST" action="/question/1">
                        <label for="id">
                        </label>
                        <input type="hidden" name="id" value=<%=post.id%>>
                        <label for="question" class="flaggedQ">
                          <%= post.question%>
                        </label>
                        <label for="studentanswer"></label>
                        <textarea name="studentanswer" class="form-control" id="question-<%= post.id %>-text" rows="3">
                 <% @answers.each do |answer| %>
                 <% if(post.id == answer.id) %>
                 <%= answer.studentanswer%>
                 <% end %>
                 <% end %>
                 </textarea>
                        <input type="submit" value="Submit">
                      </form>
                    </div>
                  </div>
                  <%end%>
                  </body>

