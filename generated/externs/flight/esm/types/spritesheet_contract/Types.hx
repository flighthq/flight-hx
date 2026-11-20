package flight.esm.types.spritesheet_contract;

#if (js && flight_esm)
typedef Spritesheet = flight.esm.types.spritesheet.Types.Spritesheet;

typedef SpritesheetAnimation = flight.esm.types.spritesheet.Types.SpritesheetAnimation;

typedef SpritesheetAnimationData = flight.esm.types.spritesheet.Types.SpritesheetAnimationData;

typedef SpritesheetAnimationDirection = flight.esm.types.spritesheet.Types.SpritesheetAnimationDirection;

typedef SpritesheetData = flight.esm.types.spritesheet.Types.SpritesheetData;

typedef SpritesheetFrame = flight.esm.types.spritesheet.Types.SpritesheetFrame;

typedef SpritesheetFrameData = flight.esm.types.spritesheet.Types.SpritesheetFrameData;

typedef SpritesheetPlayer = flight.esm.types.spritesheet.Types.SpritesheetPlayer;

typedef SpritesheetValidationDiagnostic = flight.esm.types.spritesheet.Types.SpritesheetValidationDiagnostic;

typedef SpritesheetValidationSeverity = flight.esm.types.spritesheet.Types.SpritesheetValidationSeverity;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
