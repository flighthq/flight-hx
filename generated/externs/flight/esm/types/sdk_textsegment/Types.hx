package flight.esm.types.sdk_textsegment;

#if (js && flight_esm)
typedef HostTextSegmentCapabilities = flight.esm.types.textsegment.Types.HostTextSegmentCapabilities;

typedef HostTextSegmenterCapability = flight.esm.types.textsegment.Types.HostTextSegmenterCapability;

typedef TextSegment = flight.esm.types.textsegment.Types.TextSegment;

typedef TextSegmentGranularity = flight.esm.types.textsegment.Types.TextSegmentGranularity;

typedef TextSegmentRange = flight.esm.types.textsegment.Types.TextSegmentRange;

typedef TextSegmenterExplanation = flight.esm.types.textsegment.Types.TextSegmenterExplanation;

typedef TextSegmenterKind = flight.esm.types.textsegment.Types.TextSegmenterKind;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
