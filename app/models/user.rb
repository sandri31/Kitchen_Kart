# frozen_string_literal: true

# The User model represents users in the system. Each user can create recipes,
# post comments, rate recipes, and has a personal shopping bag for ingredients.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :shopping_bag, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  enum role: { user: 0, moderator: 1, admin: 2 }

  validates :username, presence: true, uniqueness: true

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end
