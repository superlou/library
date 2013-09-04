Library.CheckoutController = Ember.ObjectController.extend
  book_code: ''
  patron_code: ''

  actions:
    save: ->
      @set 'model.status', 'out'

      @get('model').save().then(
        (val)=>
          @transitionToRoute('checkout')
          @set 'book_code', ''
          @set 'patron_code', ''
          @set 'model', Library.Checkout.create()
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