require 'rails/generators'

class ContentmentViewsGenerator < Rails::Generators::Base
  desc "This generator creates the views for Contentment"

  def self.source_root
    File.join(File.dirname(__FILE__), 'contentment/contentment_views_templates')
  end

  def install
    puts "Installing Views"
    template 'contents_helper.rb', 'app/helpers/contents_helper.rb'
    directory 'contents', 'app/views/contents'
  end

end