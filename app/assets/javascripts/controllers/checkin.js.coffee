Library.CheckinController = Ember.ArrayController.extend
  checkoutInfo: ''
  checkoutToLose: null

  init: ->
    @get('matchedCheckouts')

  matchedCheckouts: (->
    @get('model').filter (item, index, enumerable)=>
      info = @get('checkoutInfo').toLowerCase()
      book = item.get('book')
      patron = item.get('patron')

      return false if item.get('status') != 'out'

      if item.get('isFullyLoaded')
        book_full_title = book.get('full_title').toLowerCase()
        book_code = book.get('code').toLowerCase()
        patron_name = patron.get('name').toLowerCase()
        patron_code = patron.get('code').toLowerCase()

        return true if (book_full_title.indexOf(info) >= 0)
        return true if (book_code.indexOf(info) >= 0)
        return true if (patron_name.indexOf(info) >= 0)
        return true if (patron_code.indexOf(info) >= 0)

      false
  ).property('checkoutInfo', 'model.@each.isFullyLoaded', 'model.@each.status')

  actions:
    return: (checkout)->
      checkout.set('closed_at', moment())
      checkout.set('status', 'returned')
      checkout.save()
      @set('model', @get('store').find('checkout', {status: 'out'}))

    delete: (checkout)->
      checkout.deleteRecord()
      checkout.save()
      @set('model', @get('store').find('checkout', {status: 'out'}))

    setCheckoutToLose: (checkout)->
      @set('checkoutToLose', checkout)

    loseLostOnly: (checkout)->
      checkout.set('closed_at', moment())
      checkout.set('status', 'lost')
      checkout.save()

      @set('model', @get('store').find('checkout', {status: 'out'}))

    loseChangeStock: (checkout)->
      stock = checkout.get('book.stock')
      checkout.set('book.stock', stock - 1)
      checkout.get('book').save()

      checkout.set('closed_at', moment())
      checkout.set('status', 'lost')
      checkout.save()

      @set('model', @get('store').find('checkout', {status: 'out'}))