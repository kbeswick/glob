class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :topics

  accepts_nested_attributes_for :topics, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def to_param
    "#{id.to_s}-#{title.parameterize}"
  end
end
