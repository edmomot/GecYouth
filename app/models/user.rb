class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :phone, presence: true, on: :create
  validates :birth_date, presence: true, on: :create
end