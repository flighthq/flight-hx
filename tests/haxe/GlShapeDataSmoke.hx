import flight.Scene2DGl;

// Regression smoke for the GL-2D blank-render bug.
//
// A GL renderer's `createData` builds a materialized entity from an inline `createEntity({...})` and
// returns it as `RendererData`. On the class (hxcpp) representation the result is *cast* to
// `RendererData`; hxcpp returns null when casting between UNRELATED classes, so before the fix the
// materialized shape data silently became null -> renderProxy.rendererData null -> nothing submitted
// -> the 2D scene rendered blank. The fix makes each materialized entity class `extends` the base
// entity type it is used as, turning that cast into a real upcast. This smoke asserts, on a native
// target, that the public GL shape renderer's createData returns a non-null value.
class GlShapeDataSmoke {
  public static function main():Void {
    final renderer = Scene2DGl.defaultGlShapeRenderer;
    final createData = renderer.createData;
    final data = createData(cast null, cast null);
    if (data == null) {
      Sys.println("FAIL: defaultGlShapeRenderer.createData returned null (materialized entity cast erased)");
      Sys.exit(1);
    }
    Sys.println("OK: defaultGlShapeRenderer.createData returned non-null RendererData");
  }
}
