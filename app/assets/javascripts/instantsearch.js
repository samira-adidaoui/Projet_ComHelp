var search = instantsearch({
  // Replace with your own values
  appId: "1JJ5DY0CLA",
  apiKey: 'e24882443747d61c496efc4e17288a36', // search only API key, no ADMIN key
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



search.start();

function getTemplate(templateName) {
  return document.querySelector('#' + templateName + '-template').innerHTML;
}