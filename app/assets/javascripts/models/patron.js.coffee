attr = Ember.attr
hasMany = Ember.hasMany

Library.Patron = Ember.Model.extend
  id: attr(Number)
  code: attr()
  name: attr()
  gender: attr()
  email: attr()

Library.Patron.url = '/patrons'
Library.Patron.adapter = Ember.RESTAdapter.create()