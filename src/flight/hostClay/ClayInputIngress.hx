// Maintained host adapter: Flight InputIngressBackend for the Clay host.
// WRITE-AHEAD against upstream develop 2cf1c5cef — does NOT compile until the
// regenerated develop base lands (flight.types.InputIngress*, flight._Input.*,
// flight.types.Input*Data do not exist on the 0.4.0 base). Names/field shapes
// are predicted from the develop TS contract and must be reconciled on rebase.
// See agents/host-develop-adaptation.md.
//
// Model: Flight owns the InputManager + sink; the host backend's attach*(source,
// sink, options) wires a raw event stream to that sink and returns a disposer.
// Clay is subclass-driven (clay.Events), so the app forwards raw events to this
// dispatcher (as with ClayLoop.pump), and attach* subscribes sinks by category.
// Mirrors builder's disposable per-window LimeInput ownership model.
package flight.hostClay;

#if clay
import flight.types.InputIngressBackend;
import flight.types.InputIngressSink;

class ClayInputIngress {
  static final pointer:Array<InputIngressSink> = [];
  static final keyboard:Array<InputIngressSink> = [];
  static final wheel:Array<InputIngressSink> = [];
  static final text:Array<InputIngressSink> = [];
  static final gamepad:Array<InputIngressSink> = [];

  /** Allocation entry point. Install via `flight._Input.installInputIngressHostBackend`. */
  public static function createClayInputIngressBackend():InputIngressBackend {
    return cast {
      attachPointer: function(source:Dynamic, sink:InputIngressSink, ?options:Dynamic):Void->Void
        return subscribe(pointer, sink),
      attachRelativePointer: function(source:Dynamic, sink:InputIngressSink, ?options:Dynamic):Void->Void
        return subscribe(pointer, sink),
      attachKeyboard: function(source:Dynamic, sink:InputIngressSink, ?options:Dynamic):Void->Void
        return subscribe(keyboard, sink),
      attachWheel: function(source:Dynamic, sink:InputIngressSink, ?options:Dynamic):Void->Void
        return subscribe(wheel, sink),
      attachText: function(source:Dynamic, sink:InputIngressSink, ?options:Dynamic):Void->Void
        return subscribe(text, sink),
      attachGamepad: function(source:Dynamic, sink:InputIngressSink, ?options:Dynamic):Void->Void
        return subscribe(gamepad, sink),
    };
  }

  static function subscribe(list:Array<InputIngressSink>, sink:InputIngressSink):Void->Void {
    list.push(sink);
    return function():Void { list.remove(sink); };
  }

  // --- Dispatch: the app's clay.Events subclass forwards raw events here. ---
  // clay.Events → InputIngressSink is a near 1:1 mapping. TODO(develop): build
  // the exact flight.types.Input*Data field shapes (x/y/button/dx/dy/keycode/
  // modifiers/…) once generated; cast placeholders mark the fields to fill.
  public static function onMouseDown(x:Int, y:Int, button:Int, timestamp:Float):Void
    for (s in pointer) if (s.isEnabled()) s.pointerDown(cast {x: x, y: y, button: button, timestamp: timestamp});
  public static function onMouseUp(x:Int, y:Int, button:Int, timestamp:Float):Void
    for (s in pointer) if (s.isEnabled()) s.pointerUp(cast {x: x, y: y, button: button, timestamp: timestamp});
  public static function onMouseMove(x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float):Void
    for (s in pointer) if (s.isEnabled()) {
      s.pointerMove(cast {x: x, y: y, timestamp: timestamp});
      s.pointerMoveRelative(cast {x: x, y: y, dx: xrel, dy: yrel, timestamp: timestamp});
    }
  public static function onMouseWheel(dx:Float, dy:Float, timestamp:Float):Void
    for (s in wheel) if (s.isEnabled()) s.wheel(cast {dx: dx, dy: dy, timestamp: timestamp});
  public static function onKeyDown(keycode:Int, scancode:Int, repeat:Bool, mod:Dynamic, timestamp:Float):Void
    for (s in keyboard) if (s.isEnabled()) s.keyDown(cast {keycode: keycode, scancode: scancode, repeat: repeat, mod: mod, timestamp: timestamp});
  public static function onKeyUp(keycode:Int, scancode:Int, mod:Dynamic, timestamp:Float):Void
    for (s in keyboard) if (s.isEnabled()) s.keyUp(cast {keycode: keycode, scancode: scancode, mod: mod, timestamp: timestamp});
  public static function onText(str:String, timestamp:Float):Void
    for (s in text) if (s.isEnabled()) s.textInput(cast {text: str, timestamp: timestamp});
  public static function onGamepadButton(gamepad:Int, button:Int, value:Float, down:Bool, timestamp:Float):Void
    for (s in ClayInputIngress.gamepad) if (s.isEnabled())
      down ? s.gamepadButtonDown(cast {gamepad: gamepad, button: button, value: value, timestamp: timestamp})
           : s.gamepadButtonUp(cast {gamepad: gamepad, button: button, value: value, timestamp: timestamp});
}
#end
