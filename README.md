# Event-Architecture-Godot-4.0

Similar to what I have in this repo:
https://github.com/fkeyzuwu/CardArchitectureInUnity

This is just remade in GDScript. it has the basis for implentation(it works) but no actual mechanics / game.

  -Allows you to add custom signals in runtime
  -Pass in methods with the new Callable in Godot 4.0
  -Connect and disconnect these methods to signals.
  -Call those signals.
  
The only thing that is wack here is the way you create the strings for the signals here since they are semi-hardcoded.
Normally I would use a class type for this, however GDScript doesn't support inherited class types to get as strings and I couldn't find a nice way to fix that.
You could maybe do this with metadata, however its bugged in 4.0 beta 1. Waiting for it to be fixed.
