Library.PatronsController = Ember.ArrayController.extend()

Library.PatronsNewController = Ember.ObjectController.extend
  save: ->
    @get('model').save().then =>
      @transitionToRoute('patrons.patron', @get('model'))

Library.PatronsPatronController = Ember.ObjectController.extend
  delete: ->
    @get('content').deleteRecord()
    @transitionToRoute('patrons')

  edit: ->
    @set 'isEditing', true

  saveEdit: ->
    @get('content').save().then =>
      @transitionToRoute('patrons.patron', @get('content'))
      @set 'isEditing', false

  cancelEdit: ->
    @set 'isEditing', false
    @get('content').reload()