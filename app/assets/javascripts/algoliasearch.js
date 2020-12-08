
  $(document).ready(function() {
    
    const search = instantsearch({
      appId: ENV['ALGOLIASEARCH_APPLICATION_ID'],
      apiKey: ENV['ALGOLIASEARCH_API_KEY_SEARCH'],
      indexName: 'posts',
      urlSync: true
    });

    search.addWidget(
      instantsearch.widgets.searchBox({
        container: '#searchbox',
        placeholder: 'Rechercher une annonce',
        autofocus: false,
        poweredBy: true
      })
    );

    search.addWidget(
      instantsearch.widgets.hits({
        container: '#hits',
        templates: {
          empty: 'Aucun résultat',
          item: hitTemplate
        },
        hitsPerPage: 10
      })
    );

    search.addWidget(
      instantsearch.widgets.refinementList({
        container: '#category',
        attributeName: 'category',
        limit: 10,
        templates: {
          header: 'Categories'
        },
        cssClasses: {
          root: 'list-group',
          item: 'list-group-item',
          count: 'badge pull-right'
        }
      })
    );

    search.start();
  });



