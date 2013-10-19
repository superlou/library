#Library.Book.url = '/books'
#Library.Book.adapter = Library.RESTAdapter.create()

attr = DS.attr
hasMany = DS.hasMany

Library.Book = DS.Model.extend
  code: attr()
  volume: attr()
  stock: attr('number')
  title: attr()
  subtitle: attr()
  adult: attr('boolean')
  notes: attr()
  author: attr()
  created_at: attr('date')

  checkouts: hasMany('checkout')

  available: (->
    copies_out = @get('checkouts').filterProperty('status', 'out').get('length')
    @get('stock') - copies_out
  ).property('stock', 'checkouts.@each.status')

  notAvailable: (->
    not @get('available')
  ).property('available')

  full_title: (->
    volume = @get('volume')
    title = @get('title')

    if volume
      @get('title') + ", vol. " + volume
    else
      @get('title')

  ).property('title', 'volume')

  match_filter: (filter)->
    filter = filter.toLowerCase()
    full_title = @get('full_title').toLowerCase()

    if full_title.indexOf(filter) < 0
      return false

    true

  noStock: (->
    if @get('stock') <= 0 then return true else return false
  ).property('stock')

Library.Book.reopenClass
  findByCode: (code) ->
    @find('code:' + code)

  cloneVolumeFrom: (item) ->
    if parseInt(item.get('volume'))
      next_volume = parseInt(item.get('volume')) + 1
    else
      next_volume = undefined

    cloned_book_params = {
      title: item.get('title')
      notes: item.get('notes')
      adult: item.get('adult')
      volume: next_volume
    }

    return cloned_book_params