package flight.hostLime;

#if lime
import flight.types.HapticsBackend;
import lime.ui.Haptic;

/** Conservative Flight haptics over Lime's duration-based vibration API. */
class LimeHaptics {
  public static function createLimeHapticsBackend():HapticsBackend {
    return cast {
      cancel: function():Bool {
        if (!isSupported()) return false;
        Haptic.vibrate(0, 0);
        return true;
      },
      capabilities: function(out:Dynamic):Dynamic {
        out.amplitudeControl = false;
        out.customEvents = false;
        out.intensity = false;
        out.patterns = false;
        out.supported = isSupported();
        return out;
      },
      impact: function(style:String, _intensity:Float):Bool {
        return vibrate(switch (style) {
          case 'heavy': 40;
          case 'medium': 25;
          default: 15;
        });
      },
      isSupported: isSupported,
      notification: function(type:String):Bool {
        return vibrate(type == 'error' ? 80 : type == 'warning' ? 50 : 25);
      },
      selection: function():Bool return vibrate(10),
      vibrate: function(duration:Float):Bool return vibrate(Std.int(duration)),
      // Lime has a periodic vibration API, not Flight's arbitrary on/off
      // sequence contract. Do not claim support by approximating the pattern.
      vibratePattern: function(_pattern:Array<Float>):Bool return false,
    };
  }

  static function vibrate(duration:Int):Bool {
    if (!isSupported() || duration < 0) return false;
    Haptic.vibrate(0, duration);
    return true;
  }

  static function isSupported():Bool {
    #if (android || ios)
    return true;
    #elseif (js && html5)
    return js.Syntax.code('typeof navigator !== "undefined" && typeof navigator.vibrate === "function"');
    #else
    return false;
    #end
  }
}
#end
