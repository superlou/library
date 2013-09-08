Library.BooksView = Em.View.extend
  didInsertElement: ->
    @$('.ember-list-view').slimScroll
      height: "auto"
      size: "14px"