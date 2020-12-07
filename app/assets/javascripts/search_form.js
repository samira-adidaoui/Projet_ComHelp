const search = instantsearch({
  indexName: 'instant_search',
  searchClient: algoliasearch(
    'application_id',
    'api_key'
  ),
});

instantsearch ({
  indexName : string ,
  searchClient : object ,
 // Paramètres optionnels 
 numberLocale : string ,
  searchFunction : function ,
  initialUiState : object ,
  onStateChange : function ,
  stalledSearchDelay : number ,
  routing : boolean | object ,
  insightsClient : function ,
});


search.start();