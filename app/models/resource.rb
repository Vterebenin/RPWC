class Resource < ApplicationRecord
	belongs_to :admin
	belongs_to :category

	def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    unscoped
	  end
	end
end
