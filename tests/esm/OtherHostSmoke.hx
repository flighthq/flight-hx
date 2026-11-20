import flight.HostApp;
import flight.WindowAttachmentOwnership;
import flight.HostCapacitor;
import flight.HostElectron;
import flight.HostTauri;
import js.Syntax;
import js.lib.Promise;

class OtherHostSmoke {
  static function main() {
    final electron = HostElectron.window({});
    final electronWin = HostApp.createAppWindow();
    final browserWindow = {
      id: 42,
      on: (event:String, listener:Dynamic) -> {},
      off: (event:String, listener:Dynamic) -> {},
      close: () -> throw 'caller owns the Electron window',
    };
    if (!HostApp.attachWindow(electron.attach, electron.lifecycle, electronWin, browserWindow, WindowAttachmentOwnership.Host))
      throw 'Electron window attach failed';
    if (HostElectron.getWindowId(electronWin) != 42) throw 'Electron window did not retain its ID';
    if (!HostApp.closeWindow(electron.lifecycle, electronWin) || HostElectron.getWindowId(electronWin) != -1)
      throw 'Electron window did not detach';
    HostApp.disposeAppWindow(electronWin);

    final tauri = HostTauri.window({window: {}});
    final tauriWin = HostApp.createAppWindow();
    var cleanups = 0;
    final subscribe = (listener:Dynamic) -> Promise.resolve(() -> cleanups++);
    final tauriWindow = {
      close: () -> throw 'caller owns the Tauri window',
      onMoved: subscribe,
      onResized: subscribe,
      onFocusChanged: subscribe,
      onCloseRequested: subscribe,
    };
    if (!HostApp.attachWindow(tauri.attach, tauri.lifecycle, tauriWin, tauriWindow, WindowAttachmentOwnership.Host))
      throw 'Tauri window attach failed';
    if (!HostApp.closeWindow(tauri.lifecycle, tauriWin)) throw 'Tauri window close failed';
    HostApp.disposeAppWindow(tauriWin);

    final name = HostCapacitor.appName({
      app: {
        getInfo: () -> Promise.resolve({name: 'Flight Capacitor', version: '1'}),
      },
    });
    Promise.resolve(null).then(_ -> {
      if (cleanups != 4) throw 'Tauri window subscriptions leaked';
      if (HostApp.getAppName(name) != 'Flight Capacitor') throw 'Capacitor app name failed';
      trace('FLIGHT_OTHER_HOSTS_OK');
    }).catchError(error -> {
      Syntax.code("process.exitCode = 1");
      js.Syntax.code("console.error({0})", error);
      return null;
    });
  }
}
