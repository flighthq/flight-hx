package flight.esm.types.clip;

#if (js && flight_esm)
typedef ClipRegion = { rect:flight.esm.types.geometry.Types.Rectangle, contours:Null<Array<Array<Float>>>, winding:flight.esm.types.path.Types.PathWinding, version:Float };

typedef ClipRegionContoursExplanation = { contourIndex:Float, coordinateCount:Float, reason:flight.esm.types.clip.Types.ClipRegionContoursReason };

typedef ClipRegionContoursGuard = ((explanation:flight.esm.types.clip.Types.ClipRegionContoursExplanation, contours:Array<Array<Float>>) -> Void);

typedef ClipRegionContoursReason = String;

typedef ClipRegionExplanation = { conservative:Bool, status:flight.esm.types.clip.Types.ClipRegionStatus };

typedef ClipRegionReleaseGuard = ((clip:flight.esm.types.clip.Types.ClipRegion) -> Void);

typedef ClipRegionStatus = String;

typedef ClipRegionUseGuard = ((clip:flight.esm.types.clip.Types.ClipRegion) -> Void);

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
