package flight._internal;

/** ECMAScript number formatting and parsing operations. */
class _Number {
  public static inline function parseInt(value:Dynamic, ?radix:Int):Float {
    #if js
    return js.Syntax.code("parseInt({0}, {1})", value, radix);
    #else
    if (radix == null || radix == 10) return Std.parseInt(Std.string(value));
    final parsed = Std.parseInt(Std.string(value));
    return parsed == null ? Math.NaN : parsed;
    #end
  }

  public static inline function toFixed(value:Dynamic, digits:Int = 0):String {
    #if js
    return js.Syntax.code("Number({0}).toFixed({1})", value, digits);
    #else
    final scale = Math.pow(10, digits);
    final rounded = Math.round(_Js.toNumber(value) * scale) / scale;
    final text = Std.string(rounded);
    if (digits <= 0) return text.split('.')[0];
    final parts = text.split('.');
    final fraction = parts.length > 1 ? parts[1] : '';
    return parts[0] + '.' + StringTools.rpad(fraction, '0', digits);
    #end
  }

  public static inline function toString(value:Dynamic, radix:Int = 10):String {
    #if js
    return js.Syntax.code("Number({0}).toString({1})", value, radix);
    #else
    final number = _Js.toNumber(value);
    if (radix == 10) return Std.string(number);
    if (radix < 2 || radix > 36) throw 'radix must be between 2 and 36';
    if (Math.isNaN(number) || !Math.isFinite(number)) return Std.string(number);
    final digits = '0123456789abcdefghijklmnopqrstuvwxyz';
    var integer = Std.int(Math.abs(number));
    if (integer == 0) return '0';
    var result = '';
    while (integer > 0) {
      result = digits.charAt(integer % radix) + result;
      integer = Std.int(integer / radix);
    }
    return number < 0 ? '-' + result : result;
    #end
  }
}
