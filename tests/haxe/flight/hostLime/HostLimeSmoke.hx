package flight.hostLime;

#if lime
import flight._internal._Promise;
import flight._internal._UInt8Array;
import lime.app.Application;

class HostLimeSmoke {
  static function main():Void {
    final application = new Application();
    application.meta.set('title', 'HostLime Smoke');
    application.meta.set('version', '1.2.3');

    testApp(application);
    testPassiveLoop(application);
    testPassiveClipboard();
    testAudioTiming();
    testDialog(application);
    testPlatform(application);
    testScreenAndHaptics(application);
    testGlyphRasterizer(application);
    testInput(application);
    #if sys
    testImage(application);
    #end
    testInstallPrecedence(application);
    #if sys
    testFileSystem();
    testStorage();
    #end

    resetBackends();
  }

  static function testApp(application:Application):Void {
    final backend = LimeApp.createLimeAppBackend(application);
    assert(backend.getName() == 'HostLime Smoke', 'Lime app title metadata');
    assert(backend.getVersion() == '1.2.3', 'Lime app version metadata');
    assert(backend.getCommandLine() != null, 'Lime command line');
    assert(backend.getPreferredSystemLanguages() != null, 'Lime preferred locale result');
  }

  static function testPassiveLoop(application:Application):Void {
    final baseline = application.onUpdate.__listeners.length;
    final backend = LimeLoop.createLimeLoopBackend(application);
    assert(application.onUpdate.__listeners.length == baseline, 'loop factory must be passive');
    var called = 0;
    backend.requestFrame(function(_time:Float):Void called++);
    assert(application.onUpdate.__listeners.length == baseline + 1, 'loop attaches while work is pending');
    application.onUpdate.dispatch(16);
    assert(called == 1, 'loop frame callback');
    assert(application.onUpdate.__listeners.length == baseline, 'loop detaches after draining');

    var threw = false;
    backend.requestFrame(function(_time:Float):Void throw 'expected frame error');
    try application.onUpdate.dispatch(16) catch (_:Dynamic) threw = true;
    assert(threw, 'loop propagates frame callback failures');
    assert(application.onUpdate.__listeners.length == baseline, 'loop detaches after a failed callback');
  }

  static function testPassiveClipboard():Void {
    final baseline = lime.system.Clipboard.onUpdate.__listeners.length;
    final backend = LimeClipboard.createLimeClipboardBackend();
    assert(lime.system.Clipboard.onUpdate.__listeners.length == baseline, 'clipboard factory must be passive');
    backend.getChangeCount();
    assert(lime.system.Clipboard.onUpdate.__listeners.length == baseline + 1, 'clipboard observes lazily');
  }

  static function testAudioTiming():Void {
    final context:Dynamic = LimeAudio.createLimeAudioContext();
    final buffer = context.createBuffer(1, 44100, 44100);
    final source = context.createBufferSource();
    source.buffer = buffer;
    source.connect(context.destination);
    source.start(0, 0.5, 0.25);
    final nativeSource:lime.media.AudioSource = cast Reflect.field((source : Dynamic), 'source');
    assert(nativeSource != null, 'audio source created');
    assert(nativeSource.offset == 500, 'Web Audio seconds map to pinned Lime millisecond offset');
    assert(nativeSource.length == 250, 'audio duration does not include the source offset');
    source.stop();
    context.close();
  }

  static function testDialog(application:Application):Void {
    final backend = LimeDialog.createLimeApplicationDialogBackend(application);
    final message:Dynamic = awaitValue(backend.message({message: 'headless'}));
    assert(message.cancelled == true, 'message without a live window is cancelled');
    assert(awaitValue(backend.confirm({message: 'confirm'})) == false, 'confirm does not fabricate a choice');
    assert(awaitValue(backend.prompt({message: 'prompt'})) == null, 'prompt reports unavailable input');
  }

