export default Ember.ArrayController.extend({
  filterQuery: '',

  filteredModel: function() {
    var _this = this;

    return this.get('model').filter(function (item, index,enumerable) {
      if (!item.get('isLoaded')) {
        return false;
      }

      return item.match_filter(_this.get('filterQuery'));
    });
  }.property('model.@each.isLoaded', 'filterQuery')
});
