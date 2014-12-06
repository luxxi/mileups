class Trip < ActiveRecord::Base
  has_many :photos, :dependent => :destroy

  #TODO validates
  #accepts_nested_attributes_for :photos
  validates :title, :presence => { :message => 'Title!' }
  validates_uniqueness_of :title

  def to_param
    title.parameterize
  end

  def self.find_by_param(input)
    find_by_title(input.parameterize)
  end
end
