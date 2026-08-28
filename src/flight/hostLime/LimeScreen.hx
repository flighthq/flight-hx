package flight.hostLime;

#if lime
import flight.types.ScreenBackend;
import lime.app.Application;
import lime.system.Display;
import lime.system.DisplayMode;
import lime.system.Orientation;
import lime.system.System;
import lime.ui.Window;

/** Display enumeration and change delivery over Lime's native display APIs. */
class LimeScreen {
  public static function createLimeScreenBackend(application:Application):ScreenBackend {
    var cursorX = 0.0;
    var cursorY = 0.0;
    var cursorTracking = false;
    final cursorWindows:Array<Window> = [];
    final cursorHandlers:Array<Float->Float->Void> = [];
    var cursorWindowHandler:Window->Void = null;

    final attachCursor = function(window:Window):Void {
      if (cursorWindows.indexOf(window) >= 0) return;
      final handler = function(x:Float, y:Float):Void {
        cursorX = window.x + x;
        cursorY = window.y + y;
      };
      cursorWindows.push(window);
      cursorHandlers.push(handler);
      window.onMouseMove.add(handler);
    };
    cursorWindowHandler = attachCursor;

    return cast {
      getScreens: function(out:Array<Dynamic>):Array<Dynamic> {
        final count = try System.numDisplays catch (_:Dynamic) 0;
        out.resize(count);
        for (index in 0...count) {
          if (out[index] == null) out[index] = emptyScreen();
          fillScreen(System.getDisplay(index), out[index]);
        }
        return out;
      },
      getPrimaryScreen: function(out:Dynamic):Dynamic {
        fillScreen(try System.getDisplay(0) catch (_:Dynamic) null, out);
        return out;
      },
      subscribe: function(listener:Dynamic):Void->Void {
        final windows:Array<Window> = [];
        final handlers:Array<Int->Int->Void> = [];
        final attachResize = function(window:Window):Void {
          if (windows.indexOf(window) >= 0) return;
          final handler = function(_width:Int, _height:Int):Void {
            final display = window.display;
            if (display != null) emitChange(listener, display, true, true, false);
          };
          windows.push(window);
          handlers.push(handler);
          window.onResize.add(handler);
        };
        final orientation = function(displayId:Int, _value:Orientation):Void {
          final display = try System.getDisplay(displayId) catch (_:Dynamic) null;
          if (display != null) emitChange(listener, display, false, false, true);
        };
        for (window in application.windows) attachResize(window);
        application.onCreateWindow.add(attachResize);
        application.onDisplayOrientationChange.add(orientation);
        return function():Void {
          application.onCreateWindow.remove(attachResize);
          application.onDisplayOrientationChange.remove(orientation);
          for (index in 0...windows.length) windows[index].onResize.remove(handlers[index]);
        };
      },
      getCursorPosition: function(out:Dynamic):Dynamic {
        if (!cursorTracking) {
          cursorTracking = true;
          for (window in application.windows) attachCursor(window);
          application.onCreateWindow.add(cursorWindowHandler);
        }
        out.x = cursorX;
        out.y = cursorY;
        return out;
      },
      getModes: function(screen:Dynamic, out:Array<Dynamic>):Array<Dynamic> {
        final display = try System.getDisplay(Std.int(screen.id)) catch (_:Dynamic) null;
        final modes = display == null || display.supportedModes == null ? [] : display.supportedModes;
        out.resize(modes.length);
        for (index in 0...modes.length) {
          if (out[index] == null) out[index] = {};
          fillMode(modes[index], out[index]);
        }
        return out;
      },
    };
  }

  static function emitChange(listener:Dynamic, display:Display, bounds:Bool, workArea:Bool, orientation:Bool):Void {
    final screen = emptyScreen();
    fillScreen(display, screen);
    listener({
      kind: 'ScreenMetricsChanged',
      screen: screen,
      changedMetrics: {
        bounds: bounds,
        workArea: workArea,
        scaleFactor: bounds,
        orientation: orientation,
      },
    });
  }

  static function fillScreen(display:Null<Display>, out:Dynamic):Void {
    if (display == null) {
      copyFields(emptyScreen(), out);
      return;
    }
    final bounds = display.bounds;
    final work = display.safeArea == null ? bounds : display.safeArea;
    final mode = display.currentMode;
    out.id = (display.id : Float);
    out.x = bounds == null ? 0.0 : bounds.x;
    out.y = bounds == null ? 0.0 : bounds.y;
    out.width = bounds == null ? 0.0 : bounds.width;
    out.height = bounds == null ? 0.0 : bounds.height;
    out.workWidth = work == null ? out.width : work.width;
    out.workHeight = work == null ? out.height : work.height;
    out.scaleFactor = display.dpi > 0 ? display.dpi / 96.0 : 1.0;
    out.isPrimary = display.id == 0;
    out.rotation = rotation(display.orientation);
    out.orientation = orientation(display.orientation);
    out.refreshRate = mode == null ? -1.0 : (mode.refreshRate : Float);
    out.colorDepth = mode == null ? -1.0 : 32.0;
    out.pixelDepth = out.colorDepth;
    out.physicalWidth = mode == null ? -1.0 : (mode.width : Float);
    out.physicalHeight = mode == null ? -1.0 : (mode.height : Float);
    out.isHdr = false;
    out.colorSpace = 'srgb';
    out.maxLuminance = -1.0;
    out.depthPerComponent = mode == null ? -1.0 : 8.0;
    out.dpi = display.dpi > 0 ? display.dpi : -1.0;
    out.label = display.name == null ? '' : display.name;
    out.internal = false;
    out.touchSupport = #if (ios || android) 'available' #else 'unknown' #end;
    out.monochrome = false;
  }

  static function fillMode(mode:DisplayMode, out:Dynamic):Void {
    out.width = (mode.width : Float);
    out.height = (mode.height : Float);
    out.refreshRate = (mode.refreshRate : Float);
    out.colorDepth = 32.0;
    out.pixelFormat = Std.string(mode.pixelFormat);
  }

  static function emptyScreen():Dynamic return {
    id: 0.0,
    x: 0.0,
    y: 0.0,
    width: 0.0,
    height: 0.0,
    workWidth: 0.0,
    workHeight: 0.0,
    scaleFactor: 1.0,
    isPrimary: false,
    rotation: -1.0,
    orientation: 'Landscape',
    refreshRate: -1.0,
    colorDepth: -1.0,
    pixelDepth: -1.0,
    physicalWidth: -1.0,
    physicalHeight: -1.0,
    isHdr: false,
    colorSpace: 'srgb',
    maxLuminance: -1.0,
    depthPerComponent: -1.0,
    dpi: -1.0,
    label: '',
    internal: false,
    touchSupport: 'unknown',
    monochrome: false,
  };

  static function orientation(value:Orientation):String return switch (value) {
    case PORTRAIT: 'Portrait';
    case PORTRAIT_FLIPPED: 'PortraitFlipped';
    case LANDSCAPE_FLIPPED: 'LandscapeFlipped';
    default: 'Landscape';
  };

  static function rotation(value:Orientation):Float return switch (value) {
    case PORTRAIT: 90.0;
    case LANDSCAPE_FLIPPED: 180.0;
    case PORTRAIT_FLIPPED: 270.0;
    case LANDSCAPE: 0.0;
    default: -1.0;
  };

  static function copyFields(source:Dynamic, target:Dynamic):Void {
    for (field in Reflect.fields(source)) Reflect.setField(target, field, Reflect.field(source, field));
  }
}
#end
