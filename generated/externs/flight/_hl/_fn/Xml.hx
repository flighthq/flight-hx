package flight._hl._fn;

extern class Xml {
	@:hlNative("flight", "flight_parse_xml_document")
	public static function parseXmlDocument(xml:hl.Bytes):flight._hl.XmlElement;
	@:hlNative("flight", "flight_get_xml_element_attribute_number")
	public static function getXmlElementAttributeNumber(element:flight._hl.XmlElement, name:hl.Bytes):Float;
	@:hlNative("flight", "flight_get_xml_element_child_by_name")
	public static function getXmlElementChildByName(element:flight._hl.XmlElement, name:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_free_xml_element")
	public static function freeXmlElement(ptr:flight._hl.XmlElement):Void;
}
