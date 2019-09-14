# frozen_string_literal: true

class User < Person
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :project_users
  has_many :projects, through: :project_users

  has_many :our_mails
end
