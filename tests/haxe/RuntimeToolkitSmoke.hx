package;

import flighthq._internal._HostValueLut;
import flighthq._internal._Runtime;

class RuntimeToolkitSmoke {
  public static function run():Void {
    #if !js
    final portableKeys = [
      'AbortController',
      'AbortSignal',
      'ArrayBuffer',
      'atob',
      'btoa',
      'cancelAnimationFrame',
      'console',
      'Date',
      'decodeURIComponent',
      'DOMException',
      'encodeURIComponent',
      'Float32Array',
      'performance',
      'RegExp',
      'requestAnimationFrame',
      'setInterval',
      'structuredClone',
      'TextEncoder',
      'Uint8Array',
    ];
    for (key in portableKeys) {
      if (_HostValueLut.typeofValue(key) == 'undefined') throw 'portable toolkit key resolved undefined: ' + key;
    }

    final date = _Runtime.construct(_HostValueLut.get('Date'), [1234.0]);
    if (!_Runtime.isInstanceOf(date, _HostValueLut.get('Date'))) throw 'portable Date identity failed';
    if (_Runtime.callProperty(date, 'getTime', []) != 1234.0) throw 'portable Date value failed';
    final now:Float = _Runtime.callProperty(_HostValueLut.get('Date'), 'now', []);
    if (now <= 0) throw 'portable Date.now failed';

    final expression = _Runtime.construct(_HostValueLut.get('RegExp'), ['^flight-(haxe)$']);
    if (!_Runtime.isInstanceOf(expression, _HostValueLut.get('RegExp'))) throw 'portable RegExp identity failed';
    if (!_Runtime.callProperty(expression, 'test', ['flight-haxe'])) throw 'portable RegExp.test failed';
    final match:Dynamic = _Runtime.callProperty(expression, 'exec', ['flight-haxe']);
    if (_Runtime.getIndex(match, 1) != 'haxe') throw 'portable RegExp.exec failed';

    final encoder:flighthq._internal.dom.TextEncoder = _Runtime.construct(_HostValueLut.get('TextEncoder'), []);
    final encoded = encoder.encode('hé');
    if (encoded.length != 3 || encoded[0] != 104 || encoded[1] != 195 || encoded[2] != 169) {
      throw 'portable TextEncoder UTF-8 failed';
    }
    final base64:String = _Runtime.callValue(_HostValueLut.get('btoa'), ['flight']);
    if (base64 != 'ZmxpZ2h0') throw 'portable btoa failed';
    if (_Runtime.callValue(_HostValueLut.get('atob'), [base64]) != 'flight') throw 'portable atob failed';

    final encodedUri:String = _Runtime.callValue(_HostValueLut.get('encodeURIComponent'), ['a b/é']);
    if (encodedUri != 'a%20b%2F%C3%A9') throw 'portable encodeURIComponent failed: ' + encodedUri;
    if (_Runtime.callValue(_HostValueLut.get('decodeURIComponent'), [encodedUri]) != 'a b/é') {
      throw 'portable decodeURIComponent failed';
    }

    final performance:flighthq._internal.dom.Performance = cast _HostValueLut.get('performance');
    if (performance.now() < 0 || performance.getEntriesByType('navigation').length != 0) {
      throw 'portable performance failed';
    }

    final buffer = _Runtime.construct(_HostValueLut.get('ArrayBuffer'), [4]);
    if (!_Runtime.isInstanceOf(buffer, _HostValueLut.get('ArrayBuffer'))) throw 'portable ArrayBuffer identity failed';
    if (_Runtime.callProperty(_HostValueLut.get('ArrayBuffer'), 'isView', [buffer])) {
      throw 'portable ArrayBuffer was classified as a view';
    }
    final byteView = new flighthq._internal._UInt8Array([1, 2, 3]);
    if (!_Runtime.callProperty(_HostValueLut.get('ArrayBuffer'), 'isView', [byteView])) {
      throw 'portable typed array was not classified as a view';
    }
    if (!_Runtime.isInstanceOf(byteView, _HostValueLut.get('Uint8Array'))) throw 'portable Uint8Array identity failed';
    final floatView = new flighthq._internal._Float32Array([1.5, 2.5]);
    if (!_Runtime.isInstanceOf(floatView, _HostValueLut.get('Float32Array'))) throw 'portable Float32Array identity failed';
    if (_Runtime.isInstanceOf(floatView, _HostValueLut.get('Uint8Array'))) throw 'typed-array identities collapsed';

    final controller:flighthq._internal.dom.AbortController = _Runtime.construct(_HostValueLut.get('AbortController'), []);
    var abortCalls = 0;
    var paddedAbortCalls = 0;
    controller.signal.addEventListener('abort', function():Void abortCalls++, {once: true});
    controller.signal.addEventListener('abort', function(_event:Dynamic):Void paddedAbortCalls++, {once: true});
    controller.abort('cancelled');
    controller.abort('again');
    if (!controller.signal.aborted || controller.signal.reason != 'cancelled' || abortCalls != 1 || paddedAbortCalls != 1) {
      throw 'portable AbortController propagation failed';
    }
    var threwReason = false;
    try {
      controller.signal.throwIfAborted();
    } catch (_reason:Dynamic) {
      threwReason = true;
    }
    if (!threwReason) throw 'portable AbortSignal.throwIfAborted failed';

    final left:flighthq._internal.dom.AbortController = _Runtime.construct(_HostValueLut.get('AbortController'), []);
    final right:flighthq._internal.dom.AbortController = _Runtime.construct(_HostValueLut.get('AbortController'), []);
    final combined = flighthq.connectivity.Connectivity.anyAbortSignal__connectivity(left.signal, right.signal);
    right.abort('combined');
    if (!combined.aborted || combined.reason != 'combined') {
      throw 'portable AbortSignal.any failed: aborted=' + combined.aborted + ', reason=' + Std.string(combined.reason);
    }

    final exception = _Runtime.construct(_HostValueLut.get('DOMException'), ['message', 'AbortError']);
    if (!_Runtime.isInstanceOf(exception, _HostValueLut.get('DOMException'))
      || (cast exception : flighthq._internal.dom.DOMException).name != 'AbortError') {
      throw 'portable DOMException identity failed';
    }

    final shared:Dynamic = {value: 7};
    final source:Dynamic = {left: shared, right: shared, values: [1, 2, 3]};
    final clone:Dynamic = _Runtime.callValue(_HostValueLut.get('structuredClone'), [source]);
    if (clone == source || clone.left == shared || clone.left != clone.right || clone.values == source.values) {
      throw 'portable structuredClone identity failed';
    }
    clone.left.value = 9;
    if (shared.value != 7) throw 'portable structuredClone retained source aliases';
    final cyclic:Dynamic = {name: 'root'};
    cyclic.self = cyclic;
    final cyclicClone:Dynamic = _Runtime.callValue(_HostValueLut.get('structuredClone'), [cyclic]);
    if (cyclicClone == cyclic || cyclicClone.self != cyclicClone) throw 'portable structuredClone cycle failed';

    final identityKey:Array<Dynamic> = [];
    final weakMap = _Runtime.construct(_HostValueLut.get('WeakMap'), []);
    _Runtime.callProperty(weakMap, 'set', [identityKey, 'identity']);
    if (_Runtime.callProperty(weakMap, 'get', [identityKey]) != 'identity') throw 'portable WeakMap array identity failed';
    final weakSet = _Runtime.construct(_HostValueLut.get('WeakSet'), []);
    _Runtime.callProperty(weakSet, 'add', [identityKey]);
    if (!_Runtime.callProperty(weakSet, 'has', [identityKey])) throw 'portable WeakSet array identity failed';

    final snapshot:Dynamic = flighthq.snapshot.CaptureSnapshot.captureSnapshot(cyclic);
    if (!flighthq._internal.DynamicObject.isFrozen(snapshot) || snapshot.self != snapshot) {
      throw 'portable snapshot freeze visitation failed';
    }
    final cyclicArray:Array<Dynamic> = [];
    cyclicArray.push(cyclicArray);
    final arraySnapshot:Dynamic = flighthq.snapshot.CaptureSnapshot.captureSnapshot(cyclicArray);
    if (!flighthq._internal.DynamicObject.isFrozen(arraySnapshot) || arraySnapshot[0] != arraySnapshot) {
      throw 'portable array snapshot identity failed';
    }

    final animationHandle = _Runtime.callValue(_HostValueLut.get('requestAnimationFrame'), [function(_time:Float):Void {}]);
    if (!Std.isOfType(animationHandle, Float)) throw 'portable animation-frame handle is not numeric';
    _Runtime.callValue(_HostValueLut.get('cancelAnimationFrame'), [animationHandle]);
    final interval = _Runtime.setInterval(function():Void {}, 1000);
    _Runtime.clearInterval(interval);
    #end
  }
}
