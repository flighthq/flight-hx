package flight.esm.types.requirement_codegen_contract;

#if (js && flight_esm)
typedef RequirementCodegenPlan = flight.esm.types.requirement_codegen.Types.RequirementCodegenPlan;

typedef RequirementDeclination = flight.esm.types.requirement_codegen.Types.RequirementDeclination;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
