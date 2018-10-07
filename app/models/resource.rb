class Resource < ApplicationRecord
	belongs_to :admin
	belongs_to :category

	def self.search(search)
	  if search
			if Rails.env.development?
		    where("LOWER(title) LIKE ?", "%#{search.downcase}%")
		  else
		    where("LOWER(title) ILIKE ?", "%#{search}%")
		  end 
	  else
	    unscoped
	  end
	end
end