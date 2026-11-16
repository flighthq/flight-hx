package flight;

#if (js && flight_esm)
extern inline function parseXmlDocument(xml:String):Null<XmlElement> {
	return flight._js._fn.Xml.parseXmlDocument(xml);
}
#else
extern inline function parseXmlDocument(xml:String):XmlElement {
#if hl
	return flight._hl._fn.Xml.parseXmlDocument(cast xml);
#elseif cpp
	return flight._cpp._fn.Xml.parseXmlDocument(cast xml);
#elseif (js && flight_esm)
	return flight._js._fn.Xml.parseXmlDocument(xml);
#else
	#error "flight.Xml: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getXmlElementAttributeNumber(element:XmlElement, name:String):Null<Float> {
	return flight._js._fn.Xml.getXmlElementAttributeNumber(element, name);
}
#else
extern inline function getXmlElementAttributeNumber(element:XmlElement, name:String):Float {
#if hl
	return flight._hl._fn.Xml.getXmlElementAttributeNumber(element, cast name);
#elseif cpp
	return flight._cpp._fn.Xml.getXmlElementAttributeNumber(element, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Xml.getXmlElementAttributeNumber(element, name);
#else
	#error "flight.Xml: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getXmlElementChildByName(element:XmlElement, name:String):Null<Dynamic> {
	return flight._js._fn.Xml.getXmlElementChildByName(element, name);
}
#else
extern inline function getXmlElementChildByName(element:XmlElement, name:String):Dynamic {
#if hl
	return flight._hl._fn.Xml.getXmlElementChildByName(element, cast name);
#elseif cpp
	return flight._cpp._fn.Xml.getXmlElementChildByName(element, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Xml.getXmlElementChildByName(element, name);
#else
	#error "flight.Xml: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeXmlElement(ptr:XmlElement):Void {
	flight._js._fn.Xml.freeXmlElement(ptr);
}
#else
extern inline function freeXmlElement(ptr:XmlElement):Void {
#if hl
	flight._hl._fn.Xml.freeXmlElement(ptr);
#elseif cpp
	flight._cpp._fn.Xml.freeXmlElement(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Xml.freeXmlElement(ptr);
#else
	#error "flight.Xml: no backend for this target."
#end
}
#end
