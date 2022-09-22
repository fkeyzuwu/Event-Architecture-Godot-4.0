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
	EventManager.add_listener(TestTrigger, shalom)

func call_event() -> void:
	var test_args = TestArgs.new()
	test_args.stringy = "Ahuki"
	EventManager.invoke_event(TestTrigger, test_args)

func remove_event():
	EventManager.remove_listener(TestTrigger, shalom)

func shalom(test_args: TestArgs) -> void:
	print("shalom: " + test_args.stringy)
	
