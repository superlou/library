Library.BooksBookController = Ember.ObjectController.extend
  delete: ->
    @get('content').deleteRecord()
    @transitionToRoute('books')

  edit: ->
    @set 'isEditing', true

  saveEdit: ->
    @get('content').save().then =>
      @transitionToRoute('books.book', @get('content'))
      @set 'isEditing', false

  cancelEdit: ->
    @set 'isEditing', false
    @get('content').reload()