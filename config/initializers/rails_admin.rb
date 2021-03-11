RailsAdmin.config do |config|

  require Rails.root.join('lib', 'rails_admin', 'map.rb')
  RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Map)

  config.main_app_name = ["Rocket Elevators", "BackOffice"]

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # == CancanCan ==
  config.authorize_with :cancancan

  config.navigation_static_links = {
    'Home' => '/',
    'Blazer' => '/blazer',
  }

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    map

  end
end
