package flight._internal;

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
    'AudioContext',
    'Blob',
    'Buffer',
    'CSSStyleDeclaration',
    'ClipboardItem',
    'DOMException',
    'DataView',
    'Date',
    'DeviceMotionEvent',
    'Document',
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
    'ShadowRoot',
    'SharedArrayBuffer',
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
    'matchMedia',
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
    'AbortController',
    'AbortSignal',
    'ArrayBuffer',
    'atob',
    'AudioBuffer',
    'btoa',
    'Blob',
    'cancelAnimationFrame',
    'console',
    'DataView',
    'Date',
    'decodeURIComponent',
    'DOMException',
    'encodeURIComponent',
    'Float32Array',
    'Float64Array',
    'ImageData',
    'Int16Array',
    'Int32Array',
    'Int8Array',
    'Map',
    'Number',
    'performance',
    'RegExp',
    'requestAnimationFrame',
    'Set',
    'setInterval',
    'structuredClone',
    'TextDecoder',
    'TextEncoder',
    'Uint16Array',
    'Uint32Array',
    'Uint8Array',
    'Uint8ClampedArray',
    'URL',
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
      case 'AbortController': _AbortController;
      case 'AbortSignal': abortSignalConstructor();
      case 'Blob': _Blob;
      case 'Map': _Map;
      case 'Set': _Set;
      case 'WeakMap': _WeakMap;
      case 'WeakSet': _WeakSet;
      case 'Float32Array' | 'Float64Array' | 'Int16Array' | 'Int32Array' | 'Int8Array' | 'Uint16Array' | 'Uint32Array' | 'Uint8Array'
        | 'Uint8ClampedArray':
        typedArrayConstructor(name);
      case 'URL': _URL;
      case 'ImageData': createImageData;
      case 'AudioBuffer': createAudioBuffer;
      case 'ArrayBuffer': arrayBufferConstructor();
      case 'atob': decodeBase64;
      case 'btoa': encodeBase64;
      case 'cancelAnimationFrame': _HostScheduler.cancelAnimationFrame;
      case 'console': consoleNamespace();
      case 'Date': dateConstructor();
      case 'decodeURIComponent': decodeUriComponent;
      case 'DOMException': _DOMException;
      case 'encodeURIComponent': encodeUriComponent;
      case 'globalThis': globalThisNamespace();
      case 'TextDecoder': _TextDecoder;
      case 'TextEncoder': _TextEncoder;
      case 'DataView': _DataView;
      case 'Number': numberNamespace();
      case 'performance': performanceNamespace();
      case 'RegExp': regExpConstructor();
      case 'requestAnimationFrame': _HostScheduler.requestAnimationFrame;
      case 'setInterval': _Runtime.setInterval;
      case 'structuredClone': _StructuredClone.clone;
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
  static var abortSignalConstructorValue:_HostConstructor;
  static var arrayBufferConstructorValue:_HostConstructor;
  static var consoleValue:_Console;
  static var dateConstructorValue:_HostConstructor;
  static var performanceValue:_Performance;
  static var regExpConstructorValue:_HostConstructor;
  static final typedArrayConstructorValues:Map<String, _HostConstructor> = [];

  static function globalThisNamespace():Dynamic {
    if (globalThisValue == null) {
      globalThisValue = {
        AbortController: _AbortController,
        AbortSignal: abortSignalConstructor(),
        ArrayBuffer: arrayBufferConstructor(),
        AudioBuffer: createAudioBuffer,
        Date: dateConstructor(),
        ImageData: createImageData,
        performance: performanceNamespace(),
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
    return new flight._internal.backend.NativeAudioBuffer(options);
  }

  static function abortSignalConstructor():_HostConstructor {
    if (abortSignalConstructorValue == null) {
      abortSignalConstructorValue = new _HostConstructor(null, function(value:Dynamic):Bool return Std.isOfType(value, _AbortSignal));
      abortSignalConstructorValue.any = _AbortSignal.any;
    }
    return abortSignalConstructorValue;
  }

  static function arrayBufferConstructor():_HostConstructor {
    if (arrayBufferConstructorValue == null) {
      arrayBufferConstructorValue = new _HostConstructor(
        function(arguments:Array<Dynamic>):Dynamic return createArrayBuffer(arguments.length == 0 ? null : arguments[0]),
        function(value:Dynamic):Bool return Std.isOfType(value, haxe.io.Bytes),
      );
      arrayBufferConstructorValue.isView = isArrayBufferView;
    }
    return arrayBufferConstructorValue;
  }

  static function consoleNamespace():_Console {
    if (consoleValue == null) consoleValue = new _Console();
    return consoleValue;
  }

  static function dateConstructor():_HostConstructor {
    if (dateConstructorValue == null) {
      dateConstructorValue = new _HostConstructor(
        function(arguments:Array<Dynamic>):Dynamic return new _Date(arguments.length == 0 ? null : arguments[0]),
        function(value:Dynamic):Bool return Std.isOfType(value, _Date),
      );
      dateConstructorValue.now = _Date.now;
    }
    return dateConstructorValue;
  }

  static function performanceNamespace():_Performance {
    if (performanceValue == null) performanceValue = new _Performance();
    return performanceValue;
  }

  static function regExpConstructor():_HostConstructor {
    if (regExpConstructorValue == null) {
      regExpConstructorValue = new _HostConstructor(createRegExp, function(value:Dynamic):Bool return Std.isOfType(value, EReg));
    }
    return regExpConstructorValue;
  }

  static function typedArrayConstructor(name:String):_HostConstructor {
    var constructor = typedArrayConstructorValues.get(name);
    if (constructor == null) {
      constructor = new _HostConstructor(
        function(arguments:Array<Dynamic>):Dynamic return createTypedArray(name, arguments),
        function(value:Dynamic):Bool return isTypedArrayKind(value, name),
      );
      typedArrayConstructorValues.set(name, constructor);
    }
    return constructor;
  }

  static function createTypedArray(name:String, arguments:Array<Dynamic>):Dynamic {
    final source = arguments.length == 0 ? 0 : arguments[0];
    final byteOffset = arguments.length < 2 || arguments[1] == null ? null : Std.int(arguments[1]);
    final length = arguments.length < 3 || arguments[2] == null ? null : Std.int(arguments[2]);
    return switch (name) {
      case 'Float32Array': _Float32Array.construct(source, byteOffset, length);
      case 'Float64Array': _Float64Array.construct(source, byteOffset, length);
      case 'Int16Array': _Int16Array.construct(source, byteOffset, length);
      case 'Int32Array': _Int32Array.construct(source, byteOffset, length);
      case 'Int8Array': _Int8Array.construct(source, byteOffset, length);
      case 'Uint16Array': _UInt16Array.construct(source, byteOffset, length);
      case 'Uint32Array': _UInt32Array.construct(source, byteOffset, length);
      case 'Uint8Array': _UInt8Array.construct(source, byteOffset, length);
      case 'Uint8ClampedArray': _UInt8ClampedArray.construct(source, byteOffset, length);
      default: throw 'Unsupported typed-array constructor: ' + name;
    };
  }

  static function isTypedArrayKind(value:Dynamic, name:String):Bool {
    #if lime
    if (Std.isOfType(value, _LimeTypedArray)) {
      return (cast value : _LimeTypedArray).isKind(typedArrayKind(name));
    }
    if (Std.isOfType(value, lime.utils.ArrayBufferView)) {
      final view:lime.utils.ArrayBufferView = cast value;
      return _LimeTypedArray.typeToKind(view.type) == typedArrayKind(name);
    }
    #end
    if (Std.isOfType(value, haxe.io.Bytes)) return name == 'Uint8Array';
    if (!Std.isOfType(value, Array)) return false;
    final values:Array<Dynamic> = cast value;
    final wantsFloat = name == 'Float32Array' || name == 'Float64Array' || name == 'Uint32Array';
    for (entry in values) {
      final isFloat = switch (Type.typeof(entry)) {
        case TFloat: true;
        default: false;
      };
      if (isFloat != wantsFloat) return false;
    }
    return true;
  }

  static function typedArrayKind(name:String):String {
    return switch (name) {
      case 'Float32Array': 'float32';
      case 'Float64Array': 'float64';
      case 'Int16Array': 'int16';
      case 'Int32Array': 'int32';
      case 'Int8Array': 'int8';
      case 'Uint16Array': 'uint16';
      case 'Uint32Array': 'uint32';
      case 'Uint8Array': 'uint8';
      case 'Uint8ClampedArray': 'uint8clamped';
      default: '';
    };
  }

  static function isArrayBufferView(value:Dynamic):Bool {
    if (Std.isOfType(value, _DataView) || Std.isOfType(value, Array)) return true;
    #if lime
    return Std.isOfType(value, _LimeTypedArray) || Std.isOfType(value, lime.utils.ArrayBufferView);
    #else
    return false;
    #end
  }

  static function createRegExp(arguments:Array<Dynamic>):Dynamic {
    final pattern = arguments.length == 0 ? '' : arguments[0];
    if (Std.isOfType(pattern, EReg) && arguments.length < 2) return pattern;
    final rawFlags = arguments.length < 2 || arguments[1] == null ? '' : Std.string(arguments[1]);
    final flags = [for (index in 0...rawFlags.length) {
      final flag = rawFlags.charAt(index);
      if ('gimsu'.indexOf(flag) >= 0) flag else '';
    }].join('');
    return new EReg(Std.string(pattern), flags);
  }

  static function decodeBase64(value:Dynamic):String {
    final input = Std.string(value);
    final normalized = new StringBuf();
    for (index in 0...input.length) {
      final character = input.charAt(index);
      final code = StringTools.fastCodeAt(input, index);
      if (' \t\r\n'.indexOf(character) < 0 && code != 12) normalized.add(character);
    }
    try {
      final bytes = haxe.crypto.Base64.decode(normalized.toString());
      final output = new StringBuf();
      for (index in 0...bytes.length) output.addChar(bytes.get(index));
      return output.toString();
    } catch (_:Dynamic) {
      throw new _DOMException('The string is not correctly encoded', 'InvalidCharacterError');
    }
  }

  static function encodeBase64(value:Dynamic):String {
    final input = Std.string(value);
    final bytes = haxe.io.Bytes.alloc(input.length);
    for (index in 0...input.length) {
      final code = StringTools.fastCodeAt(input, index);
      if (code > 0xff) throw new _DOMException('The string contains characters outside of the Latin1 range', 'InvalidCharacterError');
      bytes.set(index, code);
    }
    return haxe.crypto.Base64.encode(bytes);
  }

  static function encodeUriComponent(value:Dynamic):String {
    final bytes = haxe.io.Bytes.ofString(Std.string(value));
    final output = new StringBuf();
    final hex = '0123456789ABCDEF';
    for (index in 0...bytes.length) {
      final byte = bytes.get(index);
      if ((byte >= 65 && byte <= 90) || (byte >= 97 && byte <= 122) || (byte >= 48 && byte <= 57)
        || byte == 45 || byte == 95 || byte == 46 || byte == 33 || byte == 126 || byte == 42 || byte == 39 || byte == 40 || byte == 41) {
        output.addChar(byte);
      } else {
        output.add('%');
        output.add(hex.charAt(byte >> 4));
        output.add(hex.charAt(byte & 15));
      }
    }
    return output.toString();
  }

  static function decodeUriComponent(value:Dynamic):String {
    final input = Std.string(value);
    final output = new StringBuf();
    var index = 0;
    while (index < input.length) {
      if (input.charAt(index) != '%') {
        output.add(input.charAt(index++));
        continue;
      }
      final bytes = new haxe.io.BytesBuffer();
      while (index < input.length && input.charAt(index) == '%') {
        if (index + 2 >= input.length) throw new _DOMException('URI malformed', 'URIError');
        final byte = Std.parseInt('0x' + input.substr(index + 1, 2));
        if (byte == null) throw new _DOMException('URI malformed', 'URIError');
        bytes.addByte(byte);
        index += 3;
      }
      output.add(bytes.getBytes().toString());
    }
    return output.toString();
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
        isSafeInteger: function(value:Dynamic):Bool {
          if (!Std.isOfType(value, Float)) return false;
          final number:Float = cast value;
          return HxMath.isFinite(number) && !HxMath.isNaN(number) && number == HxMath.ffloor(number)
            && HxMath.abs(number) <= 9007199254740991.0;
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
