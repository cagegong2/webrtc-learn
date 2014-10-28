Reflux = require("reflux")
Actions = require("./Actions")

module.exports = Reflux.createStore
	CLICK_RECOGNISED: 1

	init: () ->
		this._clicks = 0

		this.listenTo Actions.view.increment, this._click
		this.listenTo Actions.view.decrement, this._click
		this.listenTo Actions.view.reset, this._click

	_click: () ->
		this._clicks++
		this.trigger this.CLICK_RECOGNISED

	getClicks: () ->
		this._clicks

