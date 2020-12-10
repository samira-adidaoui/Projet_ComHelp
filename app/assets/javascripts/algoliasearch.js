
const searchClient =algoliasearch('XRDT1NI3ZK','fbf1725475ec1845c71f24b6ee7fdf89');

const search = instantsearch({
  indexName: 'Post_development',
  searchClient,
});

search.addWidgets([
  instantsearch.widgets.searchBox({
    container: '#searchbox',
  }),
  instantsearch.widgets.clearRefinements({
    container: '#clear-refinements',
  }),
  instantsearch.widgets.refinementList({
    container: '#category-list',
    attribute: 'category',
  }),
  instantsearch.widgets.hits({
    container: '#hits',
    templates: {
      item: `
        
      `,
    },
  }),
  instantsearch.widgets.pagination({
    container: '#pagination',
  }),
]);

search.start();

