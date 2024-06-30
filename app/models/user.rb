# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :comments
  has_many :status_changes
  validates_presence_of :first_name, :last_name

  validate :password_complexity

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$/)
      errors.add :password, 'must include at least one uppercase letter, one lowercase letter, one digit, and one special character'
    end
  end
end
