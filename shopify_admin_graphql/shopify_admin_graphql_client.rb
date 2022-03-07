require_relative "../core_graph_ql/graphql_client_factory"
require "byebug"

module ShopifyAdminGraphQL
  class ShopifyAdminGraphQLClient
    include CoreGraphQL::GraphQLClientFactory

    def access_token
      @access_token
    end

    def schema_url 
      "https://#{@shop_name}.myshopify.com/admin/api/#{@api_version}/graphql.json"
    end

    def initialize(shop_name, api_version, access_token, schema_out_file)
      @shop_name = shop_name
      @api_version = api_version
      @access_token = access_token
      @schema_out_file = schema_out_file
    end
    
    def client
      unless @client
        @client = new_graphql_client(schema_url, {"X-Shopify-Access-Token" => "#{access_token}"}, @schema_out_file)
        @client.allow_dynamic_queries = true
      end

      @client
    end

    def query (query, variables:, context:)
      actual_query = client.parse query
      client.query actual_query, variables: variables, context: context
    end
  end
end