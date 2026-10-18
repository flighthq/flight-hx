// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/abc/contract.hpp")
extern class Attempt_Abc_readAbcFile extends AttemptConfig {
  @:native("flight::abc::read_abc_file")
  public static function readAbcFile(source:flight._internal._UInt8Array):Null<flight.AbcFile>;
}
#end
