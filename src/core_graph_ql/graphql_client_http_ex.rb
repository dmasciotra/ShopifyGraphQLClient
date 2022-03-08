require "graphql/client/http"

#forced to do this to have better control on setting headers for the GraphQL::Client::HTTP
module CoreGraphQL
  class GraphQLClientHttpEx < GraphQL::Client::HTTP
    def initialize(url, headers)
      @headers = headers
      super url
    end

    def headers(context)
      @headers
    end
  end
end