  static function testPlatform(application:Application):Void {
    final out:Dynamic = {
      name: 'unknown',
      kind: 'unknown',
      version: '',
      arch: '',
      locale: '',
      isTouch: false,
      runtime: 'unknown',
      engine: 'unknown',
      engineVersion: '',
      endianness: 'unknown',
      pointerWidth: -1.0,
      osBuild: '',
      distro: '',
      distroVersion: '',
    };
    final result:Dynamic = LimePlatform.createLimePlatformBackend().getInfo(out);
    assert(result == out, 'platform backend fills caller-owned output');
    assert(result.runtime == 'native', 'eval Lime runtime is native');

    final lifecycle = LimeLifecycle.createLimeLifecycleBackend(application);
    assert(lifecycle.getState() == 'active', 'headless Lime lifecycle defaults active');
  }

  static function testInstallPrecedence(application:Application):Void {
    HostLime.enableHostLime(application);
    assert(flight.App.explainAppBackend().layer == 'host', 'app installed at host layer');
    assert(flight.FileSystem.explainFileSystemBackend().layer == 'host', 'filesystem installed at host layer');
    HostLime.enableHostLime(application);
    assert(!flight.App.explainAppBackend().conflict, 'same-app enabling is idempotent');
    assert(!flight.FileSystem.explainFileSystemBackend().conflict, 'same filesystem host is idempotent');
    flight._App.setAppBackend(LimeApp.createLimeAppBackend(application));
    assert(flight.App.explainAppBackend().layer == 'custom', 'custom app override remains in front of host');
    flight._App.setAppBackend(null);
    assert(flight.App.explainAppBackend().layer == 'host', 'clearing custom override reveals host');
  }

  static function testScreenAndHaptics(application:Application):Void {
    final screens:Array<Dynamic> = [];
    final screenBackend = LimeScreen.createLimeScreenBackend(application);
    assert(screenBackend.getScreens(cast screens) == screens, 'screen backend fills caller-owned output');
    final capabilities:Dynamic = {};
    final result:Dynamic = LimeHaptics.createLimeHapticsBackend().capabilities(capabilities);
    assert(result == capabilities && capabilities.patterns == false, 'haptics reports conservative capabilities');
  }

  static function testGlyphRasterizer(application:Application):Void {
    final enabled = HostLime.enableHostLimeGlyphRasterizer(application);
    #if (js || lime_cairo)
    assert(enabled, 'glyph rasterizer enabled when a raster surface exists');
    assert(flight.GlyphAtlas.explainGlyphRasterizerBackend().layer == 'host', 'glyph rasterizer host installation');
    #if (!js && lime_cairo && lime_cffi)
    final backend = flight.GlyphAtlas.getGlyphRasterizerBackend();
    final options:Dynamic = {fontFamily: 'sans-serif', fontSize: 18.0};
    final metrics = backend.measureMetrics(options);
    assert(metrics != null && metrics.ascent > 0, 'native glyph metrics');
    final glyph = backend.rasterize('A'.charCodeAt(0), options);
    assert(glyph != null && glyph.width > 0 && glyph.height > 0 && glyph.pixels.length > 0, 'native glyph rasterization');
    #end
    #else
    assert(!enabled, 'glyph rasterizer remains uninstalled without Cairo');
    #end
  }

