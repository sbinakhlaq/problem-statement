Dir[File.dirname(__FILE__) + '/application/*.rb'].each { |file| require file }

class EventBus

  def initialize
    # Add your code here
  end
  
  def emit(event_name, data)
    # Add your code here      
  end

  def subscribe(event_name, callback)
    # Add your code here
  end
end

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
