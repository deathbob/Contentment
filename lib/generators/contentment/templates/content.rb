class Content < ActiveRecord::Base

# ADJUST_POSTIONS DOES NOT WORK RIGHT NOW
#	before_save :adjust_positions
	
	class << self; attr_accessor :tipes; end
  
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
  
  @tipes.each do |thing|
    scope "for_#{thing.downcase.gsub(' ', '_')}".intern, where("tipe = ?", thing)
  end

	scope :visible, lambda {|x| where(:visible => x)}


	def brothers
		Content.where("tipe = ?", self.tipe).where("id NOT in (#{self.id})")
	end

	private
  	def adjust_positions
	
			# return true unless changed.include?('position')
			# 
			# @contents = brothers.order('position ASC')
			# @contents.each_with_index do |x, idx|
			# 	unless x.position > self.position
			# 		if x.position
			# 			x.update_attribute :position, x.position + 1
			# 		else
			# 			x.update_attribute :position, self.position + idx
			# 		end
			# 	end
			# end
		end
		
		
end
