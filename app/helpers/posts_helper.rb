module PostsHelper
  # return post author name given author id
  def post_author(author_id)
    return User.find(author_id).username
  end
end
