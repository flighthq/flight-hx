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
    final loopHost:flight._internal._Intersection2<flight.types.HasAppLoop, flight.types.HasAppVisibilityQuery> = cast {
      app: {
        loop: {
          cancelFrame: function(_:Dynamic):Void {},
          now: function():Float return 0.0,
          requestFrame: function(_:Dynamic):Dynamic return 1
        },
        visibility: {isVisible: function():Bool return true}
      }
    };
    flight._Application.startApplicationLoop(loopHost, loopApp, {targetFrameRate: 60.0});
    if (!loopApp.isRunning) throw 'partial application-loop options failed';
    flight._Application.stopApplicationLoop(loopApp);

    final capabilities = flight._Device.createDeviceCapabilities();
    capabilities.hasKeyboard = true;
    capabilities.hasMouse = true;
    capabilities.hasStylus = true;
    final capabilitiesAlias = capabilities;
    final deviceHost:flight.types.HasSystemDevice = cast {
      system: {
        device: {
          getCapabilities: function(out:flight.types.DeviceCapabilities):flight.types.DeviceCapabilities {
            out.hasKeyboard = false;
            out.hasMouse = false;
            out.hasStylus = false;
            return out;
          }
        }
      }
    };
    flight._Device.getDeviceCapabilities(deviceHost, capabilities);
    if (capabilitiesAlias.hasKeyboard || capabilitiesAlias.hasMouse || capabilitiesAlias.hasStylus) {
      throw 'typed device-capability backend writes failed';
    }

    final statusInfo = flight._StatusBar.createStatusBarInfo();
    statusInfo.height = 100.0;
    statusInfo.overlaysContent = true;
    statusInfo.visible = false;
    final statusAlias = statusInfo;
    final statusHost:flight.types.HasUiStatusBarInfo = cast {
      ui: {
        statusBarInfo: {
          getInfo: function(out:flight.types.StatusBarInfo):flight.types.StatusBarInfo {
            out.height = -1.0;
            out.overlaysContent = false;
            out.visible = true;
            return out;
          }
        }
      }
    };
    flight._StatusBar.getStatusBarInfo(statusHost, statusInfo);
    if (statusAlias.height != -1.0 || statusAlias.overlaysContent || !statusAlias.visible) {
      throw 'typed status-bar backend writes failed';
    }
  }
}
