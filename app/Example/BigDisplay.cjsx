# @jsx React.DOM

React = require "react"
Reflux = require "reflux"
ClicksStore = require "./ClicksStore"

BigDisplay = React.createClass

	mixins: [Reflux.ListenerMixin]

	getInitialState: ->
		clicks: ClicksStore.getClicks()

	componentDidMount: ->
		this.listenTo ClicksStore, this._onChange

	_onChange: ->
		this.setState this.getInitialState()

	render: ->
		<span>Yeah! <strong>{this.props.value}</strong> is really big. You clicked <i>{this.state.clicks}</i> times.</span>

module.exports = BigDisplay