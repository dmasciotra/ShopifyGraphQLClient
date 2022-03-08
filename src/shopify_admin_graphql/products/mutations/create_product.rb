module ShopifyAdminGraphQL
  module Products
    module Mutations
      CREATE_PRODUCT = <<-GRAPHQL
        mutation($input: ProductInput!)	{
          productCreate(input:$input) {
            product {
                id
            }      
          }
        }
      GRAPHQL
    end
  end
end