module ShopifyAdminGraphQL
  module Products
    module Mutations
      PUBLISHABLE_PUBLISH = <<-GRAPHQL
        mutation($id: ID!, $input: [PublicationInput!]!)	{
          publishablePublish(id: $id, input:$input) {
            publishable {
                resourcePublicationsV2(first: 10) {
                  edges {
                    node {
                      publication {
                        name
                      }
                    }
                  }
                }                     
            }
            userErrors {
              message
            }             
          }
        }
      GRAPHQL
    end
  end
end