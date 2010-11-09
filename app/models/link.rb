class Link < ActiveRecord::Base
  before_save :render_content

  def render_content
    self.rendered_body = RDiscount.new(self.body).to_html
  end
end