  static function testInput(application:Application):Void {
    // A real native window cannot be opened by the interpreter, but Lime's event
    // surface is initialized by the passive Window constructor and is sufficient
    // to exercise this adapter without an SDL display.
    @:privateAccess final window = new lime.ui.Window(application, {});
    @:privateAccess window.__width = 320;
    @:privateAccess window.__height = 200;
    final manager = flight.Input.createInputManager();
    final mouseBaseline = window.onMouseDown.__listeners.length;
    final touchBaseline = lime.ui.Touch.onStart.__listeners.length;
    final pointerEvents:Array<Dynamic> = [];
    final keyEvents:Array<Dynamic> = [];
    final textEvents:Array<Dynamic> = [];
    final gamepadEvents:Array<Dynamic> = [];
    flight.Signals.connectSignal(manager.onPointerDown, function(data):Void pointerEvents.push(data));
    flight.Signals.connectSignal(manager.onPointerMoveRelative, function(data):Void pointerEvents.push(data));
    flight.Signals.connectSignal(manager.onPointerUp, function(data):Void pointerEvents.push(data));
    flight.Signals.connectSignal(manager.onWheel, function(data):Void pointerEvents.push(data));
    flight.Signals.connectSignal(manager.onKeyDown, function(data):Void keyEvents.push(data));
    flight.Signals.connectSignal(manager.onKeyUp, function(data):Void keyEvents.push(data));
    flight.Signals.connectSignal(manager.onTextEdit, function(data):Void textEvents.push(data));
    flight.Signals.connectSignal(manager.onTextInput, function(data):Void textEvents.push(data));
    flight.Signals.connectSignal(manager.onGamepadConnect, function(data):Void gamepadEvents.push(data));
    flight.Signals.connectSignal(manager.onGamepadAxisMove, function(data):Void gamepadEvents.push(data));
    flight.Signals.connectSignal(manager.onGamepadButtonDown, function(data):Void gamepadEvents.push(data));
    flight.Signals.connectSignal(manager.onGamepadDisconnect, function(data):Void gamepadEvents.push(data));

    final dispose = LimeInput.attachLimeInput(window, manager, {touchFilter: touch -> touch.device == 42});
    assert(window.onMouseDown.__listeners.length == mouseBaseline + 1, 'input attaches window listeners');
    assert(lime.ui.Touch.onStart.__listeners.length == touchBaseline + 1, 'input attaches filtered touch listeners');

    window.onKeyDown.dispatch(lime.ui.KeyCode.A, lime.ui.KeyModifier.SHIFT);
    window.onKeyDown.dispatch(lime.ui.KeyCode.A, lime.ui.KeyModifier.SHIFT);
    window.onKeyUp.dispatch(lime.ui.KeyCode.A, lime.ui.KeyModifier.NONE);
    assert(keyEvents.length == 3, 'keyboard events forwarded');
    assert(keyEvents[0].key == 'A', 'keyboard key identity: ' + keyEvents[0].key);
    assert(keyEvents[0].code == 'KeyA', 'keyboard code identity: ' + keyEvents[0].code);
    assert(keyEvents[0].shiftKey, 'keyboard modifiers');
    assert(!keyEvents[0].repeat && keyEvents[1].repeat, 'keyboard repeat derived per binding');
    window.onKeyDown.dispatch(lime.ui.KeyCode.NUMBER_1, lime.ui.KeyModifier.SHIFT);
    assert(keyEvents[3].key == '!', 'keyboard shifted printable identity');

    window.onMouseDown.dispatch(12, 34, lime.ui.MouseButton.LEFT);
    window.onMouseMoveRelative.dispatch(4, -2);
    window.onMouseWheel.dispatch(3, -5, lime.ui.MouseWheelMode.LINES);
    window.onMouseUp.dispatch(15, 30, lime.ui.MouseButton.LEFT);
    assert(pointerEvents.length == 4, 'mouse events forwarded');
    assert(pointerEvents[0].x == 12 && pointerEvents[0].y == 34 && pointerEvents[0].buttons == 1, 'mouse position and mask');
    assert(pointerEvents[1].deltaX == 4 && pointerEvents[1].deltaY == -2, 'relative mouse delta');
    assert(pointerEvents[2].wheelMode == 'lines' && pointerEvents[2].x == 12, 'wheel units and last position');
    assert(pointerEvents[3].buttons == 0 && pointerEvents[3].pressure == 0, 'mouse release state');

    window.onTextEdit.dispatch('compose', 0, 7);
    window.onTextInput.dispatch('done');
    assert(textEvents.length == 2 && textEvents[0].isComposing && !textEvents[1].isComposing, 'text composition state');

    // Lime exposes a touch-device id, not an originating window id. The
    // explicit filter routes devices; normalized coordinates become pixels.
    lime.ui.Touch.onStart.dispatch(new lime.ui.Touch(0.5, 0.25, 7, 0, 0, 0.75, 41));
    assert(pointerEvents.length == 4, 'touch filter rejects another device');
    lime.ui.Touch.onStart.dispatch(new lime.ui.Touch(0.5, 0.25, 7, 0.1, 0.2, 0.75, 42));
    assert(pointerEvents.length == 5, 'touch forwarded');
    assert(pointerEvents[4].x == 160 && pointerEvents[4].y == 50 && pointerEvents[4].pointerId == 8, 'touch coordinates and stable id');
    lime.ui.Touch.onEnd.dispatch(new lime.ui.Touch(0.5, 0.25, 7, 0, 0, 0.75, 42));
    assert(pointerEvents.length == 6 && pointerEvents[5].buttons == 0, 'touch release state');

    manager.enabled = false;
    window.onMouseDown.dispatch(1, 2, lime.ui.MouseButton.LEFT);
    assert(pointerEvents.length == 6, 'disabled input manager suppresses emission');

    manager.enabled = true;
    final gamepadBaseline = lime.ui.Gamepad.onConnect.__listeners.length;
    final disposeGamepads = LimeInput.attachLimeGamepadInput(manager);
    final gamepad = new lime.ui.Gamepad(9);
    lime.ui.Gamepad.onConnect.dispatch(gamepad);
    gamepad.onAxisMove.dispatch(lime.ui.GamepadAxis.LEFT_X, 0.5);
    gamepad.onButtonDown.dispatch(lime.ui.GamepadButton.A);
    gamepad.onDisconnect.dispatch();
    assert(gamepadEvents.length == 4, 'gamepad lifecycle and controls forwarded');
    assert(gamepadEvents[0].gamepad == 9 && gamepadEvents[0].mapping == 'standard', 'gamepad connection identity');
    assert(gamepadEvents[1].axis == (lime.ui.GamepadAxis.LEFT_X : Int) && gamepadEvents[1].value == 0.5,
      'gamepad axis data');
    disposeGamepads();
    disposeGamepads();
    assert(lime.ui.Gamepad.onConnect.__listeners.length == gamepadBaseline, 'gamepad disposal is idempotent');

    dispose();
    dispose();
    assert(window.onMouseDown.__listeners.length == mouseBaseline, 'input disposal is idempotent');
    assert(lime.ui.Touch.onStart.__listeners.length == touchBaseline, 'input removes global touch listeners');
  }

