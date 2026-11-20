package flight.esm.types.clipboard_contract;

#if (js && flight_esm)
typedef ClipboardBookmark = flight.esm.types.clipboard.Types.ClipboardBookmark;

typedef ClipboardWatch = flight.esm.types.clipboard.Types.ClipboardWatch;

typedef ClipboardWriteItem = flight.esm.types.clipboard.Types.ClipboardWriteItem;

typedef HostClipboardBookmarkCapability = flight.esm.types.clipboard.Types.HostClipboardBookmarkCapability;

typedef HostClipboardCapabilities = flight.esm.types.clipboard.Types.HostClipboardCapabilities;

typedef HostClipboardChangeCapability = flight.esm.types.clipboard.Types.HostClipboardChangeCapability;

typedef HostClipboardFormatsCapability = flight.esm.types.clipboard.Types.HostClipboardFormatsCapability;

typedef HostClipboardImageCapability = flight.esm.types.clipboard.Types.HostClipboardImageCapability;

typedef HostClipboardTextCapability = flight.esm.types.clipboard.Types.HostClipboardTextCapability;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
