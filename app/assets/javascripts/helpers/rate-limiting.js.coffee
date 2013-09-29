# From http://alexspeller.com/2013/08/09/Debounced_and_Throttled_Observers_in_Ember.html

Ember.debouncedObserver = (keys..., time, func) ->
  Em.observer ->
    Em.run.debounce @, func, time
  , keys...

Ember.throttledObserver = (keys..., time, func) ->
  Em.observer ->
    Em.run.throttle @, func, time
  , keys...