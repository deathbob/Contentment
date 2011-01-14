require 'test_helper'

class ContentTest < ActiveSupport::TestCase
	
	def setup
    @a = Content.create(:app_id => 1, :position => 1, :title => 'a', :tipe => 'test')
    @b = Content.create(:app_id => 1, :position => 2, :title => 'b', :tipe => 'test')
    @c = Content.create(:app_id => 1, :position => 3, :title => 'c', :tipe => 'test')
	end
  # Replace this with your real tests.
  test "content should fix position of other content with similar tipe on save" do
		@c.position = 1
		@c.save
		
		assert(@c.reload.position == 1)
		assert(@a.reload.position == 2)
		assert(@b.reload.position == 3)
  end

	test "saving multiple pieces of content things kind of escalate out of control ... " do 
		@a.position = 3
		@a.save		
		assert(3 == @a.reload.position)
		assert(2 == @b.reload.position)
		assert(4 == @c.reload.position)
		@b.position = 3
		@b.save
		assert(3 == @b.reload.position)
		assert(5 == @c.reload.position)
		assert(4 == @a.reload.position)

	end

end
