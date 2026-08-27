package;

class SignalSmoke {
  static function main():Void {
    final signal:flight.types.Signal<Float->Void> = flight.Signals.createSignal();
    var emittedValue = 0.0;
    flight.Signals.connectSignal(signal, function(value:Float) emittedValue = value);
    flight.Signals.emitSignal(signal, 4.5);
    if (emittedValue != 4.5) throw 'signal arguments failed';
  }
}
