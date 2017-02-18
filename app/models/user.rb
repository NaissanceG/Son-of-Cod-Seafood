class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 4, maximum: 10 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
