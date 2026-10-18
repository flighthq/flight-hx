// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/xml/contract.hpp")
extern class Attempt_Xml_parseXmlDocument extends AttemptConfig {
  @:native("flight::xml::parse_xml_document")
  public static function parseXmlDocument(xml:String):Null<flight.XmlElement>;
}
#end
