package flight.esm.types.animation_contract;

#if (js && flight_esm)
typedef AnimationBlendTree = flight.esm.types.animation.Types.AnimationBlendTree;

typedef AnimationBlendTreeChannel = flight.esm.types.animation.Types.AnimationBlendTreeChannel;

typedef AnimationBlendTreeChannelSource = flight.esm.types.animation.Types.AnimationBlendTreeChannelSource;

typedef AnimationBlendTreeInput = flight.esm.types.animation.Types.AnimationBlendTreeInput;

typedef AnimationChannel = flight.esm.types.animation.Types.AnimationChannel;

typedef AnimationClip = flight.esm.types.animation.Types.AnimationClip;

typedef AnimationClipEvent = flight.esm.types.animation.Types.AnimationClipEvent;

typedef AnimationCrossfade = flight.esm.types.animation.Types.AnimationCrossfade;

typedef AnimationCrossfadeChannel = flight.esm.types.animation.Types.AnimationCrossfadeChannel;

typedef AnimationCrossfadeOptions = flight.esm.types.animation.Types.AnimationCrossfadeOptions;

typedef AnimationInterpolation = flight.esm.types.animation.Types.AnimationInterpolation;

typedef AnimationLayer = flight.esm.types.animation.Types.AnimationLayer;

typedef AnimationLayerOptions = flight.esm.types.animation.Types.AnimationLayerOptions;

typedef AnimationLayerStack = flight.esm.types.animation.Types.AnimationLayerStack;

typedef AnimationLayerStackChannel = flight.esm.types.animation.Types.AnimationLayerStackChannel;

typedef AnimationLayerStackChannelSource = flight.esm.types.animation.Types.AnimationLayerStackChannelSource;

typedef AnimationLoopMode = flight.esm.types.animation.Types.AnimationLoopMode;

typedef AnimationPlayer = flight.esm.types.animation.Types.AnimationPlayer;

typedef AnimationRootMotionExtractor = flight.esm.types.animation.Types.AnimationRootMotionExtractor;

typedef AnimationSampleAccumulator = flight.esm.types.animation.Types.AnimationSampleAccumulator;

typedef AnimationStateMachine = flight.esm.types.animation.Types.AnimationStateMachine;

typedef AnimationStateMachineChannel = flight.esm.types.animation.Types.AnimationStateMachineChannel;

typedef AnimationStateMachineState = flight.esm.types.animation.Types.AnimationStateMachineState;

typedef AnimationTrack = flight.esm.types.animation.Types.AnimationTrack;

typedef AnimationTrackValidationCode = flight.esm.types.animation.Types.AnimationTrackValidationCode;

typedef AnimationTrackValidationDiagnostic = flight.esm.types.animation.Types.AnimationTrackValidationDiagnostic;

typedef PlayMode = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
