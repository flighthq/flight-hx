package flight._js._fn;

@:jsRequire("flight")
extern class Xml {
	@:native("flight_parse_xml_document")
	public static function parseXmlDocument(xml:String):Dynamic;
	@:native("flight_get_xml_element_attribute_number")
	public static function getXmlElementAttributeNumber(element:flight._js.XmlElement, name:String):Float;
	@:native("flight_get_xml_element_child_by_name")
	public static function getXmlElementChildByName(element:flight._js.XmlElement, name:String):Dynamic;
	@:native("flight_free_xml_element")
	public static function freeXmlElement(ptr:flight._js.XmlElement):Void;
}
