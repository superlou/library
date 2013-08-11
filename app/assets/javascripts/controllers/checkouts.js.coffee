Library.CheckoutsController = Ember.ArrayController.extend()

Library.CheckoutsNewController = Ember.ObjectController.extend
  book_code: ''
  patron_code: ''

  save: ->
    @set 'model.status', 'out'

    @get('model').save().then(
      (val)=>
        @transitionToRoute('checkouts.checkout', @get('model'))
      (err)=> @set 'errors', err
    )

  set_model_book: (->
    book = Library.Book.findByCode(@get('book_code'))
    @set 'model.book', book
  ).observes('book_code')

  set_model_patron: (->
    patron = Library.Patron.findByCode(@get('patron_code'))
    @set 'model.patron', patron
  ).observes('patron_code')

  saveDisabled: (->
    return not @get('model.isValid')
  ).property('model.isValid')

Library.CheckoutsCheckoutController = Ember.ObjectController.extend
  delete: ->
    @get('content').deleteRecord()
    @transitionToRoute('checkouts')

  return: ->
    @set('content.closed_at', moment())
    @set('content.status', 'returned')
    @get('content').save()

  reopen: ->
    @set('content.closed_at', null)
    @set('content.status', 'out')
    @get('content').save()

  lose: ->
    @set('showLoseDialog', true)

  loseOnly: ->
    @set('showLoseDialog', false)
    @set('content.closed_at', moment())
    @set('content.status', 'lost')
    @get('content').save()

  loseChangeStock: ->
    @set('showLoseDialog', false)

    stock = @get('content.book.stock')
    @set('content.book.stock', stock - 1)
    @get('content.book').save()

    @set('content.closed_at', moment())
    @set('content.status', 'lost')
    @get('content').save()

  loseCancel: ->
    @set('showLoseDialog', false)