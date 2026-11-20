package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/snapshot")
extern class Snapshot {
  public static function captureSnapshot<T>(source:T):flight.esm.types.snapshot.Types.Snapshot<T>;
  public static function disableSnapshotGuards():Void;
  public static function enableSnapshotGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function equalsSnapshot<T>(a:flight.esm.types.snapshot.Types.Snapshot<T>, b:flight.esm.types.snapshot.Types.Snapshot<T>):Bool;
  public static function interpolateSnapshots<T>(a:flight.esm.types.snapshot.Types.Snapshot<T>, b:flight.esm.types.snapshot.Types.Snapshot<T>, t:Float, out:T, ?schema:Null<Array<String>>):Void;
  public static function restoreSnapshot<T>(snapshot:flight.esm.types.snapshot.Types.Snapshot<T>, target:T):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
