attr = Ember.attr
hasMany = Ember.hasMany

Library.Book = Ember.Model.extend
  id: attr(Number)
  code: attr()
  volume: attr()
  stock: attr(Number)
  title: attr()
  subtitle: attr()
  adult: attr()
  notes: attr()
  author: attr()
  created_at: attr(Date)

  checkouts: hasMany('Library.Checkout',{key: 'checkout_ids'})

  available: (->
    copies_out = @get('checkouts').filterProperty('status', 'out').get('length')
    @get('stock') - copies_out
  ).property('stock', 'checkouts.@each.status')

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

  cloneVolumeFrom: (original_id) ->
    @fetch(original_id).then (item)->

      if parseInt(item.get('volume'))
        next_volume = parseInt(item.get('volume')) + 1
      else
        next_volume = undefined


      cloned_book = Library.Book.create
        title: item.get('title')
        notes: item.get('notes')
        adult: item.get('adult')
        volume: next_volume

      return cloned_book

Library.Book.url = '/books'
Library.Book.adapter = Library.RESTAdapter.create()