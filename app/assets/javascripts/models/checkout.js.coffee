attr = Ember.attr
hasMany = Ember.hasMany
belongsTo = Ember.belongsTo

Library.Checkout = Ember.Model.extend
  id: attr(Number)
  book: belongsTo('Library.Book', {key: 'book', embedded: true})
  patron: belongsTo('Library.Patron', {key: 'patron', embedded: true})
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
      diff = moment.duration(moment(@get('closed_at')).valueOf() - moment(@get('created_at')).valueOf())
      dur =  moment.duration(diff)
      return dur
    else if @get('created_at')
      diff = moment.duration(moment().valueOf() - moment(@get('created_at')).valueOf())
      dur =  moment.duration(diff)
      return dur
    else
      return null
  ).property('created_at', 'closed_at')

Library.Checkout.reopenClass
  findByInfo: (book_info, patron_info) ->
    @find('book_info:' + book_info)

Library.Checkout.url = '/checkouts'
Library.Checkout.adapter = Library.CheckoutAdapter.create()