package flight;

#if (js && flight_esm)
extern inline function appendSvgPathData(path:Path, d:String):Bool {
	return flight._js._fn.PathFormats.appendSvgPathData(path, d);
}
#else
extern inline function appendSvgPathData(path:Path, d:String):Bool {
#if hl
	return flight._hl._fn.PathFormats.appendSvgPathData(path, cast d);
#elseif cpp
	return flight._cpp._fn.PathFormats.appendSvgPathData(path, cast d);
#elseif (js && flight_esm)
	return flight._js._fn.PathFormats.appendSvgPathData(path, d);
#else
	#error "flight.PathFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainSvgPathData(d:String):Null<SvgPathDataExplanation> {
	return flight._js._fn.PathFormats.explainSvgPathData(d);
}
#else
extern inline function explainSvgPathData(d:String):SvgPathDataExplanation {
#if hl
	return flight._hl._fn.PathFormats.explainSvgPathData(cast d);
#elseif cpp
	return flight._cpp._fn.PathFormats.explainSvgPathData(cast d);
#elseif (js && flight_esm)
	return flight._js._fn.PathFormats.explainSvgPathData(d);
#else
	#error "flight.PathFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function formatSvgPathData(path:Path, options:Null<SvgPathDataFormatOptions>):String {
	return flight._js._fn.PathFormats.formatSvgPathData(path, options);
}
#else
extern inline function formatSvgPathData(path:Path, options:SvgPathDataFormatOptions):String {
#if hl
	return cast flight._hl._fn.PathFormats.formatSvgPathData(path, options);
#elseif cpp
	return cast flight._cpp._fn.PathFormats.formatSvgPathData(path, options);
#elseif (js && flight_esm)
	return cast flight._js._fn.PathFormats.formatSvgPathData(path, options);
#else
	#error "flight.PathFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseSvgPathData(d:String):Null<Path> {
	return flight._js._fn.PathFormats.parseSvgPathData(d);
}
#else
extern inline function parseSvgPathData(d:String):Path {
#if hl
	return flight._hl._fn.PathFormats.parseSvgPathData(cast d);
#elseif cpp
	return flight._cpp._fn.PathFormats.parseSvgPathData(cast d);
#elseif (js && flight_esm)
	return flight._js._fn.PathFormats.parseSvgPathData(d);
#else
	#error "flight.PathFormats: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSvgPathDataExplanation(ptr:SvgPathDataExplanation):Void {
	flight._js._fn.PathFormats.freeSvgPathDataExplanation(ptr);
}
#else
extern inline function freeSvgPathDataExplanation(ptr:SvgPathDataExplanation):Void {
#if hl
	flight._hl._fn.PathFormats.freeSvgPathDataExplanation(ptr);
#elseif cpp
	flight._cpp._fn.PathFormats.freeSvgPathDataExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.PathFormats.freeSvgPathDataExplanation(ptr);
#else
	#error "flight.PathFormats: no backend for this target."
#end
}
#end
