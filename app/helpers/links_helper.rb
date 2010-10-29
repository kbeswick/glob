module LinksHelper
 # return link author name given author id
  def link_author(author_id)
    return User.find(author_id).username
  end

end
