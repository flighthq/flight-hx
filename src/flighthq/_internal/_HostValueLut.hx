package flighthq._internal;

import Math as HxMath;

/**
 * Standard-toolkit lookup for ambient runtime values referenced by generated
 * Flight code. Keys are explicit so a new transpiler dependency fails by name
 * until the toolkit deliberately declares it.
 */
class _HostValueLut {
  public static final keys:Array<String> = [
    'AbortController',
    'AbortSignal',
    'ArrayBuffer',
    'Audio',
    'AudioBuffer',
    'Blob',
    'Buffer',
    'CSSStyleDeclaration',
    'ClipboardItem',
    'DOMException',
    'DataView',
    'Date',
    'DeviceMotionEvent',
    'File',
    'FileReader',
    'Float32Array',
    'Float64Array',
    'FontFace',
    'HTMLCanvasElement',
    'HTMLImageElement',
    'HTMLVideoElement',
    'Image',
    'ImageBitmap',
    'ImageData',
    'Int16Array',
    'Int32Array',
    'Int8Array',
    'Intl',
    'KeyboardEvent',
    'Map',
    'MediaMetadata',
    'Notification',
    'Number',
    'Object',
    'OffscreenCanvas',
    'Promise',
    'Proxy',
    'RegExp',
    'ResizeObserver',
    'Set',
    'TextDecoder',
    'TextEncoder',
    'URL',
    'URLSearchParams',
    'Uint16Array',
    'Uint32Array',
    'Uint8Array',
    'Uint8ClampedArray',
    'VideoFrame',
    'WeakMap',
    'WeakRef',
    'WeakSet',
    'WebSocket',
    'WheelEvent',
    'atob',
    'btoa',
    'cancelAnimationFrame',
    'console',
    'createImageBitmap',
    'crypto',
    'decodeURIComponent',
    'document',
    'encodeURIComponent',
    'fetch',
    'getComputedStyle',
    'globalThis',
    'isFinite',
    'isNaN',
    'localStorage',
    'location',
    'navigator',
    'parseFloat',
    'parseInt',
    'performance',
    'process',
    'requestAnimationFrame',
    'screen',
    'setInterval',
    'structuredClone',
    'window',
  ];

  /** Keys with maintained non-JavaScript values. Every other declared key is
   * an explicit JavaScript-host capability and resolves to null elsewhere. */
  public static final portableKeys:Array<String> = [
    'ArrayBuffer',
    'AudioBuffer',
    'DataView',
    'Float64Array',
    'ImageData',
    'Int32Array',
    'Int8Array',
    'Map',
    'Number',
    'Set',
    'TextDecoder',
    'Uint32Array',
    'Uint8ClampedArray',
    'WeakMap',
    'WeakSet',
    'globalThis',
    'isFinite',
    'isNaN',
    'parseFloat',
    'parseInt',
  ];

  public static function get(name:String):Dynamic {
    requireKey(name);
    #if js
    return js.Syntax.code('globalThis[{0}]', name);
    #else
    return switch (name) {
      case 'Map': _Map;
      case 'Set': _Set;
      case 'WeakMap': _WeakMap;
      case 'WeakSet': _WeakSet;
      case 'Uint8ClampedArray': _UInt8ClampedArray.construct;
      case 'ImageData': createImageData;
      case 'AudioBuffer': createAudioBuffer;
      case 'ArrayBuffer': createArrayBuffer;
      case 'globalThis': globalThisNamespace();
      case 'Float64Array': _Float64Array.construct;
      case 'Int32Array': _Int32Array.construct;
      case 'Int8Array': _Int8Array.construct;
      case 'TextDecoder': _TextDecoder;
      case 'Uint32Array': _UInt32Array.construct;
      case 'DataView': _DataView;
      case 'Number': numberNamespace();
      case 'parseFloat': jsParseFloat;
      case 'parseInt': jsParseInt;
      case 'isNaN': jsCoercingIsNaN;
      case 'isFinite': jsCoercingIsFinite;
      default: null;
    };
    #end
  }

  public static function typeofValue(name:String):String {
    requireKey(name);
    #if js
    return js.Syntax.code('typeof globalThis[{0}]', name);
    #else
    return get(name) == null ? 'undefined' : 'function';
    #end
  }

