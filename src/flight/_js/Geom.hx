package flight._js;

// JS backend: extern over Flight's ESM exports. DRAFT — the exact import shape
// (static NAMED imports, for tree-shaking) is finalized by the vendored ESM
// generator in tools/esm/, not by this `@:jsRequire` placeholder. Guarded `#if js`.
#if js
@:jsRequire("@flighthq/geom", "Geom")
extern class Geom {
  static function addVector2(a:flight._js.Vector2, b:flight._js.Vector2):flight._js.Vector2;
  static function lengthVector2(a:flight._js.Vector2):Float;
}
#end
