class Comment < ActiveRecord::Base
   belongs_to :user
   has_many :votes, as: :votable
   belongs_to :commentable, polymorphic: true



end
