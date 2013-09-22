Library.SizingListView = Ember.ListView.extend
  didInsertElement: ->
    @_super()

    @$().slimScroll
      height: 'auto'
      size: "14px"

    $(window).resize =>
      @adjustSize()

    Ember.run.scheduleOnce('afterRender', this, 'adjustSize')

  adjustSize: ()->
    window_height = $(window).height()
    header_height = 150
    content_height = window_height - header_height

    @set('height', content_height)
    @$().parent('.slimScrollDiv').height(content_height)

    Ember.run.next this, ->
      @$().css('overflow','hidden')