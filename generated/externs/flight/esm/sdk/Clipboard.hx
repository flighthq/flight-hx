package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/clipboard")
extern class Clipboard {
  public static final ClipboardFormatBookmark:String;
  public static final ClipboardFormatHtml:String;
  public static final ClipboardFormatImage:String;
  public static final ClipboardFormatRtf:String;
  public static final ClipboardFormatText:String;
  public static final ClipboardFormatUriList:String;
  public static function attachClipboardWatch(hostClipboardChange:Dynamic, watch:flight.esm.types.clipboard.Types.ClipboardWatch):Void;
  public static function clearClipboard(hostClipboardText:flight.esm.types.clipboard.Types.HostClipboardTextCapability):js.lib.Promise<Bool>;
  public static function createClipboardWatch():flight.esm.types.clipboard.Types.ClipboardWatch;
  public static function detachClipboardWatch(watch:flight.esm.types.clipboard.Types.ClipboardWatch):Void;
  public static function disposeClipboardWatch(watch:flight.esm.types.clipboard.Types.ClipboardWatch):Void;
  public static function getClipboardFormats(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability):js.lib.Promise<Array<String>>;
  public static function hasClipboardBookmark(hostClipboardBookmark:flight.esm.types.clipboard.Types.HostClipboardBookmarkCapability):js.lib.Promise<Bool>;
  public static function hasClipboardFormat(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability, format:String):js.lib.Promise<Bool>;
  public static function hasClipboardHtml(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability):js.lib.Promise<Bool>;
  public static function hasClipboardImage(hostClipboardImage:flight.esm.types.clipboard.Types.HostClipboardImageCapability):js.lib.Promise<Bool>;
  public static function hasClipboardRTF(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability):js.lib.Promise<Bool>;
  public static function hasClipboardText(hostClipboardText:flight.esm.types.clipboard.Types.HostClipboardTextCapability):js.lib.Promise<Bool>;
  public static function readClipboard(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability, formats:Array<String>):js.lib.Promise<Dynamic>;
  public static function readClipboardBookmark(hostClipboardBookmark:flight.esm.types.clipboard.Types.HostClipboardBookmarkCapability):js.lib.Promise<Null<flight.esm.types.clipboard.Types.ClipboardBookmark>>;
  public static function readClipboardFormat(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability, format:String):js.lib.Promise<String>;
  public static function readClipboardHtml(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability):js.lib.Promise<String>;
  public static function readClipboardImage(hostClipboardImage:flight.esm.types.clipboard.Types.HostClipboardImageCapability):js.lib.Promise<String>;
  public static function readClipboardRTF(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability):js.lib.Promise<String>;
  public static function readClipboardText(hostClipboardText:flight.esm.types.clipboard.Types.HostClipboardTextCapability):js.lib.Promise<String>;
  public static function writeClipboard(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability, items:Array<flight.esm.types.clipboard.Types.ClipboardWriteItem>):js.lib.Promise<Bool>;
  public static function writeClipboardBookmark(hostClipboardBookmark:flight.esm.types.clipboard.Types.HostClipboardBookmarkCapability, title:String, url:String):js.lib.Promise<Bool>;
  public static function writeClipboardFormat(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability, format:String, data:String):js.lib.Promise<Bool>;
  public static function writeClipboardHtml(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability, html:String):js.lib.Promise<Bool>;
  public static function writeClipboardImage(hostClipboardImage:flight.esm.types.clipboard.Types.HostClipboardImageCapability, dataUrl:String):js.lib.Promise<Bool>;
  public static function writeClipboardRTF(hostClipboardFormats:flight.esm.types.clipboard.Types.HostClipboardFormatsCapability, rtf:String):js.lib.Promise<Bool>;
  public static function writeClipboardText(hostClipboardText:flight.esm.types.clipboard.Types.HostClipboardTextCapability, text:String):js.lib.Promise<Bool>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
