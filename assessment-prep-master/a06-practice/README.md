# Backbone Assessment

To run the specs you may either run `rake jasmine` and browse to `localhost:8888`
If you would like to run the specs in a headless way run `rake jasmine:headless`

Jasmine doesn't behave well with JST so the templates are written inline for you. 
_.template("<%= obj.method() %>"), will create a template function similar to how
JST["posts/form"] does. Try not to let this trip you up.

Keep in mind that the order of routes matter.

cats/:id
cats/new //=> this route will never fire, because it will match the above route first.

all of the specs are under `spec/javascripts`

Take a look at routes.rb and you'll notice that posts are available from `/api/posts`

**Topics**:
+  myBind
+  myCall
+  myCurry

**Backbone.Collection**:
+  model
+  url
+  comparator

**Backbone.Router**:
+  routes

**Backbone.View**:
+  render
+  tagName
+  events
+  initialize/listenTo
