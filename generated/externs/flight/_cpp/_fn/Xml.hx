package flight._cpp._fn;

extern class Xml {
	@:native("flight_parse_xml_document")
	public static function parseXmlDocument(xml:cpp.ConstCharStar):flight._cpp.XmlElement;
	@:native("flight_get_xml_element_attribute_number")
	public static function getXmlElementAttributeNumber(element:flight._cpp.XmlElement, name:cpp.ConstCharStar):Float;
	@:native("flight_get_xml_element_child_by_name")
	public static function getXmlElementChildByName(element:flight._cpp.XmlElement, name:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_free_xml_element")
	public static function freeXmlElement(ptr:flight._cpp.XmlElement):Void;
}
