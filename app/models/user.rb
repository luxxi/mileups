class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trips, :dependent => :destroy

  validates :username, :presence => { :message => 'username!' }
  validates_uniqueness_of :username

  def to_param
    username.parameterize
  end

  def self.find_by_param(input)
    find_by_username(input.parameterize)
  end
end
