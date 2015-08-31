module RedirectWithParams
  class Railtie < Rails::Railtie
    initializer 'redirect_with_params.initialize' do
      require 'redirect_with_params/extensions'

      ActionDispatch::Routing.send(:include, RedirectWithParams::Extensions::Routing)
      ActionDispatch::Routing::Redirection.send(:include, RedirectWithParams::Extensions::Redirection)
    end
  end
end
