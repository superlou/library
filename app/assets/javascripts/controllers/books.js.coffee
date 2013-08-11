Library.BooksController = Ember.ArrayController.extend()

Library.BooksBookController = Ember.ObjectController.extend
  delete: ->
    @get('content').deleteRecord()
    @transitionToRoute('books')

  edit: ->
    @set 'isEditing', true

  saveEdit: ->
    @get('content').save().then(
      (val)=>
        @transitionToRoute('books.book', @get('content'))
        @set 'isEditing', false
      (err)=> @set 'errors', err
    )

  cancelEdit: ->
    @set 'isEditing', false
    @get('content').reload()

  resetErrors: (->
    @set 'errors', null
  ).observes('isEditing')

Library.BooksNewController = Ember.ObjectController.extend
  save: ->
    @get('model').save().then(
      (val)=> @transitionToRoute('books.book', @get('model'))
      (err)=> @set 'errors', err
    )
