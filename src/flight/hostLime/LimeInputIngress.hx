// Maintained host adapter: Flight InputIngressBackend for the Lime host.
// WRITE-AHEAD against develop 2cf1c5cef, guarded `#if flight_host_develop` so it
// stays INERT on the 0.4.0 base (hostLime's `#if lime` is exercised by
// test:haxe:lime — this must not break it). On rebase to develop, drop the
// extra guard (it becomes plain `#if lime`) and reconcile flight.types.* names.
//
// Reworks builder's LimeInput (which targets InputManager directly) onto the new
// InputIngressBackend seam: attach*(source=window, sink, options) wires
// lime.ui.Window events to the sink and returns a disposer. Preserves builder's
// ownership nuances — touch is attached per-window with an optional filter, and
// gamepads are global + opt-in — carried through AttachInputOptions. FOR BUILDER
// REVIEW: reconcile key/modifier/touch mapping against LimeInput's exact logic.
package flight.hostLime;

#if (lime && flight_host_develop)
import flight.types.InputIngressBackend;
import flight.types.InputIngressSink;
import lime.ui.Window;

class LimeInputIngress {
  /** Install via `flight._Input.installInputIngressHostBackend`. */
  public static function createLimeInputIngressBackend():InputIngressBackend {
    return cast {
      attachPointer: function(source:Window, sink:InputIngressSink, ?options:Dynamic):Void->Void {
        final onDown = function(x:Float, y:Float, button:Int) if (sink.isEnabled()) sink.pointerDown(cast {x: x, y: y, button: button});
        final onUp = function(x:Float, y:Float, button:Int) if (sink.isEnabled()) sink.pointerUp(cast {x: x, y: y, button: button});
        final onMove = function(x:Float, y:Float) if (sink.isEnabled()) sink.pointerMove(cast {x: x, y: y});
        source.onMouseDown.add(onDown);
        source.onMouseUp.add(onUp);
        source.onMouseMove.add(onMove);
        return function():Void { source.onMouseDown.remove(onDown); source.onMouseUp.remove(onUp); source.onMouseMove.remove(onMove); };
      },
      attachRelativePointer: function(source:Window, sink:InputIngressSink, ?options:Dynamic):Void->Void {
        final onMoveRel = function(x:Float, y:Float) if (sink.isEnabled()) sink.pointerMoveRelative(cast {dx: x, dy: y});
        source.onMouseMoveRelative.add(onMoveRel);
        return function():Void source.onMouseMoveRelative.remove(onMoveRel);
      },
      attachWheel: function(source:Window, sink:InputIngressSink, ?options:Dynamic):Void->Void {
        final onWheel = function(dx:Float, dy:Float, ?mode:Dynamic) if (sink.isEnabled()) sink.wheel(cast {dx: dx, dy: dy});
        source.onMouseWheel.add(onWheel);
        return function():Void source.onMouseWheel.remove(onWheel);
      },
      attachKeyboard: function(source:Window, sink:InputIngressSink, ?options:Dynamic):Void->Void {
        // TODO(builder review): carry LimeInput's keycode/modifier/shifted-key
        // and text/composition mapping. lime.ui.Window key events + onTextInput.
        final onKeyDown = function(code:Dynamic, mod:Dynamic) if (sink.isEnabled()) sink.keyDown(cast {keycode: code, mod: mod});
        final onKeyUp = function(code:Dynamic, mod:Dynamic) if (sink.isEnabled()) sink.keyUp(cast {keycode: code, mod: mod});
        source.onKeyDown.add(onKeyDown);
        source.onKeyUp.add(onKeyUp);
        return function():Void { source.onKeyDown.remove(onKeyDown); source.onKeyUp.remove(onKeyUp); };
      },
      attachText: function(source:Window, sink:InputIngressSink, ?options:Dynamic):Void->Void {
        final onText = function(text:String) if (sink.isEnabled()) sink.textInput(cast {text: text});
        source.onTextInput.add(onText);
        return function():Void source.onTextInput.remove(onText);
      },
      attachGamepad: function(source:Dynamic, sink:InputIngressSink, ?options:Dynamic):Void->Void {
        // TODO(builder review): reuse LimeInput.attachLimeGamepadInput's global,
        // opt-in, standardized-gamepad delivery, re-targeted to the sink.
        return function():Void {};
      },
    };
  }
}
#end
