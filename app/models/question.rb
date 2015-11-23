class Question < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  has_many :answers
  has_one :feed_content, as: :content, dependent: :destroy

  validates_presence_of :user_id, :text, :group_id

  after_create :create_feed_content

  def user_answer(user_id)
      Answer.find_by(user_id: user_id, question_id: id)
  end

  def answered?(user)
    answers.exists?(user_id: user.id)
  end

  private
  def create_feed_content
    self.feed_content = FeedContent.create(group_id: group_id, created_at: created_at)
  end
end