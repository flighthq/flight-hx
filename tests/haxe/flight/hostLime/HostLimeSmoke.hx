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

  static function resetBackends():Void {
    flight._App.resetAppBackendForTest();
    flight._Application.resetLoopBackendForTest();
    flight._Clipboard.resetClipboardBackendForTest();
    flight._Dialog.resetDialogBackendForTest();
    flight._Haptics.resetHapticsBackendForTest();
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
