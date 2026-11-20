package flight.esm.types.requirement_contract;

#if (js && flight_esm)
typedef Requirement = flight.esm.types.requirement.Types.Requirement;

typedef RequirementFacet = flight.esm.types.requirement.Types.RequirementFacet;

typedef RequirementSet = flight.esm.types.requirement.Types.RequirementSet;

typedef RequirementSetRaw = flight.esm.types.requirement.Types.RequirementSetRaw;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
