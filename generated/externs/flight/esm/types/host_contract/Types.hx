package flight.esm.types.host_contract;

#if (js && flight_esm)
typedef AudioBufferHandle = { toString:((?radix:Null<Float>) -> String), toFixed:((?fractionDigits:Null<Float>) -> String), toExponential:((?fractionDigits:Null<Float>) -> String), toPrecision:((?precision:Null<Float>) -> String), valueOf:(() -> Float), toLocaleString:Dynamic, __brand:String };

typedef AudioBusNodeHandle = { toString:((?radix:Null<Float>) -> String), toFixed:((?fractionDigits:Null<Float>) -> String), toExponential:((?fractionDigits:Null<Float>) -> String), toPrecision:((?precision:Null<Float>) -> String), valueOf:(() -> Float), toLocaleString:Dynamic, __brand:String };

typedef AudioDeviceHandle = { toString:((?radix:Null<Float>) -> String), toFixed:((?fractionDigits:Null<Float>) -> String), toExponential:((?fractionDigits:Null<Float>) -> String), toPrecision:((?precision:Null<Float>) -> String), valueOf:(() -> Float), toLocaleString:Dynamic, __brand:String };

typedef AudioMixerGraphHandle = { toString:((?radix:Null<Float>) -> String), toFixed:((?fractionDigits:Null<Float>) -> String), toExponential:((?fractionDigits:Null<Float>) -> String), toPrecision:((?precision:Null<Float>) -> String), valueOf:(() -> Float), toLocaleString:Dynamic, __brand:String };

typedef AudioSourceHandle = { toString:((?radix:Null<Float>) -> String), toFixed:((?fractionDigits:Null<Float>) -> String), toExponential:((?fractionDigits:Null<Float>) -> String), toPrecision:((?precision:Null<Float>) -> String), valueOf:(() -> Float), toLocaleString:Dynamic, __brand:String };

typedef BackendExplanation = flight.esm.types.host.Types.BackendExplanation;

typedef BackendExplanationLayer = flight.esm.types.host.Types.BackendExplanationLayer;

typedef BackendExplanationViability = flight.esm.types.host.Types.BackendExplanationViability;

typedef BackendOperationExplanation = flight.esm.types.host.Types.BackendOperationExplanation;

typedef BackendOperationExplanationLayer = flight.esm.types.host.Types.BackendOperationExplanationLayer;

typedef HostAccessibilityCapabilities = { ?tree:Null<flight.esm.types.accessibility_contract.Types.HostAccessibilityCapability> };

typedef HostBitmapCapabilities = { ?encode:Null<flight.esm.types.bitmap.Types.HostBitmapEncodeCapability>, ?readback:Null<flight.esm.types.bitmap.Types.HostBitmapReadbackCapability> };

typedef HostCapabilityBackend = flight.esm.types.host.Types.HostCapabilityBackend;

typedef HostCapabilityCoverage = flight.esm.types.host.Types.HostCapabilityCoverage;

typedef HostCapabilityExplanation = flight.esm.types.host.Types.HostCapabilityExplanation;

typedef HostCapabilityGroupExplanation = flight.esm.types.host.Types.HostCapabilityGroupExplanation;

typedef HostCompressCapabilities = { ?deflate:Null<flight.esm.types.compression.Types.HostCompressDeflateCapability>, ?lzma:Null<flight.esm.types.compression.Types.HostCompressLzmaCapability> };

typedef HostConnectivityCapabilities = { ?change:Null<flight.esm.types.connectivity_contract.Types.HostConnectivityChangeCapability>, ?reachability:Null<flight.esm.types.connectivity_contract.Types.HostConnectivityReachabilityCapability>, ?status:Null<flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability> };

typedef HostDecompressCapabilities = { ?brotli:Null<flight.esm.types.compression.Types.HostDecompressBrotliCapability>, ?deflate:Null<flight.esm.types.compression.Types.HostDecompressDeflateCapability>, ?lzma:Null<flight.esm.types.compression.Types.HostDecompressLzmaCapability> };

typedef HostDialogCapabilities = { ?directoryOpen:Null<flight.esm.types.dialog_contract.Types.HostDirectoryOpenDialogCapability>, ?fileOpen:Null<flight.esm.types.dialog_contract.Types.HostFileOpenDialogCapability>, ?fileSave:Null<flight.esm.types.dialog_contract.Types.HostFileSaveDialogCapability>, ?imageOpen:Null<flight.esm.types.dialog_contract.Types.HostImageOpenDialogCapability>, ?message:Null<flight.esm.types.dialog_contract.Types.HostMessageDialogCapability>, ?photoCapture:Null<flight.esm.types.dialog_contract.Types.HostPhotoCaptureDialogCapability>, ?prompt:Null<flight.esm.types.dialog_contract.Types.HostPromptDialogCapability>, ?videoCapture:Null<flight.esm.types.dialog_contract.Types.HostVideoCaptureDialogCapability> };

