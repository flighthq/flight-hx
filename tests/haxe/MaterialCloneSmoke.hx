import flight.Materials;
import flight.types.StandardPbrMaterial;

// Regression smoke for the Horse Stacker cloneHierarchy -> toPreviewMaterial null crash.
// Staged so a native segfault localizes to create vs clone vs read.
class MaterialCloneSmoke {
  public static function main():Void {
    Sys.println("step: create");
    final source = Materials.createStandardPbrMaterial({baseColor: 0.75});
    Sys.println("step: read source.baseColor");
    final srcColor:Float = (cast source : StandardPbrMaterial).baseColor;
    Sys.println("source.baseColor = " + srcColor);
    Sys.println("step: clone");
    final clone = Materials.cloneMaterial(source);
    Sys.println("step: read clone.baseColor");
    final baseColor:Float = (cast clone : StandardPbrMaterial).baseColor;
    if (baseColor != 0.75) {
      Sys.println("FAIL: cloned StandardPbrMaterial.baseColor = " + baseColor + " (expected 0.75)");
      Sys.exit(1);
    }
    Sys.println("OK: cloned StandardPbrMaterial.baseColor = " + baseColor);
  }
}
