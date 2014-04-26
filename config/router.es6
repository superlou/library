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

	this.resource('checkouts', function() {
		this.resource('checkouts.checkout', {path: ':checkout_id'});
		this.route('new');
	}),

	this.route('checkout'),
	this.route('checkin'),

	this.resource('settings', function() {
		this.route('general');
		this.route('events');
	})
});

export default Router;

// Library.PatronsRoute = Ember.Route.extend
//   setupController: (controller)->
//     controller.set 'model', @get('store').findAll('patron')

// Library.PatronsNewRoute = Ember.Route.extend
//   model: (params)->
//     @get('store').createRecord 'patron',
//       { keepCheckoutHistory: true }

// Library.CheckoutsRoute = Ember.Route.extend
//   model: (params)->
//     @get('store').findAll('checkout')

// Library.CheckoutsNewRoute = Ember.Route.extend
//   setupController: (controller)->
//     controller.set('book_code', '')
//     controller.set('patron_code', '')
//     controller.set('model', @get('store').createRecord('checkout', {}))

// Library.CheckoutRoute = Ember.Route.extend
//   setupController: (controller, context, queryParams)->
//     controller.set('model', @get('store').createRecord('checkout', {}))
//     controller.set('book_code', queryParams.bookCode)
//     controller.set('patron_code', '')

// Library.CheckinRoute = Ember.Route.extend
//   setupController: (controller)->
//     @get('store').find('checkout', {status: 'out'})
//     controller.set 'model', @get('store').filter('checkout', (item)->
//       item.get('isOpen')
//     )


// Library.SettingsEventsRoute = Ember.Route.extend
//   model: (params)->
//     @get('store').findAll('event')