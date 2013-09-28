Library.SlugDefaultComponent = Ember.Component.extend
  displayedValue: (->
    if @get('value') then @get('value') else @get('default')
  ).property('value', 'default')