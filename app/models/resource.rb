class Resource < ApplicationRecord
	belongs_to :admin
	belongs_to :category
end
