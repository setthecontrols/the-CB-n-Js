class Vote < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: [:votable_type, :votable_id]
  belongs_to :questions
  belongs_to :comments
  belongs_to :answers

end
