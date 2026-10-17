import flight.HostSdlGl;

class WindowNative {
  static function main():Void {
    if (!runHostSdlGlSmoke()) throw 'flight-cpp SDL3/GL host smoke failed';
    Sys.println('WINDOW_NATIVE_OK');
  }
}
