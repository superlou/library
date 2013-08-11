attr = Ember.attr
hasMany = Ember.hasMany

Library.Book = Ember.Model.extend
  id: attr(Number)
  code: attr()
  volume: attr()
  stock: attr(Number)
  title: attr()
  adult: attr()
  notes: attr()

  full_title: (->
    volume = @get('volume')

    if volume
      @get('title') + ", vol. " + volume
    else
      @get('title')

  ).property('title', 'volume')

Library.Book.reopenClass
  findByCode: (code) ->
    @find('code:' + code)


Library.Book.url = '/books'
Library.Book.adapter = Library.RESTAdapter.create()