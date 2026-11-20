package flight.esm.types.picking_contract;

#if (js && flight_esm)
typedef Scene3DHit = flight.esm.types.picking.Types.Scene3DHit;

typedef Scene3DPickOptions = flight.esm.types.picking.Types.Scene3DPickOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
