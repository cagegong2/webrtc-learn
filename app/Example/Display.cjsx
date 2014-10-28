# @jsx React.DOM

React = require "react"
Reflux = require "reflux"
ValueStore = require "./ValueStore"
BigDisplay = require "react-proxy!./BigDisplay"

Display = React.createClass
	mixins: [Reflux.ListenerMixin]

	getInitialState: ->
		value: ValueStore.getValue()

	componentDidMount: ->
		this.listenTo ValueStore, this._onChange

	_onChange: ->
		this.setState this.getInitialState()

	render: ->
		if this.state.value < 10
			<span><strong>{this.state.value}</strong> (Try to get 10 or more)</span>
		else
			# BigDisplay loads on demand because of "react-proxy"
			<BigDisplay value={this.state.value}/>

module.exports = Display