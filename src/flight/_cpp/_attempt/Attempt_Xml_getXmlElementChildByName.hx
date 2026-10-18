// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/xml/contract.hpp")
extern class Attempt_Xml_getXmlElementChildByName extends AttemptConfig {
  @:native("flight::xml::get_xml_element_child_by_name")
  public static function getXmlElementChildByName(element:flight.XmlElement, name:String):Null<flight.XmlElement>;
}
#end
