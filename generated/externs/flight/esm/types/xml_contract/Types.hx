package flight.esm.types.xml_contract;

#if (js && flight_esm)
typedef XmlContent = flight.esm.types.xml.Types.XmlContent;

typedef XmlElement = flight.esm.types.xml.Types.XmlElement;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
