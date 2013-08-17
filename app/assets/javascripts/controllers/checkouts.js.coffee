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
    @get('model').deleteRecord()
    @transitionToRoute('checkouts')

  return: ->
    @set('model.closed_at', moment())
    @set('model.status', 'returned')
    @get('model').save()

  reopen: ->
    @set('model.closed_at', null)
    @set('model.status', 'out')
    @get('model').save()

  lose: ->
    @set('showLoseDialog', true)

  loseOnly: ->
    @set('showLoseDialog', false)
    @set('model.closed_at', moment())
    @set('model.status', 'lost')
    @get('model').save()

  loseChangeStock: ->
    @set('showLoseDialog', false)

    stock = @get('model.book.stock')
    @set('model.book.stock', stock - 1)
    @get('model.book').save()

    @set('model.closed_at', moment())
    @set('model.status', 'lost')
    @get('model').save()

  loseCancel: ->
    @set('showLoseDialog', false)