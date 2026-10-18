// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/abc/contract.hpp")
extern class Attempt_Abc_readAbcInstructions extends AttemptConfig {
  @:native("flight::abc::read_abc_instructions")
  public static function readAbcInstructions(code:flight._internal._UInt8Array):Null<Array<flight.AbcInstruction>>;
}
#end
