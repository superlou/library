export default Ember.ArrayController.extend({
  filterQuery: '',

  filteredModel: function() {
    var _this = this;
    return this.get('model').filter(function (item, index, enumerable) {
      if (!item.get('isLoaded')) {
        return false;
      }
      return item.match_filter(_this.get('filterQuery'));
    });
  }.property('model.@each', 'filterQuery')
});

// Library.BooksIndexController = Ember.Controller.extend
//   needs: 'books'
//   books: Ember.computed.alias("controllers.books")

//   creationHistory: (->

//     counts = {}
//     @get('books').forEach (book)->
//       counts[book.get('created_at')] = 1 + (counts[book.get('created_at')] || 0)

//     countArray = []

//     for k, v of counts
//       item = [k, v]
//       countArray.push(item)

//     countArray
//   ).property('books', 'books.@each.isDone')

// Library.BooksSearchController = Ember.Controller.extend
//   search: ->
//     # this is waiting on QueryParams implementation
//     @transitionToRoute('books', {test: 'here'})
