attr = Ember.attr
hasMany = Ember.hasMany
belongsTo = Ember.belongsTo

Library.Checkout = Ember.Model.extend
  id: attr(Number)
  book: belongsTo('Library.Book', {key: 'book_id'})
  patron: belongsTo('Library.Patron', {key: 'patron_id'})
  status: attr()
  closed_at: attr(Date)

Library.Checkout.url = '/checkouts'
Library.Checkout.adapter = Ember.RESTAdapter.create()