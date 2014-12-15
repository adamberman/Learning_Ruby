PostApp.Views.PostForm = Backbone.View.extend({
  template: _.template("<label for='title'>Title</label><br><input type='text' name='title' id='title' value='<%= post.escape('title') %>'><br><label for='body'>Body</label><br><textarea name='body' id='body'><%= post.escape('body') %></textarea><br><button>Submit</button><a href='#/'>Back</a>"),
});
