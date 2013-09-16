Library.EventController = Ember.ObjectController.extend
  needs: 'settingsEvents'
  events: Ember.computed.alias('controllers.settingsEvents')

  isEditing: (->
    @get 'isNew'
  ).property('isNew')

  isExisting: (->
    not @get('isNew')
  ).property('isNew')

  actions:
    edit: ->
      @set('isEditing', true)

    cancel: ->
      if @get('isNew')
        @get('events').removeObject(@get('model'))
      else
        @get('model').reload()

      @set('isEditing', false)

    save: ->
      @get('model').save().then =>
        @set('isEditing', false)
        @get('events.model').reload()

    delete: ->
      @get('model').deleteRecord()
