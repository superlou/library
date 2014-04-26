var attr = DS.attr;
var hasMany = DS.hasMany;

App.Patron = DS.Model.extend({
  code: attr(),
  name: attr(),
  gender: attr(),
  email: attr(),
  notes: attr(),
  adult: attr(),
  keepCheckoutHistory: attr(),

  checkouts: DS.hasMany('checkout'),

  match_filter: function(filter) {
    var filter = filter.toLowerCase();
    var name = this.get('name').toLowerCase();

    return (name.indexOf(filter) >= 0)
  }
});

App.Patron.camelizeKeys = true;

App.Patron.reopenClass({
  findByCode: function(code) {
    return this.find('code:' + code);
  }
});

export default App.Patron;