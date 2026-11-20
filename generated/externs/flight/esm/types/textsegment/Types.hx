package flight.esm.types.textsegment;

#if (js && flight_esm)
typedef HostTextSegmentCapabilities = { ?segmenter:Null<flight.esm.types.textsegment.Types.HostTextSegmenterCapability> };

typedef HostTextSegmenterCapability = { segment:((text:String, granularity:flight.esm.types.textsegment.Types.TextSegmentGranularity, ?locale:Null<String>) -> Array<flight.esm.types.textsegment.Types.TextSegment>) };

typedef TextSegment = { start:Float, end:Float, text:String, ?isWordLike:Null<Bool> };

typedef TextSegmentGranularity = String;

typedef TextSegmentRange = { start:Float, end:Float };

typedef TextSegmenterExplanation = { available:Bool, backend:flight.esm.types.textsegment.Types.TextSegmenterKind, intlSegmenterAvailable:Bool };

typedef TextSegmenterKind = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
