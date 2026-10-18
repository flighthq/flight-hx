// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function attachClipboardWatch(hostClipboardChange:{ ?subscribe:(()->Void)->(()->Void) }, watch:flight.ClipboardWatch):Void {
  flight._cpp._attempt.Attempt_Clipboard_attachClipboardWatch.attachClipboardWatch(hostClipboardChange, watch);
}

extern inline function clearClipboard(hostClipboardText:flight.HostClipboardTextCapability):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_clearClipboard.clearClipboard(hostClipboardText);
}

extern inline function createClipboardWatch():flight.ClipboardWatch {
  return flight._cpp._attempt.Attempt_Clipboard_createClipboardWatch.createClipboardWatch();
}

extern inline function detachClipboardWatch(watch:flight.ClipboardWatch):Void {
  flight._cpp._attempt.Attempt_Clipboard_detachClipboardWatch.detachClipboardWatch(watch);
}

extern inline function disposeClipboardWatch(watch:flight.ClipboardWatch):Void {
  flight._cpp._attempt.Attempt_Clipboard_disposeClipboardWatch.disposeClipboardWatch(watch);
}

extern inline function getClipboardFormats(hostClipboardFormats:flight.HostClipboardFormatsCapability):flight._internal._Promise<Array<String>> {
  return flight._cpp._attempt.Attempt_Clipboard_getClipboardFormats.getClipboardFormats(hostClipboardFormats);
}

extern inline function hasClipboardBookmark(hostClipboardBookmark:flight.HostClipboardBookmarkCapability):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_hasClipboardBookmark.hasClipboardBookmark(hostClipboardBookmark);
}

extern inline function hasClipboardFormat(hostClipboardFormats:flight.HostClipboardFormatsCapability, format:String):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_hasClipboardFormat.hasClipboardFormat(hostClipboardFormats, format);
}

extern inline function hasClipboardHtml(hostClipboardFormats:flight.HostClipboardFormatsCapability):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_hasClipboardHtml.hasClipboardHtml(hostClipboardFormats);
}

extern inline function hasClipboardImage(hostClipboardImage:flight.HostClipboardImageCapability):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_hasClipboardImage.hasClipboardImage(hostClipboardImage);
}

extern inline function hasClipboardRTF(hostClipboardFormats:flight.HostClipboardFormatsCapability):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_hasClipboardRTF.hasClipboardRTF(hostClipboardFormats);
}

extern inline function hasClipboardText(hostClipboardText:flight.HostClipboardTextCapability):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_hasClipboardText.hasClipboardText(hostClipboardText);
}

extern inline function initializeClipboardWatch(out:flight.EntityConstruction<flight.ClipboardWatch>):Void {
  flight._cpp._attempt.Attempt_Clipboard_initializeClipboardWatch.initializeClipboardWatch(out);
}

extern inline function readClipboard(hostClipboardFormats:flight.HostClipboardFormatsCapability, formats:Array<String>):flight._internal._Promise<haxe.DynamicAccess<String>> {
  return flight._cpp._attempt.Attempt_Clipboard_readClipboard.readClipboard(hostClipboardFormats, formats);
}

extern inline function readClipboardBookmark(hostClipboardBookmark:flight.HostClipboardBookmarkCapability):flight._internal._Promise<Null<flight.ClipboardBookmark>> {
  return flight._cpp._attempt.Attempt_Clipboard_readClipboardBookmark.readClipboardBookmark(hostClipboardBookmark);
}

extern inline function readClipboardFormat(hostClipboardFormats:flight.HostClipboardFormatsCapability, format:String):flight._internal._Promise<String> {
  return flight._cpp._attempt.Attempt_Clipboard_readClipboardFormat.readClipboardFormat(hostClipboardFormats, format);
}

extern inline function readClipboardHtml(hostClipboardFormats:flight.HostClipboardFormatsCapability):flight._internal._Promise<String> {
  return flight._cpp._attempt.Attempt_Clipboard_readClipboardHtml.readClipboardHtml(hostClipboardFormats);
}

extern inline function readClipboardImage(hostClipboardImage:flight.HostClipboardImageCapability):flight._internal._Promise<String> {
  return flight._cpp._attempt.Attempt_Clipboard_readClipboardImage.readClipboardImage(hostClipboardImage);
}

extern inline function readClipboardRTF(hostClipboardFormats:flight.HostClipboardFormatsCapability):flight._internal._Promise<String> {
  return flight._cpp._attempt.Attempt_Clipboard_readClipboardRTF.readClipboardRTF(hostClipboardFormats);
}

extern inline function readClipboardText(hostClipboardText:flight.HostClipboardTextCapability):flight._internal._Promise<String> {
  return flight._cpp._attempt.Attempt_Clipboard_readClipboardText.readClipboardText(hostClipboardText);
}

extern inline function writeClipboard(hostClipboardFormats:flight.HostClipboardFormatsCapability, items:Array<flight.ClipboardWriteItem>):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_writeClipboard.writeClipboard(hostClipboardFormats, items);
}

extern inline function writeClipboardBookmark(hostClipboardBookmark:flight.HostClipboardBookmarkCapability, title:String, url:String):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_writeClipboardBookmark.writeClipboardBookmark(hostClipboardBookmark, title, url);
}

extern inline function writeClipboardFormat(hostClipboardFormats:flight.HostClipboardFormatsCapability, format:String, data:String):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_writeClipboardFormat.writeClipboardFormat(hostClipboardFormats, format, data);
}

extern inline function writeClipboardHtml(hostClipboardFormats:flight.HostClipboardFormatsCapability, html:String):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_writeClipboardHtml.writeClipboardHtml(hostClipboardFormats, html);
}

extern inline function writeClipboardImage(hostClipboardImage:flight.HostClipboardImageCapability, dataUrl:String):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_writeClipboardImage.writeClipboardImage(hostClipboardImage, dataUrl);
}

extern inline function writeClipboardRTF(hostClipboardFormats:flight.HostClipboardFormatsCapability, rtf:String):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_writeClipboardRTF.writeClipboardRTF(hostClipboardFormats, rtf);
}

extern inline function writeClipboardText(hostClipboardText:flight.HostClipboardTextCapability, text:String):flight._internal._Promise<Bool> {
  return flight._cpp._attempt.Attempt_Clipboard_writeClipboardText.writeClipboardText(hostClipboardText, text);
}
