require_relative 'api.rb'

module Sample
  class Github < API
    class << self
      def search params = {}
        get(url('/search/repositories'),
            params,
            [],
            [:q,
             { sort: ['stars', 'forks', 'updated'] },
                order: ['asc', 'desc']])
      end

      private

        def url path
          'https://api.github.com' + path
        end
    end
  end
end
