export default Ember.ArrayController.extend({
  checkoutInfo: '',
  checkoutToLose: null,

  initAttributes: function() {
    this.get('matchedCheckouts');
  }.on('init'),

  matchedCheckouts: function() {
    var _this = this;

    return this.get('model').filter(function (item, index, enumerable) {
      var info = _this.get('checkoutInfo').toLowerCase();
      var book = item.get('book');
      var patron = item.get('patron');

      if (item.get('isFullyLoaded')) {

        if (item.get('status') != 'out') {
          return false;
        }

        var book_full_title = book.get('full_title').toLowerCase();
        var book_code = book.get('code').toLowerCase();
        var patron_name = patron.get('name').toLowerCase();
        var patron_code = patron.get('code').toLowerCase();

        if ((book_full_title.indexOf(info) >= 0)
            || (book_code.indexOf(info) >= 0)
            || (patron_name.indexOf(info) >= 0)
            || (patron_code.indexOf(info) >= 0)) {
          return true;
        }
      }

      return false;
    });
  }.property('checkoutInfo', 'model.@each.isFullyLoaded', 'model.@each.isDone', 'model.@each.status'),

  actions: {
    return: function(checkout) {
      checkout.set('closed_at', moment().toDate());
      checkout.set('status', 'returned');
      checkout.save();
    },

    delete: function(checkout) {
      checkout.deleteRecord();
      checkout.save();
    },

    setCheckoutToLose: function(checkout) {
      this.set('checkoutToLose', checkout);
    },

    loseLostOnly: function(checkout) {
      checkout.set('closed_at', moment().toDate());
      checkout.set('status', 'lost');
      checkout.save();
    },

    loseChangeStock: function(checkout) {
      var stock = checkout.get('book.stock');
      checkout.set('book.stock', stock - 1);
      checkout.get('book').save();

      checkout.set('closed_at', moment().toDate());
      checkout.set('status', 'lost');
      checkout.save();
    }
  }
});