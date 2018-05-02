require 'rest-client'
require 'json'

module Sample
  class API
    class << self
      def get path, params = {}, required_params = [], all_params = []
        show_params(params, path, required_params, all_params) do
          response = RestClient.get path, params: params, user_agent: user_agent
          parse_response response
        end
      end

      private

        def show_params tag, path, required_params, all_params, &block
          if tag == :path
            path
          elsif tag == :required
            hash_params *required_params
          elsif tag == :all
            hash_params *(required_params+all_params)
          else
            block.call
          end
        end

        def hash_params *params
          params.map! { |e| e.is_a?(Hash) ? e : { e => "string" } }
          params.compact.reduce(&:merge)
        end

        def parse_response plain
          plain.to_s.empty? ? nil : JSON.parse(plain)
        rescue JSON::ParserError
          plain
        end

        def user_agent
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) '\
          'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 '\
          'Safari/605.1.15'
        end
    end
  end
end
