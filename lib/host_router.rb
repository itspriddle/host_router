module ActionController
  module Routing
    class RouteSet
      def extract_request_environment(request)
        { :method => request.method, :host => request.host || request.ip }
      end
    end
    class Route
      alias_method :old_recognition_conditions, :recognition_conditions
      def recognition_conditions
        result = old_recognition_conditions
        result << "conditions[:host] == env[:host]" if conditions[:host]
        result << "conditions[:hosts].to_a.include?(env[:host])" if conditions[:hosts]
        result
      end
    end
  end
end
