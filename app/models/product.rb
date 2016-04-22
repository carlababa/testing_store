class Product < ActiveRecord::Base
  validates :name, :description, presence: true

  def bargain?
    price < 2.00
  end
end
