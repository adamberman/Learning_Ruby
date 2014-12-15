window.PostApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new PostApp.Routers.Router({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};

JSA = {};

JSA.myBind = function (fn, obj) {};

JSA.myCall = function (fn, obj) {};

JSA.myCurry = function (fn, obj, numArgs) {};
