class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :message
  belongs_to :admin

end
