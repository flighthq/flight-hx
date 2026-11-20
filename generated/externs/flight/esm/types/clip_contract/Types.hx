package flight.esm.types.clip_contract;

#if (js && flight_esm)
typedef ClipRegion = flight.esm.types.clip.Types.ClipRegion;

typedef ClipRegionContoursExplanation = flight.esm.types.clip.Types.ClipRegionContoursExplanation;

typedef ClipRegionContoursGuard = flight.esm.types.clip.Types.ClipRegionContoursGuard;

typedef ClipRegionContoursReason = flight.esm.types.clip.Types.ClipRegionContoursReason;

typedef ClipRegionExplanation = flight.esm.types.clip.Types.ClipRegionExplanation;

typedef ClipRegionReleaseGuard = flight.esm.types.clip.Types.ClipRegionReleaseGuard;

typedef ClipRegionStatus = flight.esm.types.clip.Types.ClipRegionStatus;

typedef ClipRegionUseGuard = flight.esm.types.clip.Types.ClipRegionUseGuard;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
