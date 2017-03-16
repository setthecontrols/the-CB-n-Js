class Vote < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: [:votable_type, :votable_id]
end
