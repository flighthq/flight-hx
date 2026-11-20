package flight;

class HostApp {
  #if (js && flight_esm)
  public static inline function createAppWindow():AppWindow return AppExports.createAppWindow();
  public static inline function attachWindow(attach:WindowAttachCapability, lifecycle:WindowLifecycleCapability,
      win:AppWindow, handle:Dynamic, ownership:WindowAttachmentOwnership):Bool
    return AppExports.attachWindow(attach, lifecycle, win, handle, ownership == WindowAttachmentOwnership.Host ? "host" : "flight");
  public static inline function closeWindow(lifecycle:WindowLifecycleCapability, win:AppWindow):Bool
    return AppExports.closeWindow(lifecycle, win);
  public static inline function disposeAppWindow(win:AppWindow):Void AppExports.disposeAppWindow(win);

  public static inline function createAppLoop():AppLoop return AppExports.createAppLoop();
  public static inline function setAppLoopMainWindow(loop:AppLoop, window:AppWindow):Void
    AppExports.setAppLoopMainWindow(loop, window);
  public static inline function startAppLoop(scheduler:FrameScheduler, lifecycle:LifecycleCapability,
      loop:AppLoop, ?options:HostAppLoopOptions):Void {
    if (options == null) AppExports.startAppLoop(scheduler, lifecycle, loop);
    else AppExports.startAppLoop(scheduler, lifecycle, loop, options);
  }
  public static inline function stopAppLoop(loop:AppLoop):Void AppExports.stopAppLoop(loop);
  public static inline function disposeAppLoop(loop:AppLoop):Void AppExports.disposeAppLoop(loop);
  public static inline function isAppLoopRunning(loop:AppLoop):Bool return AppExports.isAppLoopRunning(loop);
  public static inline function getAppName(capability:AppNameCapability):String return AppExports.getAppName(capability);
  #end
}

#if (js && flight_esm)
abstract FrameScheduler(Dynamic) {}
abstract LifecycleCapability(Dynamic) {}
abstract WindowAttachCapability(Dynamic) {}
abstract WindowLifecycleCapability(Dynamic) {}
abstract AppNameCapability(Dynamic) {}

typedef WindowCapabilities = {
  final attach:WindowAttachCapability;
  final lifecycle:WindowLifecycleCapability;
};

typedef HostAppLoopOptions = {
  ?maxDeltaTime:Float,
  ?targetFrameRate:Float,
  ?backgroundFrameRate:Float,
  ?fixedTimeStep:Float,
  ?maxUpdatesPerFrame:Int,
};

@:jsRequire("@flighthq/app")
private extern class AppExports {
  static function createAppWindow():AppWindow;
  static function attachWindow(attach:WindowAttachCapability, lifecycle:WindowLifecycleCapability,
    win:AppWindow, handle:Dynamic, ownership:String):Bool;
  static function closeWindow(lifecycle:WindowLifecycleCapability, win:AppWindow):Bool;
  static function disposeAppWindow(win:AppWindow):Void;
  static function createAppLoop():AppLoop;
  static function setAppLoopMainWindow(loop:AppLoop, window:AppWindow):Void;
  static function startAppLoop(scheduler:FrameScheduler, lifecycle:LifecycleCapability, loop:AppLoop,
    ?options:HostAppLoopOptions):Void;
  static function stopAppLoop(loop:AppLoop):Void;
  static function disposeAppLoop(loop:AppLoop):Void;
  static function isAppLoopRunning(loop:AppLoop):Bool;
  static function getAppName(capability:AppNameCapability):String;
}
#end
