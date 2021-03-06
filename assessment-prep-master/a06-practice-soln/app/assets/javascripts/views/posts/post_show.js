PostApp.Views.PostShow = Backbone.View.extend({
  template: _.template("<h1>Post Show View</h1><%= post.escape('title') %></h1><%= post.escape('body') %><a href='#/'>Index</a>"),
  render: function () {
    var renderedContent = this.template({
      post: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
