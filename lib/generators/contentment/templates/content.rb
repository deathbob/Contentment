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
			return true unless changed.include?('position')	
			return true unless brothers.map{|x| x.position}.include?(self.position)
			
			brothers.where("position < ?", self.position).update_all("position = (position - 1)")
			brothers.where("position >= ?", self.position).update_all("position = (position + 1)")
		end
		
		
end
