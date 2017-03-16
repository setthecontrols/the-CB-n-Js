class Answer < ActiveRecord::Base

    validates :user_id, :best_answer, :question_id, :answer_text, presence: true

    belongs_to :question
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :votes, as: :votable

end