  #if sys
  static function testImage(application:Application):Void {
    final pixels = new lime.utils.UInt8Array(8);
    pixels[0] = 200;
    pixels[1] = 100;
    pixels[2] = 50;
    pixels[3] = 128;
    pixels[4] = 20;
    pixels[5] = 40;
    pixels[6] = 60;
    pixels[7] = 255;
    final native = new lime.graphics.Image(new lime.graphics.ImageBuffer(pixels, 2, 1, 32,
      lime.graphics.PixelFormat.RGBA32));

    HostLime.enableHostLimeImage(application);
    final explanation = flight.Image.explainImageBackend();
    assert(explanation.layer == 'host' && explanation.viability == 'unobserved', 'image host installation');

    @:privateAccess final premultiplied = flight._internal.backend.WebGl2Backend.nativeImagePixels(native, true);
    assert(premultiplied[0] == 100 && premultiplied[1] == 50 && premultiplied[2] == 25,
      'native GL image upload premultiplies straight alpha');
    @:privateAccess final decodedDataUrl = LimeImage.decodeDataUrl('data:image/png;base64,aW1hZ2U=');
    assert(decodedDataUrl.toString() == 'image', 'native image backend decodes generated base64 data URLs');

    final controller = new flight._internal._AbortController();
    controller.abort('cancelled');
    assert(awaitFailure(cast LimeImage.createLimeImageBackend().loadImageFromUrl('unused.png', null, controller.signal)) == 'cancelled',
      'native image load honors an already-aborted signal');
  }
  #end

