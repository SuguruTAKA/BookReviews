module SearchBook
	extend ActiveSupport::Concern
	included do
		scope :search_title, lambda { |keyword|
			table = Book.arel_table
			condition = table[:title].matches("%#{keyword}%")
			where(condition)
		}
		
		scope :search_author, lambda { |keyword|
			table = Book.arel_table
			condition = table[:author].matches("%#{keyword}%")
			where(condition)
		}

		scope :search, lambda { |s|
			r = self
			r = r.search_title(s[:s_title]) if s[:s_title].present?
			r = r.search_author(s[:s_author]) if s[:s_author].present?
			if r != self
				r
			else
				where({})
			end
		}
	end
end
