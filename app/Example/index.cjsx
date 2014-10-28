# @jsx React.DOM

React = require "react"

Display = require "./Display"
Control = require "./Control"

Example = React.createClass
	render: ->
		require "./style.less"
		<div className="module-example"><Display /><div><Control action="increment" label="+1" /><Control action="decrement" label="-1" /><Control action="reset" label="Reset" /></div></div>

module.exports = Example