var attr = DS.attr;
var belongsTo = DS.belongsTo;

App.Checkout = DS.Model.extend({
  book: belongsTo('book'),
  patron: belongsTo('patron'),
  status: attr(),
  closed_at: attr('date'),
  created_at: attr('date'),

  isFullyLoaded: function() {
    if (this.get('book.isLoaded') && this.get('patron.isLoaded')) {
      return true;
    }

    return false;
  }.property('book.isLoaded', 'patron.isLoaded'),

  isOpen: function() {
    return (this.get('status') == "out");
  }.property('status'),

  duration: function() {
    if (this.get('created_at') && this.get('closed_at')) {
      var diff = moment.duration(moment(this.get('closed_at')).valueOf() - moment(this.get('created_at')).valueOf());
      var dur =  moment.duration(diff);
      return dur
    } else if (this.get('created_at')) {
      var diff = moment.duration(moment().valueOf() - moment(this.get('created_at')).valueOf());
      var dur =  moment.duration(diff);
      return dur;
    } else {
      return null;
    }
  }.property('created_at', 'closed_at')
});

App.Checkout.reopenClass({
  findByInfo: function(book_info, patron_info) {
    return this.find('book_info:' + book_info);
  }
});

export default App.Checkout;