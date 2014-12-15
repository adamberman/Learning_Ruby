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

JSA.myBind = function (fn, obj) {
  return function () {
    return fn.apply(obj, arguments);
  }
};

JSA.myCall = function (fn, obj) {
  var args = [].slice.call(arguments, 2);
  return fn.apply(obj, args);
};

JSA.myCurry = function (fn, obj, numArgs) {
  var args = [];

  function curriedFun (arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(obj, args);
    } else {
      return curriedFun;
    }
  }

  return curriedFun;
};
