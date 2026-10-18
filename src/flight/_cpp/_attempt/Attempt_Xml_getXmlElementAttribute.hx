// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/xml/contract.hpp")
extern class Attempt_Xml_getXmlElementAttribute extends AttemptConfig {
  @:native("flight::xml::get_xml_element_attribute")
  public static function getXmlElementAttribute(element:flight.XmlElement, name:String):Null<String>;
}
#end
