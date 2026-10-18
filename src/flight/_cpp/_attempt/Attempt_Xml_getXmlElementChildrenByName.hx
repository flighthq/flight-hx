// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/xml/contract.hpp")
extern class Attempt_Xml_getXmlElementChildrenByName extends AttemptConfig {
  @:native("flight::xml::get_xml_element_children_by_name")
  public static function getXmlElementChildrenByName(element:flight.XmlElement, name:String):Array<flight.XmlElement>;
}
#end
