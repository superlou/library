Library.CheckinView = Em.View.extend
  didInsertElement: ->
    @$('#loseCheckoutDialog button').click =>
      @$('#loseCheckoutDialog').foundation('reveal','close')