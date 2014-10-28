# @jsx React.DOM

React = require "react"
Actions = require "./Actions.coffee"

Example = React.createClass
	render: ->
		<button onClick={this._onClick}>{this.props.label}</button>

	_onClick: ->
		Actions.view[this.props.action]()

module.exports = Example