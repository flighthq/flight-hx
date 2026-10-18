// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/adjustments/contract.hpp")
extern class Attempt_Adjustments_initializeColorMatrixAdjustment extends AttemptConfig {
  @:native("flight::adjustments::initialize_color_matrix_adjustment")
  public static function initializeColorMatrixAdjustment<T:flight.ColorMatrixAdjustment>(out:flight.EntityConstruction<T>, kind:flight.AdjustmentKind, colorMatrix:Array<Float>):Void;
}
#end
