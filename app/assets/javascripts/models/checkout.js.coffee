attr = Ember.attr
hasMany = Ember.hasMany
belongsTo = Ember.belongsTo

Library.Checkout = Ember.Model.extend
  id: attr(Number)
  book: belongsTo('Library.Book', {key: 'book_id'})
  patron: belongsTo('Library.Patron', {key: 'patron_id'})
  status: attr()
  closed_at: attr(Date)
  created_at: attr(Date)

  isValid: (->
    if @get('book.isLoaded') and @get('patron.isLoaded')
      return true

    return false
  ).property('book.isLoaded', 'patron.isLoaded')

  isOpen: (->
    if @get('status') == "out" then true else false
  ).property('status')

  duration: (->
    if @get('created_at') and @get('closed_at')
      delta =  moment.duration(@get('closed_at')).subtract moment.duration(@get('created_at'))
      return delta
    else
      return null
  ).property('created_at', 'closed_at')

Library.Checkout.url = '/checkouts'
Library.Checkout.adapter = Library.RESTAdapter.create()