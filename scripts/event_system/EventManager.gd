extends Node

var event_triggers_path = "res://scripts/event_system/event_triggers/%s.gd"

func add_listener(event_type: String, method: Callable) -> void:
	if(!event_type_valid(event_type)):
		return
		
	if !has_user_signal(event_type):
		add_user_signal(event_type, [{"name": event_type, "type": TYPE_OBJECT}])
	
	if is_connected(event_type, method):
		push_warning("callable %s is already connected to signal %s" % [method.get_method(), event_type])
		return
		
	connect(event_type, method)	

func remove_listener(event_type: String, method: Callable) -> void:
	if(!event_type_valid(event_type)):
		return
	
	if !has_user_signal(event_type):
		push_error("couldn't find signal %s to remove" % event_type)
		return
	
	if !is_connected(event_type, method):
		push_error("method %s is not connected to signal %s, so it can't be removed" % [method.get_method(), event_type]) 
	
	disconnect(event_type, method)

func invoke_event(event_type: String, event_args: EventArgs) -> void:
	if(!event_type_valid(event_type)):
		return
	
	if !has_user_signal(event_type):
		return
		
	emit_signal(event_type, event_args)


func event_type_valid(event_type) -> bool:
	var file = File.new()
	var does_file_exist = file.file_exists(event_triggers_path % event_type)
	if does_file_exist:
		return true
		
	return false
