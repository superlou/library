Library.CheckoutsController = Ember.ArrayController.extend()

Library.CheckoutsNewController = Ember.ObjectController.extend
  book_id: ''
  patron_id: ''

  save: ->
    @set 'model.status', 'out'
    @set 'model.book', Library.Book.find(@get('book_id'))
    @set 'model.patron', Library.Patron.find(@get('patron_id'))

    @get('model').save().then =>
      @transitionToRoute('checkouts.checkout', @get('model'))

Library.CheckoutsCheckoutController = Ember.ObjectController.extend
  delete: ->
    @get('content').deleteRecord()
    @transitionToRoute('checkouts')