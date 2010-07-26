module HostRouter
  module Routing
    module RouteSet
      def self.included(base)
        base.send(:alias_method_chain, :extract_request_environment, :host_and_port)
      end

      def extract_request_environment_with_host_and_port(request)
        extract_request_environment_without_host_and_port(request).merge({
          :host   => (request.host || request.ip),
          :port   => request.port
        })
      end
    end

    module Route
      def self.included(base)
        base.send(:alias_method_chain, :recognition_conditions, :host_and_port)
      end

      def recognition_conditions_with_host_and_port
        result = recognition_conditions_without_host_and_port
        result << "conditions[:port] == env[:port]" if conditions[:port]
        result << "conditions[:host] == env[:host]" if conditions[:host]
        result
      end
    end
  end
end

ActionController::Routing::Route.send(:include, HostRouter::Routing::Route)
ActionController::Routing::RouteSet.send(:include, HostRouter::Routing::RouteSet)
