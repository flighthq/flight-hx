// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function getXmlElementAttribute(element:flight.XmlElement, name:String):Null<String> {
  return flight._cpp._attempt.Attempt_Xml_getXmlElementAttribute.getXmlElementAttribute(element, name);
}

extern inline function getXmlElementAttributeNumber(element:flight.XmlElement, name:String):Null<Float> {
  return flight._cpp._attempt.Attempt_Xml_getXmlElementAttributeNumber.getXmlElementAttributeNumber(element, name);
}

extern inline function getXmlElementChildByName(element:flight.XmlElement, name:String):Null<flight.XmlElement> {
  return flight._cpp._attempt.Attempt_Xml_getXmlElementChildByName.getXmlElementChildByName(element, name);
}

extern inline function getXmlElementChildrenByName(element:flight.XmlElement, name:String):Array<flight.XmlElement> {
  return flight._cpp._attempt.Attempt_Xml_getXmlElementChildrenByName.getXmlElementChildrenByName(element, name);
}

extern inline function parseXmlAttributes(attrs:String):haxe.DynamicAccess<String> {
  return flight._cpp._attempt.Attempt_Xml_parseXmlAttributes.parseXmlAttributes(attrs);
}

extern inline function parseXmlDocument(xml:String):Null<flight.XmlElement> {
  return flight._cpp._attempt.Attempt_Xml_parseXmlDocument.parseXmlDocument(xml);
}
