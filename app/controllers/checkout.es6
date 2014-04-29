// # Library.CheckoutController = Ember.ObjectController.extend
// #   actions:
// #     save: ->
// #       @set 'model.status', 'out'

// #       @get('model').save().then(
// #         (val)=>
// #           @transitionToRoute('checkout')
// #           @set 'book_code', ''
// #           @set 'patron_code', ''
// #           @set 'model', @get('store').createRecord('checkout')
// #         (err)=> @set 'errors', err
// #       )

// #   set_model_book: (->
// #     if @get('book_code')
// #       @get('store').find('book', "code:" +@get('book_code')).then(
// #         (book)=>
// #           @set 'model.book', book
// #         (err)=>
// #           @set 'model.book', null
// #         )
// #     else
// #       @set 'model.book', null
// #       return
// #   ).observes('book_code')

// #   set_model_patron: (->
// #     if @get('patron_code')
// #       @get('store').find('patron', "code:" +@get('patron_code')).then(
// #         (patron)=>
// #           @set 'model.patron', patron
// #         (err)=>
// #           @set 'model.patron', null
// #       )
// #     else
// #       @set 'model.patron', null
// #       return
// #   ).observes('patron_code')

// #   saveDisabled: (->
// #     return not @get('model.isFullyLoaded')
// #   ).property('model.isFullyLoaded')

export default Ember.ObjectController.extend({
	actions: {
		save: function() {
			this.set('model.status', 'out');

			var _this = this;
			this.get('model').save().then(function(val) {
				_this.transitionToRoute('checkout');
				_this.set('model', _this.get('store').createRecord('checkout'));
				_this.set('book_code', '');
				_this.set('patron_code', '');
			}, function (err) {});
		}
	},

	set_model_book: function() {
		if (this.get('book_code')) {
			var _this = this;
			var book = this.get('store').find('book', 'code:' + this.get('book_code'))
			book.then(function(book) {
				_this.set('model.book', book);
			}, function (err) {
				_this.set('model.book', null);
			});
		} else {
			this.set('model.book', null);
		}
	}.observes('book_code'),

	set_model_patron: function() {
		if (this.get('patron_code')) {
			var _this = this;
			var patron = this.get('store').find('patron', 'code:' + this.get('patron_code'))
			patron.then(function(patron) {
				_this.set('model.patron', patron);
			}, function (err) {
				_this.set('model.patron', null);
			});
		} else {
			this.set('model.patron', null);
		}
	}.observes('patron_code'),

	saveDisabled: function() {
		return !this.get('model.isFullyLoaded');
	}.property('model.isFullyLoaded')
});