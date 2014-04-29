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