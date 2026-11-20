package flight.esm.types.clipboard;

#if (js && flight_esm)
typedef ClipboardBookmark = { title:String, url:String };

typedef ClipboardWatch = { onChange:flight.esm.types.signals.Types.Signal<Void> };

typedef ClipboardWriteItem = { format:String, data:String };

typedef HostClipboardBookmarkCapability = { readBookmark:(() -> js.lib.Promise<Null<flight.esm.types.clipboard.Types.ClipboardBookmark>>), writeBookmark:((title:String, url:String) -> js.lib.Promise<Bool>) };

typedef HostClipboardCapabilities = { ?bookmark:Null<flight.esm.types.clipboard.Types.HostClipboardBookmarkCapability>, ?change:Null<flight.esm.types.clipboard.Types.HostClipboardChangeCapability>, ?formats:Null<flight.esm.types.clipboard.Types.HostClipboardFormatsCapability>, ?image:Null<flight.esm.types.clipboard.Types.HostClipboardImageCapability>, ?text:Null<flight.esm.types.clipboard.Types.HostClipboardTextCapability> };

typedef HostClipboardChangeCapability = { ?subscribe:Null<((callback_:Dynamic) -> Dynamic)> };

typedef HostClipboardFormatsCapability = { getFormats:(() -> js.lib.Promise<Array<String>>), hasFormat:((format:String) -> js.lib.Promise<Bool>), readFormat:((format:String) -> js.lib.Promise<String>), readHtml:(() -> js.lib.Promise<String>), readItems:((formats:Array<String>) -> js.lib.Promise<Dynamic>), readRTF:(() -> js.lib.Promise<String>), writeFormat:((format:String, data:String) -> js.lib.Promise<Bool>), writeHtml:((html:String) -> js.lib.Promise<Bool>), writeItems:((items:Array<flight.esm.types.clipboard.Types.ClipboardWriteItem>) -> js.lib.Promise<Bool>), writeRTF:((rtf:String) -> js.lib.Promise<Bool>) };

typedef HostClipboardImageCapability = { hasImage:(() -> js.lib.Promise<Bool>), readImage:(() -> js.lib.Promise<String>), writeImage:((dataUrl:String) -> js.lib.Promise<Bool>) };

typedef HostClipboardTextCapability = { clear:(() -> js.lib.Promise<Bool>), hasText:(() -> js.lib.Promise<Bool>), readText:(() -> js.lib.Promise<String>), writeText:((text:String) -> js.lib.Promise<Bool>) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
