require 'action_dispatch/routing'
require 'action_dispatch/routing/redirection'

module RedirectWithParams
  module Extensions

    module Routing
      class ParamPreservingRedirect < ActionDispatch::Routing::Redirect
        attr_reader :permitted_params
        def initialize(status, query_params = [], block)
          @permitted_params = query_params
          @permitted_params.map! { |k| k.to_sym }
          super(status, block)
        end

        def path(params, request)
          path_builder = block.call(params, request)

          allowed_keys = permitted_params
          allowed_keys = request.params.keys.map(&:to_sym) if permitted_params.empty?
          allowed_keys -= params.keys(&:to_sym)

          allowed_params = request.params.select { |k,v| allowed_keys.include?(k.to_sym) }
          path_builder << "?" << allowed_params.to_query unless allowed_params.empty?

          path_builder
        end
      end
    end

    module Redirection
      def redirect_with_params(*args, &block)
        options = args.extract_options!
        status  = options.delete(:status) || 301
        RedirectWithParams::Extensions::Routing::ParamPreservingRedirect.new(status, args.to_a, block)
      end
    end

  end
end
