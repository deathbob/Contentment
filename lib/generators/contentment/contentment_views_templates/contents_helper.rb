module ContentsHelper

	# Is a helper really necessary?  Apparently I thought so at some point.
	# <%= f.select :tipe, content_tipe_options %>
	# When the helper is longer than what it replaces you've got a problem.  :P  
	def content_tipe_options
    Content.tipes
  end
end
