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
  // Builds develop's DOM-event-shaped Input*Data. Fields Clay does not report
  // (tilt/pressure gradations, per-key location) default; reconcile optional
  // field names against the generated types on rebase.
  public static function onMouseDown(x:Int, y:Int, button:Int, timestamp:Float):Void
    for (s in pointer) if (s.isEnabled()) s.pointerDown(pointerData(x, y, button, 1 << button, 0, 0, 1.0));
  public static function onMouseUp(x:Int, y:Int, button:Int, timestamp:Float):Void
    for (s in pointer) if (s.isEnabled()) s.pointerUp(pointerData(x, y, button, 0, 0, 0, 0.0));
  public static function onMouseMove(x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float):Void
    for (s in pointer) if (s.isEnabled()) {
      s.pointerMove(pointerData(x, y, -1, 0, 0, 0, 0.0));
      s.pointerMoveRelative(pointerData(x, y, -1, 0, xrel, yrel, 0.0));
    }
  public static function onMouseWheel(dx:Float, dy:Float, timestamp:Float):Void
    for (s in wheel) if (s.isEnabled()) s.wheel(cast {deltaX: dx, deltaY: dy, x: 0.0, y: 0.0, button: -1, buttons: 0, pointerId: 1, pointerType: 'mouse', isPrimary: true});
  public static function onKeyDown(keycode:Int, scancode:Int, repeat:Bool, mod:Dynamic, timestamp:Float):Void
    for (s in keyboard) if (s.isEnabled()) s.keyDown(keyData(keycode, scancode, repeat, mod));
  public static function onKeyUp(keycode:Int, scancode:Int, mod:Dynamic, timestamp:Float):Void
    for (s in keyboard) if (s.isEnabled()) s.keyUp(keyData(keycode, scancode, false, mod));
  public static function onText(str:String, timestamp:Float):Void
    for (s in text) if (s.isEnabled()) s.textInput(cast {text: str, key: str});
  public static function onGamepadButton(gamepad:Int, button:Int, value:Float, down:Bool, timestamp:Float):Void
    for (s in ClayInputIngress.gamepad) if (s.isEnabled())
      down ? s.gamepadButtonDown(cast {gamepad: gamepad, button: button, value: value})
           : s.gamepadButtonUp(cast {gamepad: gamepad, button: button, value: value});

  static inline function pointerData(x:Int, y:Int, button:Int, buttons:Int, dx:Int, dy:Int, pressure:Float):Dynamic
    return cast {
      x: (x : Float), y: (y : Float), button: button, buttons: buttons,
      deltaX: (dx : Float), deltaY: (dy : Float), pointerId: 1, pointerType: 'mouse',
      pressure: pressure, isPrimary: true, width: 1.0, height: 1.0, tiltX: 0.0, tiltY: 0.0,
      altKey: false, ctrlKey: false, metaKey: false, shiftKey: false,
    };
  static inline function keyData(keycode:Int, scancode:Int, repeat:Bool, mod:Dynamic):Dynamic
    return cast {
      keyCode: keycode, code: '' + scancode, key: '', location: 0, modifier: 0, repeat: repeat,
      altKey: false, ctrlKey: false, metaKey: false, shiftKey: false, capsLock: false, numLock: false,
    };
}
#end
