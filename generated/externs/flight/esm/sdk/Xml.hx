package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/xml")
extern class Xml {
  public static function getXmlElementAttribute(element:flight.esm.types.xml.Types.XmlElement, name:String):Null<String>;
  public static function getXmlElementAttributeNumber(element:flight.esm.types.xml.Types.XmlElement, name:String):Null<Float>;
  public static function getXmlElementChildByName(element:flight.esm.types.xml.Types.XmlElement, name:String):Null<flight.esm.types.xml.Types.XmlElement>;
  public static function getXmlElementChildrenByName(element:flight.esm.types.xml.Types.XmlElement, name:String):Array<flight.esm.types.xml.Types.XmlElement>;
  public static function parseXmlAttributes(attributes:String):Dynamic;
  public static function parseXmlDocument(xml:String):Null<flight.esm.types.xml.Types.XmlElement>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
