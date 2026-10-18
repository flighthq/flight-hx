// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/binpack/contract.hpp")
extern class Attempt_Binpack_getPackResultOccupancy extends AttemptConfig {
  @:native("flight::binpack::get_pack_result_occupancy")
  public static function getPackResultOccupancy(result:flight.PackResult):Float;
}
#end
