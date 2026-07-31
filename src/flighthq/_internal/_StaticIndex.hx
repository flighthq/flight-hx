// Maintained typed endpoints for checker-proven generated indexed access.
package flighthq._internal;

class _StaticIndex {
  public static inline function readArray(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : Array<Dynamic>)[Std.int(key)];
    #end
  }

  public static inline function writeArray(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : Array<Dynamic>)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readArrayOrFloat32Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #elseif lime
    if (Std.isOfType(source, Array)) return (cast source : Array<Dynamic>)[Std.int(key)];
    return (cast source : _LimeTypedArray).get(Std.int(key));
    #else
    return (cast source : Array<Dynamic>)[Std.int(key)];
    #end
  }

  public static inline function writeArrayOrFloat32Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #elseif lime
    if (Std.isOfType(source, Array)) {
      (cast source : Array<Dynamic>)[Std.int(key)] = value;
    } else {
      (cast source : _LimeTypedArray).setValue(Std.int(key), value);
    }
    #else
    (cast source : Array<Dynamic>)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readFloat32Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _Float32Array)[Std.int(key)];
    #end
  }

  public static inline function writeFloat32Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Float32Array)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readFloat64Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _Float64Array)[Std.int(key)];
    #end
  }

  public static inline function writeFloat64Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Float64Array)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readInt16Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _Int16Array)[Std.int(key)];
    #end
  }

  public static inline function writeInt16Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Int16Array)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readInt32Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _Int32Array)[Std.int(key)];
    #end
  }

  public static inline function writeInt32Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Int32Array)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readInt8Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _Int8Array)[Std.int(key)];
    #end
  }

  public static inline function writeInt8Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Int8Array)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readUint16Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _UInt16Array)[Std.int(key)];
    #end
  }

  public static inline function writeUint16Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _UInt16Array)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readUint16ArrayOrUint32Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #elseif lime
    return (cast source : _LimeTypedArray).get(Std.int(key));
    #else
    return (cast source : Array<Dynamic>)[Std.int(key)];
    #end
  }

  public static inline function readUint32Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _UInt32Array)[Std.int(key)];
    #end
  }

  public static inline function writeUint32Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _UInt32Array)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readUint8Array(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _UInt8Array)[Std.int(key)];
    #end
  }

  public static inline function writeUint8Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _UInt8Array)[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readUint8ClampedArray(source:Dynamic, key:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return (cast source : _UInt8ClampedArray)[Std.int(key)];
    #end
  }

  public static inline function writeUint8ClampedArray(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _UInt8ClampedArray)[Std.int(key)] = value;
    #end
    return value;
  }
}
