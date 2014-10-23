Reflux = require "reflux"

Actions = module.exports = Reflux.createActions [
	"applyOffset"
	"set"
]

Actions.view = Reflux.createActions [
	"increment"
	"decrement"
	"reset"
]

Actions.server = Reflux.createActions [
	"update"
]

# Hooks
Actions.set.shouldEmit = (value) ->
	Math.floor(value) is value


# View actions
Actions.view.reset.listen -> 
	Actions.set 0


Actions.view.increment.listen -> 
	Actions.applyOffset 1


Actions.view.decrement.listen ->
	Actions.applyOffset -1

# Server actions

Actions.server.update.listen ->
	Actions.set value

