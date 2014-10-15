describe("PostApp.Collections.Posts collection", function () {
  beforeEach(function () {
    this.posts = new PostApp.Collections.Posts();
  });

  it("has the correct model defined", function () {
    expect(this.posts.model).toEqual(PostApp.Models.Post);
  });

  it("has the correct url defined", function () {
    expect(this.posts.url).toEqual('/api/posts');
  });

  it("can be sorted by votes (comparator function)", function () {
    var post1 = new PostApp.Models.Post({ votes: 3, title: "b" });
    var post2 = new PostApp.Models.Post({ votes: 4, title: "c" });
    var post3 = new PostApp.Models.Post({ votes: 1, title: "a" });

    this.posts.add([post1, post2, post3]);
    expect(this.posts.sort().first()).toEqual(post3);
    expect(this.posts.sort().last()).toEqual(post2);
  });
});
