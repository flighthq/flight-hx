package flight.esm.types.xml;

#if (js && flight_esm)
typedef XmlContent = Dynamic;

typedef XmlElement = { attributes:Dynamic, children:Array<flight.esm.types.xml.Types.XmlElement>, content:Array<flight.esm.types.xml.Types.XmlContent>, name:String, text:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
