attr = Ember.attr
hasMany = Ember.hasMany

Library.Patron = Ember.Model.extend
  id: attr(Number)
  code: attr()
  name: attr()
  gender: attr()
  email: attr()
  notes: attr()
  adult: attr()
  keepCheckoutHistory: attr()

Library.Patron.camelizeKeys = true

Library.Patron.reopenClass
  findByCode: (code) ->
    @find('code:' + code)

Library.Patron.url = '/patrons'
Library.Patron.adapter = Library.RESTAdapter.create()