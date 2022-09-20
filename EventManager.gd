extends Node

func add_listener(event_type, method: Callable) -> void:
	if(!event_type_valid(event_type)):
		return
	
	var str_event_type = StringName(str(event_type))
		
	if !has_user_signal(str_event_type):
		add_user_signal(str_event_type, [{"name": str_event_type, "type": EventArgs}])
		
	connect(str_event_type, method)

func remove_listener(event_type, method: Callable) -> void:
	if(!event_type_valid(event_type)):
		return
	
	var str_event_type = StringName(str(event_type))
	
	if !has_user_signal(str_event_type):
		push_error("no valid signal found to remove")
		return
	
	disconnect(str_event_type, method)

func invoke_event(event_type, event_args: EventArgs) -> void:
	if(!event_type_valid(event_type)):
		return
	
	var str_event_type = StringName(str(event_type))
	
	if !has_user_signal(str_event_type):
		push_error("event to invoke not found")
		return
		
	emit_signal(str_event_type, event_args)


func event_type_valid(event_type) -> bool:
	if event_type != typeof(EventTrigger):
		push_error("event type not valid")
		return false
		
	return true
