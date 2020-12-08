var search = instantsearch({
  // Replace with your own values
  appId: "",
  apiKey: '', // search only API key, no ADMIN key
  indexName: 'Posts',
  urlSync: true
});


search.addWidget(
  instantsearch.widgets.searchBox({
    container: '#search-input',
    placeholder: 'Rechercher une annonce',
    poweredBy: true
  })
);

instantsearch.widgets.refinementList({
  container: '#room_types',
  attribute: 'room_type',
  sortBy: ['name:asc'],
  cssClasses: {
    item: ['col-sm-3'],
  },
}),

search.addWidget(
  instantsearch.widgets.hits({
    container: '#posts',
    hitsPerPage: 10,
    templates: {
      item: '{{#helpers.highlight}}{ "attribute": "title" }{{/helpers.highlight}}',
      empty: getTemplate('no-results')
    }
  })
);

instantsearch.widgets.geoSearch({
  container: '#geo-search',
  googleReference: window.google,
});

instantsearch.widgets.pagination({
  container: document.querySelector('#pagination'),
});


search.start();

function getTemplate(templateName) {
  return document.querySelector('#' + templateName + '-template').innerHTML;
}