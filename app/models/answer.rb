class Answer < ActiveRecord::Base

    validates :user_id, presence: true
    validates :question_id, presence: true
    validates :answer_text, presence: true

    belongs_to :question
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :votes, as: :votable

end
