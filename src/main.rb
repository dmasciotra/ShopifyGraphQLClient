require_relative "shopify_admin_graphql/shopify_admin_graphql_client"
require_relative "shopify_admin_graphql/products/mutations/create_product.rb"

shop_name = "<Your shop name>"
api_version = "2022-01"
access_token = "<Your access token" 
schema_out_file = "Optional: your output schema file"

# Example to create a product:

variables = {
  "input" => {
    "title" => "Product title"    
  }  
}

client = ShopifyAdminGraphQL::ShopifyAdminGraphQLClient.new(shop_name, api_version, access_token, schema_out_file)
result = client.query(ShopifyAdminGraphQL::Products::Mutations::CREATE_PRODUCT, variables: variables, context: {:access_token => access_token})