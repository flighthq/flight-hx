// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function appendSvgPathData(path:flight.Path, d:String):Bool {
  return flight._cpp._attempt.Attempt_PathFormats_appendSvgPathData.appendSvgPathData(path, d);
}

extern inline function explainSvgPathData(d:String):Null<{ position:Float, reason:String }> {
  return flight._cpp._attempt.Attempt_PathFormats_explainSvgPathData.explainSvgPathData(d);
}

extern inline function formatSvgPathData(path:flight.Path, ?options:flight.SvgPathDataFormatOptions):String {
  return flight._cpp._attempt.Attempt_PathFormats_formatSvgPathData.formatSvgPathData(path, options);
}

extern inline function parseSvgPathData(d:String):Null<flight.Path> {
  return flight._cpp._attempt.Attempt_PathFormats_parseSvgPathData.parseSvgPathData(d);
}
