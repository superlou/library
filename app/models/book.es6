//Library.Book.url = '/books'
//Library.Book.adapter = Library.RESTAdapter.create()

var attr = DS.attr;
var hasMany = DS.hasMany;

App.Book = DS.Model.extend({
  code: attr(),
  volume: attr(),
  stock: attr('number'),
  title: attr(),
  subtitle: attr(),
  adult: attr('boolean'),
  notes: attr(),
  author: attr(),
  created_at: attr('date'),

  checkouts: hasMany('checkout', {async: true}),

  available: function() {
    var copies_out = this.get('checkouts').filterProperty('status', 'out').get('length');
    return this.get('stock') - copies_out;
  }.property('stock', 'checkouts.@each.status'),

  notAvailable: function() {
    return !this.get('available');
  }.property('available'),

  full_title: function() {
    var volume = this.get('volume')
    var title = this.get('title')

    if (volume) {
      return this.get('title') + ", vol. " + volume
    } else {
      return this.get('title')
    }

  }.property('title', 'volume'),

  match_filter: function(filter) {
    var filter = filter.toLowerCase();
    var full_title = this.get('full_title').toLowerCase();

    return (full_title.indexOf(filter) >= 0);
  },

  noStock: function() {
    if (this.get('stock') <= 0) {
      return true;
    } else {
      return false;
    }
  }.property('stock')
});

App.Book.reopenClass({
  findByCode: function(code) {
    return this.find('code:' + code);
  },

  cloneVolumeFrom: function(item) {
    console.log(item);
    var next_volume = undefined;

    if (parseInt(item.get('volume'))) {
      next_volume = parseInt(item.get('volume')) + 1;
    }

    var cloned_book_params = {
      title: item.get('title'),
      notes: item.get('notes'),
      adult: item.get('adult'),
      volume: next_volume
    }

    return cloned_book_params;
  }
});

export default App.Book;