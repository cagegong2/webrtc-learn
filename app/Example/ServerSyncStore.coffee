Reflux = require("reflux")
Actions = require("./Actions")

module.exports = Reflux.createStore
	SENDING_STARTED: 1
	SENDING_ACKNOWLEDGED: 2
	UPDATE_RECEIVED: 3

	init: () ->
		Actions.view.increment.listen this._increment
		Actions.view.decrement.listen this._decrement
		Actions.view.reset.listen this._reset
		# TODO: Listen on server changes => this._serverUpdate
		# TODO: Request initial

	_increment: (source) ->
		# TODO: Send to server...
		# TODO: this.trigger(this.SENDING_STARTED) and isSyncing() === true
		# TODO: this.trigger(this.SENDING_ACKNOWLEDGED) and isSyncing() === false

	_decrement: (source) ->
		# TODO: Send to server...

	_reset: (source) ->
		# TODO: Send to server...

	_serverUpdate: (value) ->
		Actions.server.update value
		this.trigger this.UPDATE_RECEIVED

	isInitiallyLoaded: () ->
		# TODO return false during initial load
		true

	isSyncing: () ->
		# TODO return true while syncing
		false

