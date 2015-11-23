class Question < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  has_many :answers
  has_one :feed_content, as: :content, dependent: :destroy

  validates_presence_of :user_id, :text, :group_id

  after_create :create_feed_content
  after_update :update_feed_content

  def user_answer(user_id)
    Answer.find_by(user_id: user_id, question_id: id)
  end

  private
  def create_feed_content
    self.feed_content = FeedContent.create(group_id: group_id, updated_at: updated_at)
  end

  def update_feed_content
    self.feed_content.update(group_id: group_id, updated_at: updated_at)
  end
end
