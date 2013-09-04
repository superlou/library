Library.PatronsController = Ember.ArrayController.extend()

Library.PatronsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save().then(
        (val)=> @transitionToRoute('patrons.patron', @get('model'))
        (err)=> @set 'errors', err
      )

  genders: (->
      ['', 'male', 'female', 'other']
  ).property()

Library.PatronsPatronController = Ember.ObjectController.extend
  actions:
    delete: ->
      @get('content').deleteRecord()
      @transitionToRoute('patrons')

    edit: ->
      @set 'isEditing', true

    saveEdit: ->
      @get('content').save().then(
        (val)=>
          @transitionToRoute('patrons.patron', @get('content'))
          @set 'isEditing', false
        (err)=> @set 'errors', err
      )

    cancelEdit: ->
      @set 'isEditing', false
      @get('content').reload()

  genders: (->
    ['', 'male', 'female', 'other']
  ).property()

  resetErrors: (->
      @set 'errors', null
    ).observes('isEditing')