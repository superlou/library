require 'faye'
bayeux = Faye::RackAdapter.new mount: '/faye', timeout: 45
bayeux.listen(9292)