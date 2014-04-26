var attr = DS.attr;

App.Event = DS.Model.extend({
  name: attr(),
  location: attr(),
  start: attr('date'),
  finish: attr('date')
});

export default App.Event;