package flight_hx;

#if macro
import haxe.io.Path;
import haxe.macro.Compiler;
import haxe.macro.Context;
import sys.FileSystem;
import sys.io.File;

class Native {
  public static function configure(root:String):Void {
    var platform = Context.definedValue('flight_native_platform');
    if (platform == null) {
      final arm = Context.defined('HXCPP_ARM64') || Context.defined('arm64');
      if (Context.defined('iphoneos') || Context.defined('iphonesim') || Context.defined('ios')) {
        platform = Context.defined('iphonesim') ? (arm ? 'iPhoneSimulatorArm64' : 'iPhoneSimulator64') : 'iPhoneOSArm64';
      } else if (Context.defined('linux')) platform = arm ? 'LinuxArm64' : 'Linux64';
      else if (Context.defined('mac')) platform = arm ? 'MacArm64' : 'Mac64';
      else if (Context.defined('windows')) platform = 'Windows64';
      else platform = switch (Sys.systemName()) {
        case 'Linux': 'Linux64'; case 'Mac': 'Mac64'; case 'Windows': 'Windows64'; default: '';
      };
    }
    final supported = ['Linux64', 'LinuxArm64', 'Mac64', 'MacArm64', 'Windows64', 'iPhoneOSArm64', 'iPhoneSimulatorArm64', 'iPhoneSimulator64'];
    if (supported.indexOf(platform) < 0) Context.fatalError('Unsupported Flight native platform: ' + platform, Context.currentPos());
    Compiler.define('flight_native_platform', platform);
    Compiler.define('flight_native_root', root);
    if (Context.defined('cpp')) {
      Compiler.addGlobalMetadata('flight._cpp', '@:include("flight_ffi.h")', true, true, false);
      Compiler.addGlobalMetadata('flight._cpp', '@:unreflective', true, true, true);
      Context.onAfterInitMacros(function() Context.getType('flight_hx.NativeLink'));
    }
    // --no-output surface checks never run this callback. Real builds validate the artifact
    // identity and deploy the shared dependencies beside ordinary Haxe output, independently of Lime.
    Context.onAfterGenerate(function() {
      final manifestPath = Path.join([root, 'native', 'artifacts', platform + '.json']);
      if (!FileSystem.exists(manifestPath)) Context.fatalError('Flight binaries for ' + platform + ' are missing. Run npm run native:build or obtain the matching binary package.', Context.currentPos());
      final manifest:Dynamic = haxe.Json.parse(File.getContent(manifestPath));
      final expected = haxe.crypto.Sha256.make(File.getBytes(Path.join([root, 'generated/externs/provenance.json']))).toHex();
      if (manifest.externProvenanceSha256 != expected) Context.fatalError('Flight binaries do not match the installed externs.', Context.currentPos());
      final hl = Context.defined('hl');
      if (hl && manifest.hashLink != true) Context.fatalError('Flight HashLink adapter is missing for ' + platform, Context.currentPos());
      final output = hl ? Path.directory(Compiler.getOutput()) : Compiler.getOutput();
      if (!FileSystem.exists(output)) FileSystem.createDirectory(output);
      for (entry in (cast manifest.files:Array<Dynamic>)) {
        final source = Path.join([root, entry.path]);
        if (!FileSystem.exists(source) || FileSystem.stat(source).size != entry.size ||
            (StringTools.endsWith(source, '.h') && haxe.crypto.Sha256.make(File.getBytes(source)).toHex() != entry.sha256))
          Context.fatalError('Flight native artifact is missing or changed: ' + entry.path, Context.currentPos());
        if (StringTools.startsWith(entry.path, 'native/bin/') || (hl && StringTools.endsWith(entry.path, '.hdll'))) {
          final destination = Path.join([output, Path.withoutDirectory(source)]);
          if (Path.normalize(source) != Path.normalize(destination)) File.copy(source, destination);
        }
      }
    });
  }
}
#end
