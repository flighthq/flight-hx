// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

#if js
typedef _Promise<T> = js.lib.Promise<T>;
#else
class _Promise<T> {
  public function new(executor:(T->Void, Dynamic->Void)->Void) {
    executor(function(_) {}, function(_) {});
  }

  public function then<Next>(resolve:T->Next, ?reject:Dynamic->Next):_Promise<Next> {
    throw new haxe.exceptions.NotImplementedException('_Promise requires a target adapter.');
  }

  public function catchError<Next>(reject:Dynamic->Next):_Promise<Next> {
    throw new haxe.exceptions.NotImplementedException('_Promise requires a target adapter.');
  }

  public static function all<T>(values:Array<_Promise<T>>):_Promise<Array<T>> {
    throw new haxe.exceptions.NotImplementedException('_Promise requires a target adapter.');
  }

  public static function reject<T>(error:Dynamic):_Promise<T> {
    throw new haxe.exceptions.NotImplementedException('_Promise requires a target adapter.');
  }

  public static function resolve<T>(value:T):_Promise<T> {
    throw new haxe.exceptions.NotImplementedException('_Promise requires a target adapter.');
  }
}
#end
