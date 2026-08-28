package flight.hostLime;

#if lime
import flight.types.PlatformBackend;
import lime.system.Locale;
import lime.system.System;

/** Exposes the native platform metadata Lime can report reliably. */
class LimePlatform {
  public static function createLimePlatformBackend():PlatformBackend {
    return cast {getInfo: function(defaults:Dynamic):Dynamic {
      defaults.name = platformName();
      defaults.kind = platformKind();
      defaults.version = nullToEmpty(System.platformVersion);
      defaults.arch = architecture();
      defaults.locale = localeString(Locale.systemLocale);
      defaults.isTouch = isTouchPlatform();
      defaults.runtime = #if (js && html5) 'web' #else 'native' #end;
      defaults.engine = 'unknown';
      defaults.engineVersion = '';
      defaults.endianness = switch (System.endianness) {
        case LITTLE_ENDIAN: 'little';
        case BIG_ENDIAN: 'big';
      };
      defaults.pointerWidth = pointerWidth();
      defaults.osBuild = '';
      defaults.distro = #if linux nullToEmpty(System.platformName) #else '' #end;
      defaults.distroVersion = #if linux nullToEmpty(System.platformVersion) #else '' #end;
      return defaults;
    }};
  }

  static function platformName():String {
    return #if windows 'windows'
    #elseif mac 'macos'
    #elseif linux 'linux'
    #elseif ios 'ios'
    #elseif android 'android'
    #elseif (js && html5) 'web'
    #else 'unknown'
    #end;
  }

  static function platformKind():String {
    return #if (ios || android) 'mobile'
    #elseif (windows || mac || linux) 'desktop'
    #elseif (js && html5) 'web'
    #else 'unknown'
    #end;
  }

  static function isTouchPlatform():Bool {
    return #if (ios || android) true #else false #end;
  }

  static function architecture():String {
    return #if arm64 'arm64'
    #elseif armv7 'arm'
    #elseif (HXCPP_M64 || hl_64) 'x64'
    #elseif (cpp || hl) 'x86'
    #else ''
    #end;
  }

  static function pointerWidth():Float {
    return #if (arm64 || HXCPP_M64 || hl_64) 64.0
    #elseif (armv7 || cpp || hl) 32.0
    #else -1.0
    #end;
  }

  static function localeString(locale:Null<Locale>):String {
    return locale == null ? '' : (locale : String);
  }

  static function nullToEmpty(value:Null<String>):String return value == null ? '' : value;
}
#end
