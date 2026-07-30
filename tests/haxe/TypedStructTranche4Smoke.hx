package;

class TypedStructTranche4Smoke {
  public static function main():Void {
    run();
  }

  public static function run():Void {
    final loopApp = flighthq.application.Application.createApplication();
    flighthq.application.Application.setLoopBackend(cast {
      cancelFrame: function(_:Dynamic):Void {},
      now: function():Float return 0.0,
      requestFrame: function(_:Dynamic):Dynamic return 1
    });
    flighthq.application.Application.startApplicationLoop(loopApp, {targetFrameRate: 60.0});
    if (!loopApp.isRunning) throw 'partial application-loop options failed';
    flighthq.application.Application.stopApplicationLoop(loopApp);
    flighthq.application.Application.setLoopBackend(null);

    final capabilities = flighthq.device.Device.createDeviceCapabilities();
    capabilities.hasKeyboard = true;
    capabilities.hasMouse = true;
    capabilities.hasStylus = true;
    final capabilitiesAlias = capabilities;
    flighthq.device.Device.getDeviceCapabilities(capabilities);
    if (capabilitiesAlias.hasKeyboard || capabilitiesAlias.hasMouse || capabilitiesAlias.hasStylus) {
      throw 'typed device-capability backend writes failed';
    }

    final statusInfo = flighthq.statusbar.Statusbar.createStatusBarInfo();
    statusInfo.height = 100.0;
    statusInfo.overlaysContent = true;
    statusInfo.visible = false;
    final statusAlias = statusInfo;
    flighthq.statusbar.Statusbar.getStatusBarInfo(statusInfo);
    if (statusAlias.height != -1.0 || statusAlias.overlaysContent || !statusAlias.visible) {
      throw 'typed status-bar backend writes failed';
    }
  }
}
