extends Node

func add_listener(event_type, method: Callable) -> void:
	if(!event_type_valid(event_type)):
		return
	
	var type = event_type.class_str()
		
	if !has_user_signal(type):
		add_user_signal(type, [{"name": type, "type": TYPE_OBJECT}])
	
	if is_connected(type, method):
		push_warning("callable %s is already connected to signal %s" % [method.get_method(), type])
		return
		
	connect(type, method)	

func remove_listener(event_type, method: Callable) -> void:
	if(!event_type_valid(event_type)):
		return
	
	var type = event_type.class_str()
	
	if !has_user_signal(type):
		push_error("couldn't find signal %s to remove" % type)
		return
	
	if !is_connected(type, method):
		push_error("method %s is not connected to signal %s, so it can't be removed" % [method.get_method(), type]) 
	
	disconnect(type, method)

func invoke_event(event_type, event_args: EventArgs) -> void:
	if(!event_type_valid(event_type)):
		return
	
	var type = event_type.class_str()
	
	if !has_user_signal(type):
		return
		
	emit_signal(type, event_args)


func event_type_valid(event_type) -> bool:
	if event_type.new() is EventTrigger:
		return true
	else:
		push_error("type passed into function doesn't inherit from EventTrigger")
		return false
	
