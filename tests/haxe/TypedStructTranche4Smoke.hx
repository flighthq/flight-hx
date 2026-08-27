package;

@:access(flight._Application)
@:access(flight._Device)
@:access(flight._StatusBar)
class TypedStructTranche4Smoke {
  public static function main():Void {
    run();
  }

  public static function run():Void {
    final loopApp = flight._Application.createApplication();
    flight._Application.setLoopBackend(cast {
      cancelFrame: function(_:Dynamic):Void {},
      now: function():Float return 0.0,
      requestFrame: function(_:Dynamic):Dynamic return 1
    });
    flight._Application.startApplicationLoop(loopApp, {targetFrameRate: 60.0});
    if (!loopApp.isRunning) throw 'partial application-loop options failed';
    flight._Application.stopApplicationLoop(loopApp);
    flight._Application.setLoopBackend(null);

    final capabilities = flight._Device.createDeviceCapabilities();
    capabilities.hasKeyboard = true;
    capabilities.hasMouse = true;
    capabilities.hasStylus = true;
    final capabilitiesAlias = capabilities;
    flight._Device.getDeviceCapabilities(capabilities);
    if (capabilitiesAlias.hasKeyboard || capabilitiesAlias.hasMouse || capabilitiesAlias.hasStylus) {
      throw 'typed device-capability backend writes failed';
    }

    final statusInfo = flight._StatusBar.createStatusBarInfo();
    statusInfo.height = 100.0;
    statusInfo.overlaysContent = true;
    statusInfo.visible = false;
    final statusAlias = statusInfo;
    flight._StatusBar.getStatusBarInfo(statusInfo);
    if (statusAlias.height != -1.0 || statusAlias.overlaysContent || !statusAlias.visible) {
      throw 'typed status-bar backend writes failed';
    }
  }
}
