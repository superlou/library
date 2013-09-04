Library.CheckinView = Em.View.extend
  didInsertElement: ->
    @$('button').click =>
      @$('#loseModal').modal('hide')