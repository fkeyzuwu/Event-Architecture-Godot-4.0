class_name Test extends Node2D

func _ready():
	add_event()
	call_event()
	remove_event()
	call_event()
	add_event()
	add_event()
	call_event()

func add_event() -> void:
	EventManager.add_listener(TestTrigger.class_str(), shalom)

func call_event() -> void:
	var event_args = EventArgs.new()
	event_args.stringy = "Ahuki"
	EventManager.invoke_event(TestTrigger.class_str(), event_args)

func remove_event():
	EventManager.remove_listener(TestTrigger.class_str(), shalom)

func shalom(event_args: EventArgs) -> void:
	print("shalom: " + event_args.stringy)
	
