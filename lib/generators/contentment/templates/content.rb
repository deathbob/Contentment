class Content < ActiveRecord::Base

	before_save :adjust_positions
	
	
	class << self; attr_accessor :tipes; end
  
	# Put all the different kinds of content you will have in here to get a select helper and some named scopes 
	# generated for you. 
  @tipes = [
	# "Billboard",
	# "What You Learn",
	# "Tips",
	# "Questions Copy",
	# "FAQ",
	# "Examples",
	# "Testimonial",
	# "Navigation",
	]
  
	# Pretty much always want to only find content of one tipe at a time, so generate scopes for all tipes.
  @tipes.each do |thing|
    scope "for_#{thing.downcase.gsub(' ', '_')}".intern, where("tipe = ?", thing)
  end

	# It's pretty common to want the ability to hide some content.  Use the visible scope liberally.
	scope :visible, lambda {|x| where(:visible => x)}

	# Returns all Content with like tipe.
	def brothers
		Content.where("tipe = ?", self.tipe).where("id NOT in (#{self.id})")
	end

	private
		#  It's a pain with ordered content to have to manually update each piece of content when rearranging them.  
		#  adjust_positions will make sure when you change the position of one content, all other content of that tipe
		#  has position changed to keep a reasonable order.  
  	def adjust_positions
			return true unless changed.include?('position')	
			return true unless brothers.map{|x| x.position}.include?(self.position)
			
			brothers.where("position >= ?", self.position).update_all("position = (position + 1)")
		end
		
		
end
