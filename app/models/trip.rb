class Trip < ActiveRecord::Base
  has_many :photos, :dependent => :destroy

  #accepts_nested_attributes_for :photos
  validates :title, :presence => { :message => 'Title!' }
end
