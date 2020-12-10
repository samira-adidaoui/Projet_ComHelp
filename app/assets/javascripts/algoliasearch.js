const searchClient = algoliasearch('YourApplicationID', 'fbf1725475ec1845c71f24b6ee7fdf89');

const search = instantsearch({
  indexName: 'instant_search',
  searchClient,
});

search.addWidgets([
  instantsearch.widgets.searchBox({
    container: '#searchbox',
  }),

search.addWidgets([
instantsearch.widgets.refinementList({
    container: document.querySelector('#refinement-list'),
    attribute: 'post',
})

 
]);

search.start();
