package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/tween")
extern class Tween {
  public static function applyTween<T>(manager:flight.esm.types.tween_contract.Types.TweenManager, target:T, propertyMap:flight.esm.types.tween_contract.Types.NumericProps<T>):Void;
  public static function completeTween<T>(tween:flight.esm.types.tween_contract.Types.Tween<T>):Void;
  public static function createColorTween(manager:flight.esm.types.tween_contract.Types.TweenManager, target:Dynamic, property:String, duration:Float, toColor:Float, ?options:Null<flight.esm.types.tween_contract.Types.TweenOptions>):flight.esm.types.tween_contract.Types.Tween<Dynamic>;
  @:overload(function<T>(target:T, duration:Float, propertyMap:flight.esm.types.tween_contract.Types.NumericProps<T>, ?options:Null<flight.esm.types.tween_contract.Types.TweenOptions>):flight.esm.types.tween_contract.Types.Tween<T> {})
  public static function createTween<T>(manager:flight.esm.types.tween_contract.Types.TweenManager, target:T, duration:Float, propertyMap:flight.esm.types.tween_contract.Types.NumericProps<T>, ?options:Null<flight.esm.types.tween_contract.Types.TweenOptions>):flight.esm.types.tween_contract.Types.Tween<T>;
  public static function createTweenManager(?options:Null<flight.esm.types.tween_contract.Types.TweenManagerOptions>):flight.esm.types.tween_contract.Types.TweenManager;
  public static function createTweenStagger<T>(manager:flight.esm.types.tween_contract.Types.TweenManager, targets:Array<T>, duration:Float, propertyMap:flight.esm.types.tween_contract.Types.NumericProps<T>, ?stagger:Null<flight.esm.types.tween_contract.Types.TweenStaggerOptions>, ?options:Null<flight.esm.types.tween_contract.Types.TweenOptions>):Array<flight.esm.types.tween_contract.Types.Tween<T>>;
  public static function createTweenTimer(manager:flight.esm.types.tween_contract.Types.TweenManager, duration:Float, ?options:Null<flight.esm.types.tween_contract.Types.TweenOptions>):flight.esm.types.tween_contract.Types.Tween<Dynamic>;
  public static function getActiveTweenCount(manager:flight.esm.types.tween_contract.Types.TweenManager):Float;
  public static function getTweenProgress(tween:flight.esm.types.tween_contract.Types.Tween<Dynamic>):Float;
  public static function getTweensOf(manager:flight.esm.types.tween_contract.Types.TweenManager, target:Dynamic):Array<flight.esm.types.tween_contract.Types.Tween<Dynamic>>;
  public static function hasTweensOf(manager:flight.esm.types.tween_contract.Types.TweenManager, target:Dynamic):Bool;
  public static function killTweensOfProperty(manager:flight.esm.types.tween_contract.Types.TweenManager, key:String):Void;
  public static function pauseAllTweens(manager:flight.esm.types.tween_contract.Types.TweenManager):Void;
  public static function pauseTween(tween:flight.esm.types.tween_contract.Types.Tween<Dynamic>):Void;
  public static function pauseTweens(manager:flight.esm.types.tween_contract.Types.TweenManager, target:Dynamic):Void;
  public static function resetAllTweens(manager:flight.esm.types.tween_contract.Types.TweenManager):Void;
  public static function restartTween(tween:flight.esm.types.tween_contract.Types.Tween<Dynamic>, ?includeDelay:Bool):Void;
  public static function resumeAllTweens(manager:flight.esm.types.tween_contract.Types.TweenManager):Void;
  public static function resumeTween(tween:flight.esm.types.tween_contract.Types.Tween<Dynamic>):Void;
  public static function resumeTweens(manager:flight.esm.types.tween_contract.Types.TweenManager, target:Dynamic):Void;
  public static function seekTween(tween:flight.esm.types.tween_contract.Types.Tween<Dynamic>, timeSeconds:Float):Void;
  public static function setTweenProgress(tween:flight.esm.types.tween_contract.Types.Tween<Dynamic>, progress:Float):Void;
  public static function stopAllTweens(manager:flight.esm.types.tween_contract.Types.TweenManager, ?options:Null<flight.esm.types.tween_contract.Types.StopTweenOptions>):Void;
  public static function stopTween(tween:flight.esm.types.tween_contract.Types.Tween<Dynamic>, ?options:Null<flight.esm.types.tween_contract.Types.StopTweenOptions>):Void;
  public static function stopTweens(manager:flight.esm.types.tween_contract.Types.TweenManager, target:Dynamic, ?propertyMap:Null<flight.esm.types.tween_contract.Types.NumericProps<Dynamic>>, ?options:Null<flight.esm.types.tween_contract.Types.StopTweenOptions>):Void;
  public static function updateTweens(manager:flight.esm.types.tween_contract.Types.TweenManager, deltaTime:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