  static function requireKey(name:String):Void {
    if (keys.indexOf(name) < 0) throw 'Unknown host value LUT key: ' + name;
  }

  #if !js
  static var globalThisValue:Dynamic;

  static function globalThisNamespace():Dynamic {
    if (globalThisValue == null) {
      globalThisValue = {
        ArrayBuffer: createArrayBuffer,
        AudioBuffer: createAudioBuffer,
        ImageData: createImageData,
      };
    }
    return globalThisValue;
  }

  static function createArrayBuffer(?length:Dynamic):haxe.io.Bytes {
    return haxe.io.Bytes.alloc(Std.int(length == null ? 0 : length));
  }

  static function createImageData(?width:Dynamic, ?height:Dynamic):Dynamic {
    final w = Std.int(width == null ? 0 : width);
    final h = Std.int(height == null ? 0 : height);
    return {width: w, height: h, data: new _UInt8ClampedArray(w * h * 4)};
  }

  static function createAudioBuffer(?options:Dynamic):Dynamic {
    final length = Std.int(_Runtime.field(options, 'length'));
    final channelCount = Std.int(_Runtime.field(options, 'numberOfChannels'));
    final channels = [for (_ in 0...channelCount) new _Float32Array(length)];
    return {
      length: length,
      numberOfChannels: channelCount,
      sampleRate: _Runtime.field(options, 'sampleRate'),
      duration: sampleRate(options, length),
      getChannelData: function(index:Dynamic):Dynamic return channels[Std.int(index)],
      copyToChannel: function(source:Dynamic, index:Dynamic, ?startInChannel:Dynamic):Dynamic {
        final channel:_Float32Array = channels[Std.int(index)];
        channel.set(source, startInChannel == null ? 0 : (startInChannel : Float));
        return null;
      },
    };
  }

  static function sampleRate(options:Dynamic, length:Int):Float {
    final rate:Float = _Runtime.field(options, 'sampleRate');
    return rate > 0 ? length / rate : 0;
  }

  static var numberNamespaceValue:Dynamic = null;

  static function numberNamespace():Dynamic {
    if (numberNamespaceValue == null) {
      numberNamespaceValue = {
        isFinite: function(value:Dynamic):Bool {
          return Std.isOfType(value, Float) && HxMath.isFinite(cast value) && !HxMath.isNaN(cast value);
        },
        isInteger: function(value:Dynamic):Bool {
          if (!Std.isOfType(value, Float)) return false;
          final number:Float = cast value;
          return HxMath.isFinite(number) && !HxMath.isNaN(number) && number == HxMath.ffloor(number);
        },
        isNaN: function(value:Dynamic):Bool {
          return Std.isOfType(value, Float) && HxMath.isNaN(cast value);
        },
        parseFloat: jsParseFloat,
        parseInt: jsParseInt,
      };
    }
    return numberNamespaceValue;
  }

  static function jsParseFloat(value:Dynamic):Float {
    if (value == null) return HxMath.NaN;
    return Std.parseFloat(StringTools.ltrim(Std.string(value)));
  }

  static function jsParseInt(value:Dynamic, ?radix:Dynamic):Float {
    if (value == null) return HxMath.NaN;
    var text = StringTools.ltrim(Std.string(value));
    final radixValue = radix == null ? 10 : Std.int(radix);
    if (radixValue == 16 && !StringTools.startsWith(text.toLowerCase(), '0x')) text = '0x' + text;
    final parsed = Std.parseInt(text);
    return parsed == null ? HxMath.NaN : parsed;
  }

  static function jsCoercingIsNaN(value:Dynamic):Bool {
    if (value == null) return false;
    if (Std.isOfType(value, Float)) return HxMath.isNaN(cast value);
    if (Std.isOfType(value, Bool)) return false;
    return HxMath.isNaN(jsParseFloat(value));
  }

  static function jsCoercingIsFinite(value:Dynamic):Bool {
    if (value == null) return true;
    if (Std.isOfType(value, Float)) {
      final number:Float = cast value;
      return HxMath.isFinite(number) && !HxMath.isNaN(number);
    }
    if (Std.isOfType(value, Bool)) return true;
    final number = jsParseFloat(value);
    return HxMath.isFinite(number) && !HxMath.isNaN(number);
  }
  #end
}
