// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_StatechartTransitionStatus extends AttemptConfig {
  @:native("flight::types::statechart_transition_status")
  public static var StatechartTransitionStatus:{ ConditionsUnmet:String, ExitTimePending:String, InvalidRegion:String, MissingRegionDuration:String, NoTransitions:String, Ready:String, Transitioning:String };
}
#end
