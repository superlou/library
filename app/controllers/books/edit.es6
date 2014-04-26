export default Ember.ObjectController.extend({
  actions: {
    save: function() {
    	var _this = this;

      this.get('content').save().then(
        function(val) {
          _this.transitionToRoute('books.book', _this.get('content'));
        },
        function(err) {}
      )
    },

    cancel: function() {
      this.get('content').rollback()
      this.transitionToRoute('books.book', this.get('content'))
    }
  }
});