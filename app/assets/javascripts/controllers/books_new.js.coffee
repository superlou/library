Library.BooksNewController = Ember.ObjectController.extend
  save: ->
    @get('model').save().then =>
      @transitionToRoute('books.book', @get('model'))