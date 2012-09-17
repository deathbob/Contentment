require "contentment"
require "rails"
#require "action_controller"

# http://edgeapi.rubyonrails.org/classes/Rails/Engine.html
module Contentment
  class Engine < Rails::Engine
    # are these not used? engine_name, railtie_name
    # engine_name "contentment"

    # # We can add all of the public assets from our engine and make them
    # # available to use.  This allows us to use javascripts, images, stylesheets
    # # etc.
    # initializer "static assets" do |app|
    #   app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    # end

  end
end
