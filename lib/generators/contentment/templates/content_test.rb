require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "content should fix position on save" do
    a = Content.create(:position => 1, :title => 'a', :tipe => 'test')
    b = Content.create(:position => 2, :title => 'b', :tipe => 'test')
    c = Content.create(:position => 3, :title => 'c', :tipe => 'test')
		c.position = 1
		c.save
		
		assert(c.reload.position == 1)
		assert(a.reload.position == 2)
		assert(b.reload.position == 3)
  end
end
