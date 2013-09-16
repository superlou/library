attr = Ember.attr

Library.Event = Ember.Model.extend
  id: attr(Number)
  name: attr()
  location: attr()
  start: attr(Date)
  finish: attr(Date)

Library.Event.url = '/events'
Library.Event.adapter = Ember.RESTAdapter.create()