class Comment < ActiveRecord::Base
   belongs_to :user, :question, :answer
   has_many :votes, as: :votable
   belongs_to :commentable, polymorphic: true



end
