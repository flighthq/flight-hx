package flight;

inline function createBvhSpatialBackend3d(margin:Float):SpatialIndexBackend3D {
#if hl
	return flight._hl._fn.Spatial.createBvhSpatialBackend3d(margin);
#elseif cpp
	return flight._cpp._fn.Spatial.createBvhSpatialBackend3d(margin);
#elseif (js && flight_esm)
	return flight._js._fn.Spatial.createBvhSpatialBackend3d(margin);
#else
	#error "flight.Spatial: no backend for this target."
#end
}
inline function explainSpatialIndexing2d(index:SpatialIndex2D, id:Int):SpatialIndexingExplanation {
#if hl
	return flight._hl._fn.Spatial.explainSpatialIndexing2d(index, id);
#elseif cpp
	return flight._cpp._fn.Spatial.explainSpatialIndexing2d(index, id);
#elseif (js && flight_esm)
	return flight._js._fn.Spatial.explainSpatialIndexing2d(index, id);
#else
	#error "flight.Spatial: no backend for this target."
#end
}
inline function explainSpatialIndexing3d(index:SpatialIndex3D, id:Int):SpatialIndexingExplanation {
#if hl
	return flight._hl._fn.Spatial.explainSpatialIndexing3d(index, id);
#elseif cpp
	return flight._cpp._fn.Spatial.explainSpatialIndexing3d(index, id);
#elseif (js && flight_esm)
	return flight._js._fn.Spatial.explainSpatialIndexing3d(index, id);
#else
	#error "flight.Spatial: no backend for this target."
#end
}
inline function formatSpatialIndexingNotice(notice:SpatialIndexingNotice):String {
#if hl
	return cast flight._hl._fn.Spatial.formatSpatialIndexingNotice(notice);
#elseif cpp
	return cast flight._cpp._fn.Spatial.formatSpatialIndexingNotice(notice);
#elseif (js && flight_esm)
	return cast flight._js._fn.Spatial.formatSpatialIndexingNotice(notice);
#else
	#error "flight.Spatial: no backend for this target."
#end
}
inline function freeSpatialIndexBackend3D(ptr:SpatialIndexBackend3D):Void {
#if hl
	flight._hl._fn.Spatial.freeSpatialIndexBackend3D(ptr);
#elseif cpp
	flight._cpp._fn.Spatial.freeSpatialIndexBackend3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spatial.freeSpatialIndexBackend3D(ptr);
#else
	#error "flight.Spatial: no backend for this target."
#end
}
inline function freeSpatialIndexingExplanation(ptr:SpatialIndexingExplanation):Void {
#if hl
	flight._hl._fn.Spatial.freeSpatialIndexingExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Spatial.freeSpatialIndexingExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spatial.freeSpatialIndexingExplanation(ptr);
#else
	#error "flight.Spatial: no backend for this target."
#end
}
