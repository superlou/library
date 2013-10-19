attr = DS.attr
belongsTo = DS.belongsTo

Library.Checkout = DS.Model.extend
  book: belongsTo('book')
  patron: belongsTo('patron')
  status: attr()
  closed_at: attr('date')
  created_at: attr('date')

  isFullyLoaded: (->
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