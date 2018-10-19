# Starting Points

The goal is to build a very simple PubSub/event class in ruby.

We will create an `Application` object and then we'll subscribe to events and trigger them. 

Subscribing to an event simply adds a callback to be run when the event is triggered. 
Triggering an event (emit) should run all the attached callbacks.

Don't overthink it.

# Constraints:
* event names are arbitrary strings
* event data is always a hash
* calling a proc is just: proc.call(data)

```
emitter = EventBus.new


## Callbacks
error_callback_1 = proc { |data| puts "Error 1. #{data[:message]}" }
error_callback_2 = proc { |data| puts "Error 2. #{data[:message]}" }
success_callback = proc { |data| puts "SUCCESS! #{data[:message]}" }


emitter.emit "error", { message: "Error one." }

emitter.subscribe "error", error_callback_1
emitter.emit "error", { message: "Second error." }

emitter.subscribe "error", error_callback_2
emitter.emit "error", { message: "Yet another error." }

emitter.subscribe "success", success_callback
emitter.emit "success", { message: "Great success!" }

# Expected output:

# Error 1. Second error.
# Error 1. Yet another error.
# Error 2. Yet another error.
# SUCCESS! Great success!

```