typedef HostExplanation = flight.esm.types.host.Types.HostExplanation;

typedef HostFileSystemCapabilities = { ?access:Null<flight.esm.types.filesystem_contract.Types.HostFileSystemCapability> };

typedef HostFontCapabilities = { ?loader:Null<flight.esm.types.font.Types.HostFontLoadingCapability> };

typedef HostGeolocationCapabilities = { ?position:Null<flight.esm.types.geolocation_contract.Types.HostGeolocationCapability> };

typedef HostGlyphCapabilities = { ?rasterizer:Null<flight.esm.types.font.Types.HostGlyphRasterizerCapability> };

typedef HostImageCapabilities = { ?loader:Null<flight.esm.types.image_contract.Types.HostImageCapability> };

typedef HostImageSource = Dynamic;

typedef HostMidiCapabilities = { ?access:Null<flight.esm.types.midi_contract.Types.HostMidiAccessCapability>, ?permission:Null<flight.esm.types.midi_contract.Types.HostMidiPermissionCapability> };

typedef HostNotificationCapabilities = { ?action:Null<flight.esm.types.notification_contract.Types.HostNotificationActionCapability>, ?activeList:Null<flight.esm.types.notification_contract.Types.HostNotificationActiveListCapability>, ?click:Null<flight.esm.types.notification_contract.Types.HostNotificationClickCapability>, ?close:Null<flight.esm.types.notification_contract.Types.HostNotificationCloseCapability>, ?delivery:Null<flight.esm.types.notification_contract.Types.HostNotificationDeliveryCapability>, ?dismiss:Null<flight.esm.types.notification_contract.Types.HostNotificationDismissCapability>, ?lifecycle:Null<flight.esm.types.notification_contract.Types.HostNotificationLifecycleCapability>, ?permission:Null<flight.esm.types.notification_contract.Types.HostNotificationPermissionCapability>, ?received:Null<flight.esm.types.notification_contract.Types.HostNotificationReceivedCapability>, ?reply:Null<flight.esm.types.notification_contract.Types.HostNotificationReplyCapability>, ?scheduling:Null<flight.esm.types.notification_contract.Types.HostNotificationSchedulingCapability> };

typedef HostPermissionsCapabilities = { ?query:Null<flight.esm.types.permissions_contract.Types.HostPermissionsCapability> };

typedef HostProtocolCapabilities = { ?launch:Null<flight.esm.types.protocol_contract.Types.HostProtocolLaunchCapability>, ?open:Null<flight.esm.types.protocol_contract.Types.HostProtocolOpenCapability>, ?registration:Null<flight.esm.types.protocol_contract.Types.HostProtocolRegistrationCapability>, ?registrationQuery:Null<flight.esm.types.protocol_contract.Types.HostProtocolRegistrationQueryCapability>, ?unregistration:Null<flight.esm.types.protocol_contract.Types.HostProtocolUnregistrationCapability> };

typedef HostShareCapabilities = { ?content:Null<flight.esm.types.share_contract.Types.HostShareContentCapability>, ?files:Null<flight.esm.types.share_contract.Types.HostShareFilesCapability> };

typedef HostSoftKeyboardCapabilities = { ?accessoryBar:Null<flight.esm.types.keyboard_contract.Types.HostSoftKeyboardAccessoryBarCapability>, ?change:Null<flight.esm.types.keyboard_contract.Types.HostSoftKeyboardChangeCapability>, ?info:Null<flight.esm.types.keyboard_contract.Types.HostSoftKeyboardInfoCapability>, ?resizeModeWrite:Null<flight.esm.types.keyboard_contract.Types.HostSoftKeyboardResizeModeWriteCapability>, ?scrollAssist:Null<flight.esm.types.keyboard_contract.Types.HostSoftKeyboardScrollAssistCapability>, ?style:Null<flight.esm.types.keyboard_contract.Types.HostSoftKeyboardStyleCapability>, ?visibility:Null<flight.esm.types.keyboard_contract.Types.HostSoftKeyboardVisibilityCapability> };

typedef HostTextSegmentCapabilities = { ?segmenter:Null<flight.esm.types.textsegment.Types.HostTextSegmenterCapability> };

typedef HostUpdaterCapabilities = { ?command:Null<flight.esm.types.updater_contract.Types.HostUpdaterCommandCapability> };

typedef InputIngressSource = flight.esm.types.host.Types.InputIngressSource;

typedef ProviderRef = flight.esm.types.host.Types.ProviderRef;

typedef WebScreenCapabilities = { change:flight.esm.types.screen.Types.HostScreenChangeCapability, details:flight.esm.types.screen.Types.HostScreenDetailsCapability, permissionChange:flight.esm.types.screen.Types.HostScreenPermissionChangeCapability, query:flight.esm.types.screen.Types.HostScreenQueryCapability };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
