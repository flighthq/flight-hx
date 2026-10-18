// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_CompositeOperator extends AttemptConfig {
  @:native("flight::types::composite_operator")
  public static var CompositeOperator:{ Clear:String, Copy:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Xor:String };
}
#end
