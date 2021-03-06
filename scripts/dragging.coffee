###
dragging = null
constraint = null
mouse = x: 0, y: 0

window.addEventListener 'mousemove', (e)->
	mouse.x = e.clientX # / view.scale
	mouse.y = e.clientY # / view.scale

window.addEventListener 'mousedown', (e)->
	destroy constraint
	dragging = nearest Point, from: mouse
	constraint = new Constraint(mouse, dragging)
	constraint.color = "red"
	constraint.draw = ->
		ctx.save()
		ctx.setLineDash? [5,5,2,2]
		ctx.line(@a, @b)
		ctx.stroke @color
		ctx.restore()

window.addEventListener 'mouseup', (e)->
	destroy constraint
###