class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :schools, dependent: :destroy
has_many :reviews, dependent: :destroy
has_many :testimonials, dependent: :destroy
has_many :messages, dependent: :destroy
has_one :teacher, dependent: :destroy
has_one :student, dependent: :destroy
belongs_to :role
has_many :comments, dependent: :destroy
end
