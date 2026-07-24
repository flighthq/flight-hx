package;

import flighthq._internal._Float32Array;
import flighthq._internal._Int16Array;
import flighthq._internal._LimeTypedArray;
import flighthq._internal._Runtime;
import flighthq._internal._UInt16Array;
import flighthq._internal.backend.WebGl2Backend;

class LimeTypedArraySmoke {
  static function main():Void {
    final floats = new _Float32Array([1.0, 2.0, 3.0]);
    _Runtime.setIndex(floats, 1, 4.5);
    if (_Runtime.getIndex(floats, 1) != 4.5) throw 'float index';
    if (_Runtime.field(floats, 'length') != 3) throw 'float length';
    if (_Runtime.iterable(floats).join(',') != '1,4.5,3') throw 'float iterable';
    final copied = new _Float32Array(4);
    _Runtime.callProperty(copied, 'set', [floats, 1]);
    if (copied[1] != 1 || copied[2] != 4.5 || copied[3] != 3) throw 'float set';

    final signed = new _Int16Array([0x8000, 0xffff]);
    if (signed[0] != -32768 || signed[1] != -1) throw 'signed conversion';

    final unsigned = new _UInt16Array([-1, 0x10000]);
    _Runtime.fill(unsigned, 7, 0, 1, 4);
    if (unsigned[0] != 7 || unsigned[1] != 0) throw 'unsigned conversion';

    final storage:_LimeTypedArray = cast floats;
    if (!Std.isOfType(_LimeTypedArray.unwrap(storage), Array)) throw 'native unwrap';

    final gl = new FakeGl();
    WebGl2Backend.call(gl, 'bufferData', [1, floats, 2]);
    if (!Std.isOfType(gl.upload, Array)) throw 'GL upload did not receive native storage';
  }
}

class FakeGl {
  public var upload:Dynamic;

  public function new() {}

  public function bufferData(target:Dynamic, data:Dynamic, usage:Dynamic):Void {
    upload = data;
  }
}
