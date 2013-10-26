Library.CheckoutController = Ember.ObjectController.extend
  actions:
    save: ->
      @set 'model.status', 'out'

      @get('model').save().then(
        (val)=>
          @transitionToRoute('checkout')
          @set 'book_code', ''
          @set 'patron_code', ''
          @set 'model', @get('store').createRecord('checkout')
        (err)=> @set 'errors', err
      )

  set_model_book: (->
    if @get('book_code')
      @get('store').find('book', "code:" +@get('book_code')).then(
        (book)=>
          @set 'model.book', book
        (err)=>
          @set 'model.book', null
        )
    else
      @set 'model.book', null
      return
  ).observes('book_code')

  set_model_patron: (->
    if @get('patron_code')
      @get('store').find('patron', "code:" +@get('patron_code')).then(
        (patron)=>
          @set 'model.patron', patron
        (err)=>
          @set 'model.patron', null
      )
    else
      @set 'model.patron', null
      return
  ).observes('patron_code')

  saveDisabled: (->
    return not @get('model.isFullyLoaded')
  ).property('model.isFullyLoaded')