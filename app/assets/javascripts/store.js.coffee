# http://emberjs.com/guides/models/defining-a-store/

Library.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()

