package flight.hostLime;

#if lime
import flight._Application.notifyWindowClosed;
import flight._Application.observeWindowHostResult;
import flight._Application.requestWindowClose;
import flight.types.ApplicationWindow;
import flight.types.WindowAttachmentOwnership;
import flight.types.WindowBackend;
import flight.types.WindowBounds;
import flight.types.WindowOptions;
import haxe.ds.ObjectMap;
import lime.app.Application;
import lime.ui.Window;
import lime.ui.WindowAttributes;

/** Maps Flight window entities onto real Lime windows, including host-owned attachment. */
class LimeWindow {
  public static function createLimeWindowBackend(application:Application):WindowBackend {
    final records = new ObjectMap<ApplicationWindow, LimeWindowRecord>();
    final handles = new ObjectMap<Window, ApplicationWindow>();

    final detach = function(win:ApplicationWindow, closeOwned:Bool):Void {
      final record = records.get(win);
      if (record == null) return;
      records.remove(win);
      handles.remove(record.handle);
      for (cleanup in record.cleanup) cleanup();
      record.cleanup.resize(0);
      if (closeOwned && record.ownership == 'flight') record.handle.close();
    };

    var attach:ApplicationWindow->Window->WindowAttachmentOwnership->Bool = null;
    attach = function(win:ApplicationWindow, handle:Window, ownership:WindowAttachmentOwnership):Bool {
      if (handle.application != application) return false;
      final existing = records.get(win);
      if (existing != null) return existing.handle == handle && existing.ownership == ownership;
      final mapped = handles.get(handle);
      if (mapped != null && mapped != win) return false;

      try syncFromNative(win, handle) catch (_:Dynamic) return false;
      final record = new LimeWindowRecord(handle, ownership);
      records.set(win, record);
      handles.set(handle, win);

      final onActivate = function():Void flight.Signals.emitSignal(win.onActivate);
      handle.onActivate.add(onActivate);
      record.cleanup.push(function():Void handle.onActivate.remove(onActivate));

      final onClose = function():Void {
        if (records.get(win) != record) return;
        if (!requestWindowClose(win)) {
          handle.onClose.cancel();
          return;
        }
        detach(win, false);
        notifyWindowClosed(win);
      };
      handle.onClose.add(onClose, false, 10000);
      record.cleanup.push(function():Void handle.onClose.remove(onClose));

      final onDeactivate = function():Void flight.Signals.emitSignal(win.onDeactivate);
      handle.onDeactivate.add(onDeactivate);
      record.cleanup.push(function():Void handle.onDeactivate.remove(onDeactivate));

      final onDropFile = function(path:String):Void flight.Signals.emitSignal(win.onDropFile, path);
      handle.onDropFile.add(onDropFile);
      record.cleanup.push(function():Void handle.onDropFile.remove(onDropFile));

      final onFocusIn = function():Void {
        win.focused = true;
        flight.Signals.emitSignal(win.onFocusIn);
      };
      handle.onFocusIn.add(onFocusIn);
      record.cleanup.push(function():Void handle.onFocusIn.remove(onFocusIn));

      final onFocusOut = function():Void {
        win.focused = false;
        flight.Signals.emitSignal(win.onFocusOut);
      };
      handle.onFocusOut.add(onFocusOut);
      record.cleanup.push(function():Void handle.onFocusOut.remove(onFocusOut));

      final onFullscreen = function():Void {
        win.fullscreen = handle.fullscreen;
        flight.Signals.emitSignal(win.onFullscreenChanged);
      };
      handle.onFullscreen.add(onFullscreen);
      record.cleanup.push(function():Void handle.onFullscreen.remove(onFullscreen));

      final onHide = function():Void {
        win.visible = false;
        flight.Signals.emitSignal(win.onDeactivate);
      };
      handle.onHide.add(onHide);
      record.cleanup.push(function():Void handle.onHide.remove(onHide));

      final onMaximize = function():Void {
        win.minimized = false;
        win.maximized = true;
        flight.Signals.emitSignal(win.onMaximize);
      };
      handle.onMaximize.add(onMaximize);
      record.cleanup.push(function():Void handle.onMaximize.remove(onMaximize));

      final onMinimize = function():Void {
        win.minimized = true;
        win.maximized = false;
        flight.Signals.emitSignal(win.onMinimize);
      };
      handle.onMinimize.add(onMinimize);
      record.cleanup.push(function():Void handle.onMinimize.remove(onMinimize));

      final onMove = function(x:Float, y:Float):Void {
        win.x = x;
        win.y = y;
        flight.Signals.emitSignal(win.onMove);
      };
      handle.onMove.add(onMove);
      record.cleanup.push(function():Void handle.onMove.remove(onMove));

      final onRenderContextLost = function():Void flight.Signals.emitSignal(win.onRenderContextLost);
      handle.onRenderContextLost.add(onRenderContextLost);
      record.cleanup.push(function():Void handle.onRenderContextLost.remove(onRenderContextLost));

      final onRenderContextRestored = function(_):Void flight.Signals.emitSignal(win.onRenderContextRestored);
      handle.onRenderContextRestored.add(onRenderContextRestored);
      record.cleanup.push(function():Void handle.onRenderContextRestored.remove(onRenderContextRestored));

      final onResize = function(width:Int, height:Int):Void {
        win.width = width;
        win.height = height;
        win.devicePixelRatio = handle.scale;
        flight.Signals.emitSignal(win.onResize);
      };
      handle.onResize.add(onResize);
      record.cleanup.push(function():Void handle.onResize.remove(onResize));

      final onRestore = function():Void {
        win.minimized = false;
        win.maximized = false;
        flight.Signals.emitSignal(win.onRestore);
      };
      handle.onRestore.add(onRestore);
      record.cleanup.push(function():Void handle.onRestore.remove(onRestore));

      final onShow = function():Void {
        win.visible = true;
        flight.Signals.emitSignal(win.onActivate);
      };
      handle.onShow.add(onShow);
      record.cleanup.push(function():Void handle.onShow.remove(onShow));
      return true;
    };

    final run = function(win:ApplicationWindow, operation:String, callback:Window->Void):Void {
      final record = records.get(win);
      if (record == null) return;
      try {
        callback(record.handle);
        observeWindowHostResult(operation, true);
      } catch (_:Dynamic) {
        observeWindowHostResult(operation, false);
      }
    };

    return cast {
      attach: function(win:ApplicationWindow, handle:Dynamic, ownership:WindowAttachmentOwnership):Bool {
        if (!Std.isOfType(handle, Window)) {
          observeWindowHostResult('attach', false);
          return false;
        }
        final attached = attach(win, cast handle, ownership);
        observeWindowHostResult('attach', attached);
        return attached;
      },
      center: function(win:ApplicationWindow):Void {
        run(win, 'center', function(handle:Window):Void {
          final display = handle.display;
          if (display == null || display.bounds == null) throw 'Lime display unavailable';
          handle.move(Std.int(display.bounds.x + (display.bounds.width - handle.width) / 2),
            Std.int(display.bounds.y + (display.bounds.height - handle.height) / 2));
        });
      },
      close: function(win:ApplicationWindow):Void {
        detach(win, true);
        observeWindowHostResult('close', true);
      },
      focus: function(win:ApplicationWindow):Void run(win, 'focus', function(handle:Window):Void handle.focus()),
      getBounds: function(win:ApplicationWindow, out:WindowBounds):WindowBounds {
        final record = records.get(win);
        if (record == null) return copyBounds(win, out);
        try {
          out.x = record.handle.x;
          out.y = record.handle.y;
          out.width = record.handle.width;
          out.height = record.handle.height;
          observeWindowHostResult('getBounds', true);
        } catch (_:Dynamic) {
          copyBounds(win, out);
          observeWindowHostResult('getBounds', false);
        }
        return out;
      },
      hide: function(win:ApplicationWindow):Void run(win, 'hide', function(handle:Window):Void handle.visible = false),
      maximize: function(win:ApplicationWindow):Void run(win, 'maximize', function(handle:Window):Void handle.maximized = true),
      minimize: function(win:ApplicationWindow):Void run(win, 'minimize', function(handle:Window):Void handle.minimized = true),
      open: function(win:ApplicationWindow, options:WindowOptions):Bool {
        if (records.exists(win)) return true;
        final attributes:WindowAttributes = {
          alwaysOnTop: win.alwaysOnTop,
          fullscreen: win.fullscreen,
          height: win.height > 0 ? Std.int(win.height) : 600,
          hidden: !win.visible,
          maximized: win.maximized,
          minimized: win.minimized,
          resizable: win.resizable,
          title: win.title,
          width: win.width > 0 ? Std.int(win.width) : 800,
          x: Std.int(win.x),
          y: Std.int(win.y),
        };
        if (Reflect.hasField(options, 'frame')) attributes.borderless = options.frame == false;
        final handle = try application.createWindow(attributes) catch (_:Dynamic) null;
        if (handle == null) {
          observeWindowHostResult('open', false);
          return false;
        }
        if (!attach(win, handle, 'flight')) {
          handle.close();
          observeWindowHostResult('open', false);
          return false;
        }
        if (win.minWidth > 0 || win.minHeight > 0) handle.setMinSize(Std.int(win.minWidth), Std.int(win.minHeight));
        if (win.maxWidth >= 0 && win.maxHeight >= 0) handle.setMaxSize(Std.int(win.maxWidth), Std.int(win.maxHeight));
        observeWindowHostResult('open', true);
        return true;
      },
      restore: function(win:ApplicationWindow):Void run(win, 'restore', function(handle:Window):Void {
        handle.minimized = false;
        handle.maximized = false;
      }),
      setFullscreen: function(win:ApplicationWindow, fullscreen:Bool):Void {
        run(win, 'setFullscreen', function(handle:Window):Void handle.fullscreen = fullscreen);
      },
      setMaximumSize: function(win:ApplicationWindow, width:Float, height:Float):Void {
        run(win, 'setMaximumSize', function(handle:Window):Void handle.setMaxSize(Std.int(width), Std.int(height)));
      },
      setMinimumSize: function(win:ApplicationWindow, width:Float, height:Float):Void {
        run(win, 'setMinimumSize', function(handle:Window):Void handle.setMinSize(Std.int(width), Std.int(height)));
      },
      setOpacity: function(win:ApplicationWindow, opacity:Float):Void {
        run(win, 'setOpacity', function(handle:Window):Void handle.opacity = opacity);
      },
      setPosition: function(win:ApplicationWindow, x:Float, y:Float):Void {
        run(win, 'setPosition', function(handle:Window):Void handle.move(Std.int(x), Std.int(y)));
      },
      setResizable: function(win:ApplicationWindow, resizable:Bool):Void {
        run(win, 'setResizable', function(handle:Window):Void handle.resizable = resizable);
      },
      setSize: function(win:ApplicationWindow, width:Float, height:Float):Void {
        run(win, 'setSize', function(handle:Window):Void handle.resize(Std.int(width), Std.int(height)));
      },
      setTitle: function(win:ApplicationWindow, title:String):Void {
        run(win, 'setTitle', function(handle:Window):Void handle.title = title);
      },
      show: function(win:ApplicationWindow):Void run(win, 'show', function(handle:Window):Void handle.visible = true),
    };
  }

  static function copyBounds(win:ApplicationWindow, out:WindowBounds):WindowBounds {
    out.x = win.x;
    out.y = win.y;
    out.width = win.width;
    out.height = win.height;
    return out;
  }

  static function syncFromNative(win:ApplicationWindow, handle:Window):Void {
    win.title = handle.title;
    win.x = handle.x;
    win.y = handle.y;
    win.width = handle.width;
    win.height = handle.height;
    win.devicePixelRatio = handle.scale;
    win.minimized = handle.minimized;
    win.maximized = handle.maximized;
    win.fullscreen = handle.fullscreen;
    win.visible = handle.visible;
    win.resizable = handle.resizable;
    win.opacity = handle.opacity;
    win.minWidth = handle.minWidth;
    win.minHeight = handle.minHeight;
    win.maxWidth = handle.maxWidth;
    win.maxHeight = handle.maxHeight;
  }
}

private class LimeWindowRecord {
  public final cleanup:Array<Void->Void> = [];
  public final handle:Window;
  public final ownership:WindowAttachmentOwnership;

  public function new(handle:Window, ownership:WindowAttachmentOwnership) {
    this.handle = handle;
    this.ownership = ownership;
  }
}
#end
