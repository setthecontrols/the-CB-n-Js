class Comment < ActiveRecord::Base
   validates :comment_text, presence: true
   belongs_to :user, :question, :answer
   has_many :votes, as: :votable
   belongs_to :commentable, polymorphic: true



end
