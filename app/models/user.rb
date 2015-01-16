# show only one error message per field
class ReduceValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return until record.errors.messages.has_key?(attribute)
    record.errors[attribute].slice!(-1) until record.errors[attribute].size <= 1
  end

end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :last_name, :first_name, length: { in: 2..30 }, format: { with: /\A([a-zA-Z]+(?:\.)?(?:(?:'| )[a-zA-Z]+(?:\.)?)*)\z/, message: "has invalid format" } #,  :reduce => true
  validates :password, :password_confirmation, :reduce => true

end