  #if sys
  static function testFileSystem():Void {
    final root = Sys.getCwd() + '/build/host-lime-smoke';
    removeTree(root);
    sys.FileSystem.createDirectory(root);
    final backend = LimeFileSystem.createLimeFileSystemBackend();
    final bytes = new _UInt8Array(haxe.io.Bytes.ofHex('00017fff'));
    assert(awaitValue(backend.writeBinaryFile(root + '/bytes.bin', bytes)) == true, 'write Flight UInt8Array');
    final read:_UInt8Array = cast awaitValue(backend.readBinaryFile(root + '/bytes.bin'));
    assert(read != null && read.length == 4 && read[2] == 127 && read[3] == 255, 'read Flight UInt8Array');
    assert(awaitValue(backend.writeTextFile(root + '/atomic.txt', 'old')) == true, 'seed atomic file');
    assert(awaitValue(backend.writeFileAtomic(root + '/atomic.txt', 'new')) == true, 'atomic replace');
    assert(awaitValue(backend.readTextFile(root + '/atomic.txt')) == 'new', 'atomic replacement contents');
    assert(awaitValue(backend.canAccessFile(root + '/atomic.txt', 'readable')) == true, 'readability probe');
    removeTree(root);
  }

  static function testStorage():Void {
    final path = Sys.getCwd() + '/build/host-lime-storage.json';
    if (sys.FileSystem.exists(path)) sys.FileSystem.deleteFile(path);
    final backend = LimeStorage.createLimeStorageBackend(path);
    assert(backend.setItem('answer', '42'), 'storage set');
    assert(backend.getItem('answer') == '42', 'storage get');
    assert(backend.keys().length == 1, 'storage keys');
    assert(backend.removeItem('answer'), 'storage remove');
    if (sys.FileSystem.exists(path)) sys.FileSystem.deleteFile(path);

    final deniedPath = Sys.getCwd() + '/build/host-lime-storage-denied';
    removeTree(deniedPath);
    sys.FileSystem.createDirectory(deniedPath);
    final denied = LimeStorage.createLimeStorageBackend(deniedPath);
    assert(!denied.setItem('unpersisted', 'value'), 'storage reports persistence denial');
    assert(denied.getItem('unpersisted') == null, 'failed storage mutation rolls back memory');
    removeTree(deniedPath);
  }

  static function removeTree(path:String):Void {
    if (!sys.FileSystem.exists(path)) return;
    if (!sys.FileSystem.isDirectory(path)) {
      sys.FileSystem.deleteFile(path);
      return;
    }
    for (name in sys.FileSystem.readDirectory(path)) removeTree(path + '/' + name);
    sys.FileSystem.deleteDirectory(path);
  }
  #end

  static function awaitValue(promise:_Promise<Dynamic>):Dynamic {
    var settled = false;
    var result:Dynamic = null;
    var failure:Dynamic = null;
    promise.then(function(value:Dynamic):Dynamic {
      settled = true;
      result = value;
      return value;
    }, function(error:Dynamic):Dynamic {
      settled = true;
      failure = error;
      return null;
    });
    if (!settled) throw 'HostLime smoke expected a synchronous native result';
    if (failure != null) throw failure;
    return result;
  }

  static function awaitFailure(promise:_Promise<Dynamic>):Dynamic {
    var settled = false;
    var failure:Dynamic = null;
    promise.then(function(value:Dynamic):Dynamic {
      settled = true;
      return value;
    }, function(error:Dynamic):Dynamic {
      settled = true;
      failure = error;
      return null;
    });
    if (!settled) throw 'HostLime smoke expected a synchronous native rejection';
    if (failure == null) throw 'HostLime smoke expected a rejection';
    return failure;
  }

  static function resetBackends():Void {
    flight._App.resetAppBackendForTest();
    flight._Application.resetLoopBackendForTest();
    flight._Clipboard.resetClipboardBackendForTest();
    flight._Dialog.resetDialogBackendForTest();
    flight._GlyphAtlas.resetGlyphRasterizerBackendForTest();
    flight._Haptics.resetHapticsBackendForTest();
    flight._Image.resetImageBackendForTest();
    flight._Lifecycle.resetLifecycleBackendForTest();
    flight._Platform.resetPlatformBackendForTest();
    flight._Screen.resetScreenBackendForTest();
    #if sys
    flight._FileSystem.resetFileSystemBackendForTest();
    flight._Storage.resetStorageBackendForTest();
    #end
  }

  static function assert(condition:Bool, message:String):Void {
    if (!condition) throw message;
  }
}
#end
