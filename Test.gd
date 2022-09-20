class_name Test extends Node2D

func _ready():
	remove_event()
	call_event()

func add_event() -> void:
	EventManager.add_listener(typeof(TestTrigger), shalom)

func call_event() -> void:
	var event_args = EventArgs.new()
	event_args.stringy = "Ahuki"
	EventManager.invoke_event(typeof(TestTrigger), event_args)

func remove_event():
	EventManager.remove_listener(typeof(TestTrigger), shalom)

func shalom(event_args: EventArgs) -> void:
	print("shalom: " + event_args.stringy)
	
