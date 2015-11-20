class Question < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates_presence_of :user_id, :text, :group_id
end
