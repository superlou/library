#Library.RESTAdapter = Ember.RESTAdapter.extend
#  didFind: (record, id, data)->
#    rootKey = Ember.get(record.constructor, 'rootKey')
#    dataToLoad = if rootKey then data[rootKey] else data
#
#    if /^code:/.test(id)
#      id = dataToLoad.id
#
#    record.load(id, dataToLoad)
#
#Library.CheckoutAdapter = Ember.RESTAdapter.extend()

Library.ApplicationAdapter = DS.ActiveModelAdapter.extend
  find: (store, type, id)->
    @ajax(@buildURL(type.typeKey, id), 'GET')