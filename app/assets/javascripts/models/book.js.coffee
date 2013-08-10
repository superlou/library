attr = Ember.attr
hasMany = Ember.hasMany

Library.Book = Ember.Model.extend
  id: attr(Number)
  code: attr()
  volume: attr()
  title: attr()
  adult: attr()
  notes: attr()

Library.Book.url = '/books'
Library.Book.adapter = Ember.RESTAdapter.create()