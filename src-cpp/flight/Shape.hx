// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Shape = flight._cpp.Shape;

inline function clearShapeBoundsCommands():Void {
  flight._cpp._fn.Shape.clearShapeBoundsCommands();
}

inline function getPathCommandOperandCount(verb:Float):Float {
  return flight._cpp._fn.Shape.getPathCommandOperandCount(verb);
}

inline function getShapeBoundsCommandRegistryRevision():Float {
  return flight._cpp._fn.Shape.getShapeBoundsCommandRegistryRevision();
}
