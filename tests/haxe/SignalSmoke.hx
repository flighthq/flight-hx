package;

class SignalSmoke {
  static function main():Void {
    final signal:flighthq.types.Signal<Float->Void> = flighthq.signals.Signals.createSignal();
    var emittedValue = 0.0;
    flighthq.signals.Signals.connectSignal(signal, function(value:Float) emittedValue = value);
    flighthq.signals.Signals.emitSignal(signal, 4.5);
    if (emittedValue != 4.5) throw 'signal arguments failed';
  }
}
