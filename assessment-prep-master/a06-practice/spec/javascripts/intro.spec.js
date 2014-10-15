describe("myBind", function () {
  it("should take a function and bind the given context", function () {
    var myObj = {};
    var myFunc = function () {
      this.name = "John";
    };

    spyOn(myFunc, 'bind').andCallThrough();

    var myBoundFunc = JSA.myBind(myFunc, myObj);

    myBoundFunc();
    expect(myObj.name).toEqual("John");
    expect(myFunc.bind).not.toHaveBeenCalled();
  });

  it("should correctly handle a function bound multiple times", function () {
    var myObj = {};
    var pushyObj = {};

    var myFunc = function () {
      this.name = "John";
    };

    spyOn(myFunc, 'bind').andCallThrough();

    var myBoundFunc = JSA.myBind(myFunc, myObj);
    var myDoublyBoundFunc = JSA.myBind(myBoundFunc, pushyObj);

    myDoublyBoundFunc();
    expect(myObj.name).toEqual("John");
    expect(pushyObj.name).toBeUndefined();
    expect(myFunc.bind).not.toHaveBeenCalled();
  });

  it("should pass through any given arguments", function () {
    var myObj = {
      count: 10
    }
    var adder = function (x, y, z) {
      this.count += (x + y + z);
    };

    spyOn(adder, 'bind').andCallThrough();

    var boundAdder = JSA.myBind(adder, myObj);
    boundAdder(3, 4, 5);

    expect(myObj.count).toBe(22);
    expect(adder.bind).not.toHaveBeenCalled();
  });
});

describe("myCall", function () {
  it("should take a function and bind the given context and call the function", function () {
    var myObj = {
      name: "John"
    };
    var myFunc = function () {
      return this.name;
    };

    expect(JSA.myCall(myFunc, myObj)).toMatch(/John/);
  });

  it("should pass through any given arguments", function () {
    var myObj = {
      count: 10
    }
    var adder = function (x, y, z) {
      this.count += (x + y + z);
      return this.count;
    };

    expect(JSA.myCall(adder, myObj, 1, 2, 3)).toEqual(16);
  });
});

describe("myCurry", function () {
  beforeEach(function () {
    this.myObj = {
      count: 10
    };
  });

  it("should take a function, object, and curry if 1 is passed", function () {
    var echo = function (arg) {
      return arg;
    };

    var first = JSA.myCurry(echo, this.myObj, 1);
    expect(first("one")).toMatch(/one/);
  });

  it("binds to obj if passed in", function () {
    var count = function () {
      return this.count;
    };

    var first = JSA.myCurry(count, this.myObj, 1);
    expect(first("")).toEqual(10);
  });

  it("currys arguments and calls function after called with total num args", function () {
    var sum = function(a, b, c) {
      return this.count + a + b + c;
    };
    var curriedSum = JSA.myCurry(sum, this.myObj, 3);
    curriedSum(1);
    curriedSum(2);
    expect(curriedSum(3)).toEqual(16);
  });
});
