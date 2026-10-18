// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_StatechartComparison extends AttemptConfig {
  @:native("flight::types::statechart_comparison")
  public static var StatechartComparison:{ Equal:String, GreaterThan:String, GreaterThanOrEqual:String, LessThan:String, LessThanOrEqual:String, NotEqual:String };
}
#end
