package flight;

#if (js && flight_esm)
extern inline function explainAssetLoad(library:Dynamic, id:String):AssetLoadExplanation {
	return flight._js._fn.Assets.explainAssetLoad(library, id);
}
#else
extern inline function explainAssetLoad(library:Dynamic, id:String):AssetLoadExplanation {
#if hl
	return flight._hl._fn.Assets.explainAssetLoad(library, cast id);
#elseif cpp
	return flight._cpp._fn.Assets.explainAssetLoad(library, cast id);
#elseif (js && flight_esm)
	return flight._js._fn.Assets.explainAssetLoad(library, id);
#else
	#error "flight.Assets: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAssetLoadExplanation(ptr:AssetLoadExplanation):Void {
	flight._js._fn.Assets.freeAssetLoadExplanation(ptr);
}
#else
extern inline function freeAssetLoadExplanation(ptr:AssetLoadExplanation):Void {
#if hl
	flight._hl._fn.Assets.freeAssetLoadExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Assets.freeAssetLoadExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Assets.freeAssetLoadExplanation(ptr);
#else
	#error "flight.Assets: no backend for this target."
#end
}
#end
