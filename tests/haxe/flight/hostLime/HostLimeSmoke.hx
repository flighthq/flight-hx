package flight.hostLime;

#if lime
import flight._internal._Promise;
import flight._internal._UInt8Array;
import lime.app.Application;

// Behavioral smoke for the Lime host adapters on the canonical Host seam. The
// former per-backend install/explain/reset model is gone: capabilities are now
// composed into a Host (createLimeHost) and exercised as their decomposed sub-
// backends. This verifies the honest Lime-backed capabilities directly.
class HostLimeSmoke {
  static function main():Void {
    final application = new Application();
    application.meta.set('title', 'HostLime Smoke');
    application.meta.set('version', '1.2.3');

    testAppCapabilities(application);
    testHostComposition(application);
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
    testFileSystem();
    testStorage();
    #end
    #if !js
    GlDrawingBufferSmoke.run();
    #end
  }

  static function testAppCapabilities(application:Application):Void {
    final app = LimeApp.createLimeAppCapabilities(application);
    assert(app.name.getName() == 'HostLime Smoke', 'Lime app title metadata');
    assert(app.version.getVersion() == '1.2.3', 'Lime app version metadata');
    assert(app.locale.getPreferredSystemLanguages() != null, 'Lime preferred locale result');
    assert(app.path.getAppPath() != null, 'Lime app path result');
  }

  static function testHostComposition(application:Application):Void {
    final host = HostLime.createLimeHost(application);
    assert(host != null, 'Lime host composes');
    assert(host.app.name.getName() == 'HostLime Smoke', 'composed host app identity');
    assert(host.app.loop != null, 'composed host app loop');
    assert(host.clipboard.text != null, 'composed host clipboard text');
    assert(host.dialog.message != null, 'composed host dialog message');
    assert(host.screen.query != null, 'composed host screen query');
    assert(host.window != null, 'composed host window');
    assert(host.input.haptics != null, 'composed host haptics');
    assert(host.system.platform != null, 'composed host platform');
    assert(HostLime.createLimeHost(application) == host, 'host composition is cached per application');
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
  }

  static function testPassiveClipboard():Void {
    final baseline = lime.system.Clipboard.onUpdate.__listeners.length;
    final clipboard = LimeClipboard.createLimeClipboardCapabilities();
    assert(lime.system.Clipboard.onUpdate.__listeners.length == baseline, 'clipboard factory must be passive');
    var changed = 0;
    final listener = function():Void changed++;
    clipboard.change.subscribe(listener);
    assert(lime.system.Clipboard.onUpdate.__listeners.length == baseline + 1, 'clipboard change subscribes');
    clipboard.change.unsubscribe(listener);
    assert(lime.system.Clipboard.onUpdate.__listeners.length == baseline, 'clipboard change unsubscribes');
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
    final dialog = LimeDialog.createLimeApplicationDialogCapabilities(application);
    final message:Dynamic = awaitValue(dialog.message.message({message: 'headless'}));
    assert(message.cancelled == true, 'message without a live window is cancelled');
    assert(awaitValue(dialog.message.confirm({message: 'confirm'})) == false, 'confirm does not fabricate a choice');
    assert(awaitValue(dialog.prompt.prompt({message: 'prompt'})) == null, 'prompt reports unavailable input');
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

  static function testScreenAndHaptics(application:Application):Void {
    final screens:Array<Dynamic> = [];
    final screen = LimeScreen.createLimeScreenCapabilities(application);
    assert(screen.query.getScreens(cast screens) == screens, 'screen backend fills caller-owned output');
    final capabilities:Dynamic = {};
    final result:Dynamic = LimeHaptics.createLimeHapticsBackend().capabilities(capabilities);
    assert(result == capabilities && capabilities.patterns == false, 'haptics reports conservative capabilities');
  }

  static function testGlyphRasterizer(application:Application):Void {
    final enabled = HostLime.enableHostLimeGlyphRasterizer(application);
    #if (js || lime_cairo)
    assert(enabled, 'glyph rasterizer enabled when a raster surface exists');
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
    final pointerEvents:Array<Dynamic> = [];
    final keyEvents:Array<Dynamic> = [];
    flight.Signals.connectSignal(manager.onPointerDown, function(data):Void pointerEvents.push(data));
    flight.Signals.connectSignal(manager.onKeyDown, function(data):Void keyEvents.push(data));

    final dispose = LimeInput.attachLimeInput(window, manager, {touchFilter: touch -> touch.device == 42});
    assert(window.onMouseDown.__listeners.length == mouseBaseline + 1, 'input attaches window listeners');

    window.onKeyDown.dispatch(lime.ui.KeyCode.A, lime.ui.KeyModifier.SHIFT);
    assert(keyEvents.length == 1 && keyEvents[0].key == 'A', 'keyboard event forwarded');
    window.onMouseDown.dispatch(12, 34, lime.ui.MouseButton.LEFT);
    assert(pointerEvents.length == 1 && pointerEvents[0].x == 12 && pointerEvents[0].buttons == 1, 'mouse event forwarded');

    dispose();
    dispose();
    assert(window.onMouseDown.__listeners.length == mouseBaseline, 'input disposal is idempotent');
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
    removeTree(root);
  }

  static function testStorage():Void {
    final path = Sys.getCwd() + '/build/host-lime-storage.json';
    if (sys.FileSystem.exists(path)) sys.FileSystem.deleteFile(path);
    final backend = LimeStorage.createLimeStorageBackend(path);
    assert((backend.setItem('answer', '42') : Dynamic).reason == 'ok', 'storage set');
    final got:Dynamic = backend.getItem('answer');
    assert(got.reason == 'ok' && got.value == '42', 'storage get');
    final keys:Dynamic = backend.keys();
    assert(keys.value.length == 1, 'storage keys');
    assert((backend.removeItem('answer') : Dynamic).reason == 'ok', 'storage remove');
    if (sys.FileSystem.exists(path)) sys.FileSystem.deleteFile(path);

    final deniedPath = Sys.getCwd() + '/build/host-lime-storage-denied';
    removeTree(deniedPath);
    sys.FileSystem.createDirectory(deniedPath);
    final denied = LimeStorage.createLimeStorageBackend(deniedPath);
    assert((denied.setItem('unpersisted', 'value') : Dynamic).reason != 'ok', 'storage reports persistence denial');
    final deniedGot:Dynamic = denied.getItem('unpersisted');
    assert(deniedGot.value == null, 'failed storage mutation rolls back memory');
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

  static function assert(condition:Bool, message:String):Void {
    if (!condition) throw message;
  }
}
#end
