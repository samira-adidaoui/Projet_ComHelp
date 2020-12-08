module AlgoliaSearchable
  include AlgoliaSearch
  extend ActiveSupport::Concern
  SEARCH_INDEX_SETTINGS = {
       id: :search_id, # each item needs a unique id
       if: :search_indexable?, # each item should meet my criteria 
       index_name: "posts", # index at https://www.algolia.com/explorer
       per_environment: true, # index will be "post_" Rails.env
       sanitize: true
     }

   SEARCH_ATTRIBUTES = [
      :category,
      :city,
      :datetime
    ]

   # https://www.algolia.com/doc/api-client/ruby/parameters#attributestoindex
   SEARCH_ATTRIBUTES_TO_INDEX = [
     'category',
     'city',
     'datetime'
   ]

   # https://www.algolia.com/doc/api-client/ruby/parameters#attributestoretrieve
   SEARCH_ATTRIBUTES_TO_RETRIEVE = [
     'category',
     'city',
     'datetime'
   ]

  included do
    algoliasearch AlgoliaSearchable::SEARCH_INDEX_SETTINGS do
      attribute AlgoliaSearchable::SEARCH_ATTRIBUTES
      attributesToIndex AlgoliaSearchable::SEARCH_ATTRIBUTES_TO_INDEX
      attributesToRetrieve AlgoliaSearchable::SEARCH_ATTRIBUTES_TO_RETRIEVE
    end
  end

  def search_id
    "Post_#{id}"
  end

  def search_indexable?
    # only add to the index records which have a name and a symbol and an id
    category && city && id ? true : false
  end
end