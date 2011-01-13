require 'rails/generators'
require 'rails/generators/migration'

class ContentmentGenerator < Rails::Generators::Base
	desc "This generator creates the contents model and table"
  include Rails::Generators::Migration

  def self.source_root
	# This must be defined.  It tells the generator where to find the template for your migration.
    File.join(File.dirname(__FILE__), 'contentment/templates')
  end

  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

	def install
		content_model = "app/models/content.rb"		
		if File.exists?(content_model)
			puts "Well, Fuck."
			# Need to figure out how to ask the user if they would like to overwrite their model.
		else
			template 'content.rb', content_model
			template 'content_test.rb', 'test/unit/content_test.rb'
		end
		
		contents_controller = 'app/controllers/contents_controller.rb'
		if File.exists?(contents_controller)
			puts "Damn, him too?"
			# Again, figure out how to ask the user if they want to overwrite it. 
		else
			template 'contents_controller.rb', contents_controller
		end
	end

  # This method is pulling all of the migration data from the migration.rb template.
  # After it pulls the migration date, it generates a migration in the main application
  # called create_contents...
  # You can change the name of this if and when you make your own engine.
  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_contents.rb'
  end
end