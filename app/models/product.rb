class Product < ApplicationRecord
    validates :name, presence: true, uniqueness: true  
    has_many :orders, dependent: :destroy
end
