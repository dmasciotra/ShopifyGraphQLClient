require_relative "./graphql_client_http_ex"
require "graphql/client"
require 'fileutils'

module CoreGraphQL
  module GraphQLClientFactory
    def new_graphql_client(schema_url, headers, schema_out_file)
      http = GraphQLClientHttpEx.new(schema_url, headers)    
      
      # Fetch latest schema on init, this will make a network request
      schema = GraphQL::Client.load_schema(http)
      
      if (schema_out_file)
        dirname = File.dirname(schema_out_file)        
        FileUtils.mkdir_p(dirname) unless File.directory?(dirname)

        FileUtils.touch(schema_out_file)
        GraphQL::Client.dump_schema(http, schema_out_file) if schema_out_file
      end
      
      GraphQL::Client.new(schema: schema, execute: http)
    end
  end
end