class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :schools
has_many :reviews
has_many :testimonials
has_many :messages
has_one :teacher
has_one :student
belongs_to :role
has_many :comments
end
