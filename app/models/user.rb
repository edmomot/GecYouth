class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :phone, presence: true, on: :create
  validates :birth_date, presence: true, on: :create

  belongs_to :address

  has_and_belongs_to_many :roles

  def admin?
    self.roles.include? Role.find_by_name('admin')
  end
end
