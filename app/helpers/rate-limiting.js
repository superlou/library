// From http://alexspeller.com/2013/08/09/Debounced_and_Throttled_Observers_in_Ember.html
// todo Fix this

Ember.debouncedObserver = function(keys..., time, func) {
  Em.observer(function() {
    Em.run.debounce(this, func, time, keys...);
  });
}

Ember.throttledObserver = function(keys..., time, func) {
  Em.observer(function() {
    Em.run.throttle(this, func, time, keys...);
  });
}