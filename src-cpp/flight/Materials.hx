// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function getPbrMetallicFromPhongSpecular(specular:Float, diffuse:Float):Float {
  return flight._cpp._fn.Materials.getPbrMetallicFromPhongSpecular(specular, diffuse);
}

inline function getPbrRoughnessFromPhongShininess(shininess:Float):Float {
  return flight._cpp._fn.Materials.getPbrRoughnessFromPhongShininess(shininess);
}

inline function getPhongToPbrLightExposure():Float {
  return flight._cpp._fn.Materials.getPhongToPbrLightExposure();
}

inline function isValidMaterialClearcoat(value:Float):Bool {
  return flight._cpp._fn.Materials.isValidMaterialClearcoat(value);
}

inline function isValidMaterialIor(value:Float):Bool {
  return flight._cpp._fn.Materials.isValidMaterialIor(value);
}

inline function isValidMaterialIridescenceThickness(value:Float):Bool {
  return flight._cpp._fn.Materials.isValidMaterialIridescenceThickness(value);
}

inline function isValidMaterialWeight(value:Float):Bool {
  return flight._cpp._fn.Materials.isValidMaterialWeight(value);
}

inline function isValidPbrUvSet(value:Float):Bool {
  return flight._cpp._fn.Materials.isValidPbrUvSet(value);
}
