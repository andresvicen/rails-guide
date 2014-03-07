require 'spec_helper'

describe Post do
  
  it "search posts by title" do
    
    Post.create(title: "test_title_0", text: "test_text_0")
    Post.create(title: "test_title_1", text: "test_text_1")
    
    posts = Post.search_by_title('test')
    posts.should_not be_nil
    posts.length.should == 2
    
    post0 = posts[0]
    post1 = posts[1]
    
    post0.should_not be_nil
    post1.should_not be_nil
    
    post0.title.should == "test_title_0"
    post1.title.should == "test_title_1"
    
    post0.text.should == "test_text_0"
    post1.text.should == "test_text_1"
    
  end
  
  it "get comments" do
    post0 = Post.create(title: "test_title_0", text: "test_text_0")
    post1 = Post.create(title: "test_title_1", text: "test_text_1")
    
    Comment.create(post_id: post0.id, commenter: "commenter_0", body: "test_body_0")
    Comment.create(post_id: post1.id, commenter: "commenter_1", body: "test_body_1")
    Comment.create(post_id: post0.id, commenter: "commenter_2", body: "test_body_2")
    
    comments = post0.comments 
    comments.should_not be_nil
    
    comments.length.should == 2
    
    comments[0].body. should == "test_body_0"
    comments[0].commenter. should == "commenter_0"
    
    comments[1].body. should == "test_body_2"
    comments[1].commenter. should == "commenter_2"
  end
  
end
