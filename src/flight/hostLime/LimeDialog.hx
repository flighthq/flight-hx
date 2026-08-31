// Maintained host adapter: Flight dialog backend over Lime's file dialogs and
// window alert. File pickers (open/save/directory) are real native dialogs via
// `lime.ui.FileDialog`. Message-style dialogs are limited by what Lime
// exposes: `message` shows `window.alert` and resolves as its single OK button
// (buttonIndex 0). Lime has no native two-button confirmation or text prompt,
// so those operations return their denied/cancelled sentinels instead of
// claiming a user choice that never occurred. HostLime owns installation.
package flight.hostLime;

#if lime
import flight._internal._Promise;
import flight._internal._Runtime;
import flight.types.HostDialogCapabilities;
import lime.app.Application;
import lime.ui.FileDialog;
import lime.ui.FileDialogType;
import lime.ui.Window;

class LimeDialog {
  /** Builds Flight's `dialog` capability namespace bound to a Lime window. */
  public static function createLimeDialogCapabilities(window:Window):HostDialogCapabilities {
    return createCapabilities(function():Null<Window> return window);
  }

  /** Application-owned variant that follows Lime when its primary window changes. */
  public static function createLimeApplicationDialogCapabilities(application:Application):HostDialogCapabilities {
    return createCapabilities(function():Null<Window> return application.window);
  }

  static function createCapabilities(getWindow:Void->Null<Window>):HostDialogCapabilities {
    final message = function(options:Dynamic):_Promise<Dynamic> {
      final window = getWindow();
      if (window == null) {
        return _Promise.resolve(({buttonIndex: -1.0, cancelled: true, checkboxChecked: false} : Dynamic));
      }
      window.alert(messageText(options), _Runtime.field(options, 'title'));
      return _Promise.resolve(({buttonIndex: 0.0, cancelled: false, checkboxChecked: false} : Dynamic));
    };
    final saveFile = function(options:Dynamic):_Promise<Dynamic> {
      return new _Promise(function(resolve:Dynamic->Void, _reject) {
        final dialog = new FileDialog();
        dialog.onSelect.add(function(path:String) resolve(handleFor(path, 'File')));
        dialog.onCancel.add(function() resolve(null));
        final opened = dialog.browse(FileDialogType.SAVE, filterFor(options), _Runtime.field(options, 'defaultPath'),
          _Runtime.field(options, 'title'));
        if (!opened) resolve(null);
      });
    };

    return cast {
      // Lime has no native two-button confirmation or text prompt, so those
      // resolve to their denied/cancelled sentinels instead of a false choice.
      message: {message: message, confirm: function(_options:Dynamic):_Promise<Dynamic> return _Promise.resolve(false)},
      prompt: {prompt: function(_options:Dynamic):_Promise<Dynamic> return _Promise.resolve(null)},
      fileOpen: {
        open: function(options:Dynamic):_Promise<Dynamic> {
          final multiple:Bool = _Runtime.field(options, 'multiple') == true;
          return browse(multiple ? FileDialogType.OPEN_MULTIPLE : FileDialogType.OPEN, options, 'File');
        },
      },
      fileSave: {save: saveFile},
      directoryOpen: {
        open: function():_Promise<Dynamic> return browse(FileDialogType.OPEN_DIRECTORY, {}, 'Directory'),
      },
    };
  }

  static function browse(type:FileDialogType, options:Dynamic, kind:String):_Promise<Dynamic> {
    return new _Promise(function(resolve:Dynamic->Void, _reject) {
      final dialog = new FileDialog();
      dialog.onSelect.add(function(path:String) resolve(([handleFor(path, kind)] : Array<Dynamic>)));
      dialog.onSelectMultiple.add(function(paths:Array<String>) {
        resolve(([for (path in paths) handleFor(path, kind)] : Array<Dynamic>));
      });
      dialog.onCancel.add(function() resolve(([] : Array<Dynamic>)));
      final opened = dialog.browse(type, filterFor(options), _Runtime.field(options, 'defaultPath'),
        _Runtime.field(options, 'title'));
      if (!opened) resolve(([] : Array<Dynamic>));
    });
  }

  static function handleFor(path:String, kind:String):Dynamic {
    return {kind: kind, name: haxe.io.Path.withoutDirectory(path), path: path};
  }

  // Lime filters are a single extension list string ("png|jpg"); flatten the
  // structured Flight filters into that form.
  static function filterFor(options:Dynamic):Null<String> {
    final filters:Null<Array<Dynamic>> = _Runtime.field(options, 'filters');
    if (filters == null) return null;
    final extensions:Array<String> = [];
    for (filter in filters) {
      final list:Null<Array<Dynamic>> = _Runtime.field(filter, 'extensions');
      if (list != null) for (extension in list) extensions.push(Std.string(extension));
    }
    return extensions.length == 0 ? null : extensions.join('|');
  }

  static function messageText(options:Dynamic):String {
    final message = Std.string(_Runtime.field(options, 'message'));
    final detail:Null<String> = _Runtime.field(options, 'detail');
    return detail == null ? message : message + '\n\n' + detail;
  }
}
#end
