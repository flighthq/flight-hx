// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/xml/contract.hpp")
extern class Attempt_Xml_getXmlElementAttributeNumber extends AttemptConfig {
  @:native("flight::xml::get_xml_element_attribute_number")
  public static function getXmlElementAttributeNumber(element:flight.XmlElement, name:String):Null<Float>;
}
#end
