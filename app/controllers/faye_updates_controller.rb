class FayeUpdatesController < FayeRails::FayeUpdatesController
	observe Book, :after_update do |book|
		FayeUpdatesController.publish('/books/update', {id: book.id})
		puts "Observed update"
	end
end