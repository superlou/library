attr = DS.attr
hasMany = DS.hasMany

Library.Patron = DS.Model.extend
  code: attr()
  name: attr()
  gender: attr()
  email: attr()
  notes: attr()
  adult: attr()
  keepCheckoutHistory: attr()

  checkouts: DS.hasMany('checkout')

  match_filter: (filter)->
    filter = filter.toLowerCase()
    name = @get('name').toLowerCase()

    if name.indexOf(filter) < 0
      return false

    true

Library.Patron.camelizeKeys = true

Library.Patron.reopenClass
  findByCode: (code) ->
    @find('code:' + code)

#Library.Patron.url = '/patrons'
#Library.Patron.adapter = Library.RESTAdapter.create()