package flight._js._fn;

@:jsRequire("@flighthq/xml")
extern class Xml {
	@:native("parseXmlDocument")
	public static function parseXmlDocument(xml:String):Null<flight._js.XmlElement>;
	@:native("getXmlElementAttributeNumber")
	public static function getXmlElementAttributeNumber(element:flight._js.XmlElement, name:String):Null<Float>;
	@:native("getXmlElementChildByName")
	public static function getXmlElementChildByName(element:flight._js.XmlElement, name:String):Null<Dynamic>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeXmlElement(ptr:flight._js.XmlElement):Void {}
}
