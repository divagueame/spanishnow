class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  enum role: {basic: 0, premium: 1, admin: 2}

  has_many :user_text_answers, dependent: :destroy
  has_many :feedbacks, through: :user_text_answers
  # after_save :create_user_text_answers

  private
  def create_user_text_answers
    UserTextBlock.all.each do |single_block|
      user_text_answer = UserTextAnswer.new(user_id: self.id, user_text_block_id: single_block.id)
      if user_text_answer.save
        p 'SAVED!'
      end
    end
  end
end
