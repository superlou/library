var Router = Ember.Router.extend({
  // Uncomment to change Ember's router to use the 
  // HTML5 History API
  // Please note that not all browsers support this!
  // You will also need to uncomment the greedy route matcher
  // in config/routes.rb

  // location: 'history'
});

Router.map(function() {
	this.resource('books', function() {
		this.resource('books.book', {path: ':book_id'});
		this.route('new');
		this.route('edit', {path: ':book_id/edit'});
		this.route('clone_volume', {path: ':book_id/clone_volume'})
	})

	this.resource('patrons', function() {
		this.resource('patrons.patron', {path: ':patron_id'});
		this.route('new');
		this.route('edit', {path: ':patron_id/edit'})
	})

	this.route('checkout'),
	this.route('checkin'),

	this.resource('settings', function() {
		this.route('general');
		this.route('events');
		this.route('checkout_log');
	})
});

export default Router;
