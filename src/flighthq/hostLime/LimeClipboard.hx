// Maintained host adapter: Flight clipboard backend over the Lime system
// clipboard. Lime exposes a plain-text clipboard only, so the text lanes
// (read/write/has/clear, plus 'text/plain' through the format lanes) are
// real; every richer flavor — HTML, RTF, images, bookmarks, files — resolves
// to its documented denied/absent value ('' / false / null / []). Change
// notification maps to `lime.system.Clipboard.onUpdate`. Install with
// `setClipboardBackend(LimeClipboard.createLimeClipboardBackend())`.
package flighthq.hostLime;

#if lime
import flighthq._internal._Promise;
import flighthq._internal._Runtime;
import lime.system.Clipboard;

class LimeClipboard {
  static inline final TEXT_FORMAT = 'text/plain';

  /** Allocation entry point, Flight-style: `createLimeClipboardBackend()`. */
  public static function createLimeClipboardBackend():flighthq.types.ClipboardBackend {
    var changeCount = 0.0;
    Clipboard.onUpdate.add(function() changeCount++);
    return cast {
      readText: function():_Promise<Dynamic> return _Promise.resolve(currentText()),
      writeText: function(text:String):_Promise<Dynamic> {
        Clipboard.text = text;
        return _Promise.resolve(true);
      },
      hasText: function():_Promise<Dynamic> return _Promise.resolve(currentText() != ''),
      clear: function():_Promise<Dynamic> {
        Clipboard.text = '';
        return _Promise.resolve(true);
      },
      readFormat: function(format:String):_Promise<Dynamic> {
        return _Promise.resolve(format == TEXT_FORMAT ? currentText() : '');
      },
      writeFormat: function(format:String, data:String):_Promise<Dynamic> {
        if (format != TEXT_FORMAT) return _Promise.resolve(false);
        Clipboard.text = data;
        return _Promise.resolve(true);
      },
      hasFormat: function(format:String):_Promise<Dynamic> {
        return _Promise.resolve(format == TEXT_FORMAT && currentText() != '');
      },
      getFormats: function():_Promise<Dynamic> {
        return _Promise.resolve(currentText() != '' ? ([TEXT_FORMAT] : Array<Dynamic>) : ([] : Array<Dynamic>));
      },
      readItems: function(formats:Array<Dynamic>):_Promise<Dynamic> {
        final out:Dynamic = {};
        if (formats != null && formats.indexOf(TEXT_FORMAT) >= 0 && currentText() != '') {
          Reflect.setField(out, TEXT_FORMAT, currentText());
        }
        return _Promise.resolve(out);
      },
      writeItems: function(items:Array<Dynamic>):_Promise<Dynamic> {
        if (items != null) for (item in items) {
          if (_Runtime.field(item, 'format') == TEXT_FORMAT) {
            Clipboard.text = Std.string(_Runtime.field(item, 'data'));
            return _Promise.resolve(true);
          }
        }
        return _Promise.resolve(false);
      },
      getChangeCount: function():Float return changeCount,
      subscribeClipboardChange: function(listener:Dynamic):Dynamic {
        final wrapped = function():Void _Runtime.callOptionalValue(listener, cast []);
        Clipboard.onUpdate.add(wrapped);
        return function():Void Clipboard.onUpdate.remove(wrapped);
      },
      // Flavors Lime cannot carry: documented denied/absent values.
      readHtml: function():_Promise<Dynamic> return _Promise.resolve(''),
      writeHtml: function(_html:String):_Promise<Dynamic> return _Promise.resolve(false),
      readRTF: function():_Promise<Dynamic> return _Promise.resolve(''),
      writeRTF: function(_rtf:String):_Promise<Dynamic> return _Promise.resolve(false),
      readImage: function():_Promise<Dynamic> return _Promise.resolve(''),
      writeImage: function(_dataUrl:String):_Promise<Dynamic> return _Promise.resolve(false),
      hasImage: function():_Promise<Dynamic> return _Promise.resolve(false),
      readBookmark: function():_Promise<Dynamic> return _Promise.resolve(null),
      writeBookmark: function(_title:String, _url:String):_Promise<Dynamic> return _Promise.resolve(false),
      readFiles: function():_Promise<Dynamic> return _Promise.resolve(([] : Array<Dynamic>)),
      writeFiles: function(_paths:Array<Dynamic>):_Promise<Dynamic> return _Promise.resolve(false),
    };
  }

  static function currentText():String {
    final text = Clipboard.text;
    return text == null ? '' : text;
  }
}
#end
