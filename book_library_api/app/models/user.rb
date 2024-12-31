class User < ApplicationRecord
  # Associations
  has_many :loans, dependent: :destroy
  has_many :shelves, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/, 
                              message: "must be a valid email address" }

  # Callbacks
  before_save :downcase_email, if: -> { email.present? }


  private

  def downcase_email
    self.email = email&.downcase
  end  
end
