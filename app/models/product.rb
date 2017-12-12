class Product < ActiveRecord::Base
  belongs_to :user
  validates_prescense_of :name, :user, :pricing
  validtates :pricing, numericality: {greater_than: 0}
  
end
