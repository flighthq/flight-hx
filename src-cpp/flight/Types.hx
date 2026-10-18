// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

var ALL_LIGHT_LAYERS(get, set):Float;

private extern inline function get_ALL_LIGHT_LAYERS():Float return flight._cpp._attempt.Attempt_Types_ALL_LIGHT_LAYERS.ALL_LIGHT_LAYERS;

private extern inline function set_ALL_LIGHT_LAYERS(value:Float):Float return flight._cpp._attempt.Attempt_Types_ALL_LIGHT_LAYERS.ALL_LIGHT_LAYERS = value;

var AbcMultinameKind(get, set):{ Multiname:Float, MultinameA:Float, MultinameL:Float, MultinameLA:Float, QName:Float, QNameA:Float, RtqName:Float, RtqNameA:Float, RtqNameL:Float, RtqNameLA:Float, TypeName:Float };

private extern inline function get_AbcMultinameKind():{ Multiname:Float, MultinameA:Float, MultinameL:Float, MultinameLA:Float, QName:Float, QNameA:Float, RtqName:Float, RtqNameA:Float, RtqNameL:Float, RtqNameLA:Float, TypeName:Float } return flight._cpp._attempt.Attempt_Types_AbcMultinameKind.AbcMultinameKind;

private extern inline function set_AbcMultinameKind(value:{ Multiname:Float, MultinameA:Float, MultinameL:Float, MultinameLA:Float, QName:Float, QNameA:Float, RtqName:Float, RtqNameA:Float, RtqNameL:Float, RtqNameLA:Float, TypeName:Float }):{ Multiname:Float, MultinameA:Float, MultinameL:Float, MultinameLA:Float, QName:Float, QNameA:Float, RtqName:Float, RtqNameA:Float, RtqNameL:Float, RtqNameLA:Float, TypeName:Float } return flight._cpp._attempt.Attempt_Types_AbcMultinameKind.AbcMultinameKind = value;

var AbcOpcode(get, set):{ Add:Float, AddInt:Float, ApplyType:Float, AsType:Float, AsTypeLate:Float, BitAnd:Float, BitNot:Float, BitOr:Float, BitXor:Float, Breakpoint:Float, BreakpointLine:Float, Call:Float, CallMethod:Float, CallProperty:Float, CallPropLex:Float, CallPropVoid:Float, CallStatic:Float, CallSuper:Float, CallSuperVoid:Float, CheckFilter:Float, Coerce:Float, CoerceAny:Float, CoerceBoolean:Float, CoerceDouble:Float, CoerceInt:Float, CoerceObject:Float, CoerceString:Float, CoerceUint:Float, Construct:Float, ConstructProp:Float, ConstructSuper:Float, ConvertBoolean:Float, ConvertDouble:Float, ConvertInt:Float, ConvertObject:Float, ConvertString:Float, ConvertUint:Float, Debug:Float, DebugFile:Float, DebugLine:Float, DecLocal:Float, DecLocalInt:Float, Decrement:Float, DecrementInt:Float, DeleteProperty:Float, Divide:Float, Dup:Float, Dxns:Float, DxnsLate:Float, Equals:Float, FindDef:Float, FindProperty:Float, FindPropStrict:Float, GetDescendants:Float, GetGlobalScope:Float, GetGlobalSlot:Float, GetLex:Float, GetLocal:Float, GetLocal0:Float, GetLocal1:Float, GetLocal2:Float, GetLocal3:Float, GetProperty:Float, GetScopeObject:Float, GetSlot:Float, GetSuper:Float, GreaterEquals:Float, GreaterThan:Float, HasNext:Float, HasNext2:Float, IfEq:Float, IfFalse:Float, IfGe:Float, IfGt:Float, IfLe:Float, IfLt:Float, IfNe:Float, IfNge:Float, IfNgt:Float, IfNle:Float, IfNlt:Float, IfStrictEq:Float, IfStrictNe:Float, IfTrue:Float, In:Float, IncLocal:Float, IncLocalInt:Float, Increment:Float, IncrementInt:Float, InitProperty:Float, InstanceOf:Float, IsType:Float, IsTypeLate:Float, Jump:Float, Kill:Float, Label:Float, LessEquals:Float, LessThan:Float, LoadFloat32:Float, LoadFloat64:Float, LoadInt16:Float, LoadInt32:Float, LoadInt8:Float, LookupSwitch:Float, LShift:Float, Modulo:Float, Multiply:Float, MultiplyInt:Float, Negate:Float, NegateInt:Float, NewActivation:Float, NewArray:Float, NewCatch:Float, NewClass:Float, NewFunction:Float, NewObject:Float, NextName:Float, NextValue:Float, Nop:Float, Not:Float, Pop:Float, PopScope:Float, PushByte:Float, PushDouble:Float, PushFalse:Float, PushInt:Float, PushNamespace:Float, PushNan:Float, PushNull:Float, PushScope:Float, PushShort:Float, PushString:Float, PushTrue:Float, PushUint:Float, PushUndefined:Float, PushWith:Float, ReturnValue:Float, ReturnVoid:Float, RShift:Float, SetGlobalSlot:Float, SetLocal:Float, SetLocal0:Float, SetLocal1:Float, SetLocal2:Float, SetLocal3:Float, SetProperty:Float, SetSlot:Float, SetSuper:Float, SignExtend1:Float, SignExtend16:Float, SignExtend8:Float, StoreFloat32:Float, StoreFloat64:Float, StoreInt16:Float, StoreInt32:Float, StoreInt8:Float, StrictEquals:Float, Subtract:Float, SubtractInt:Float, Swap:Float, Throw:Float, Timestamp:Float, TypeOf:Float, URShift:Float };

private extern inline function get_AbcOpcode():{ Add:Float, AddInt:Float, ApplyType:Float, AsType:Float, AsTypeLate:Float, BitAnd:Float, BitNot:Float, BitOr:Float, BitXor:Float, Breakpoint:Float, BreakpointLine:Float, Call:Float, CallMethod:Float, CallProperty:Float, CallPropLex:Float, CallPropVoid:Float, CallStatic:Float, CallSuper:Float, CallSuperVoid:Float, CheckFilter:Float, Coerce:Float, CoerceAny:Float, CoerceBoolean:Float, CoerceDouble:Float, CoerceInt:Float, CoerceObject:Float, CoerceString:Float, CoerceUint:Float, Construct:Float, ConstructProp:Float, ConstructSuper:Float, ConvertBoolean:Float, ConvertDouble:Float, ConvertInt:Float, ConvertObject:Float, ConvertString:Float, ConvertUint:Float, Debug:Float, DebugFile:Float, DebugLine:Float, DecLocal:Float, DecLocalInt:Float, Decrement:Float, DecrementInt:Float, DeleteProperty:Float, Divide:Float, Dup:Float, Dxns:Float, DxnsLate:Float, Equals:Float, FindDef:Float, FindProperty:Float, FindPropStrict:Float, GetDescendants:Float, GetGlobalScope:Float, GetGlobalSlot:Float, GetLex:Float, GetLocal:Float, GetLocal0:Float, GetLocal1:Float, GetLocal2:Float, GetLocal3:Float, GetProperty:Float, GetScopeObject:Float, GetSlot:Float, GetSuper:Float, GreaterEquals:Float, GreaterThan:Float, HasNext:Float, HasNext2:Float, IfEq:Float, IfFalse:Float, IfGe:Float, IfGt:Float, IfLe:Float, IfLt:Float, IfNe:Float, IfNge:Float, IfNgt:Float, IfNle:Float, IfNlt:Float, IfStrictEq:Float, IfStrictNe:Float, IfTrue:Float, In:Float, IncLocal:Float, IncLocalInt:Float, Increment:Float, IncrementInt:Float, InitProperty:Float, InstanceOf:Float, IsType:Float, IsTypeLate:Float, Jump:Float, Kill:Float, Label:Float, LessEquals:Float, LessThan:Float, LoadFloat32:Float, LoadFloat64:Float, LoadInt16:Float, LoadInt32:Float, LoadInt8:Float, LookupSwitch:Float, LShift:Float, Modulo:Float, Multiply:Float, MultiplyInt:Float, Negate:Float, NegateInt:Float, NewActivation:Float, NewArray:Float, NewCatch:Float, NewClass:Float, NewFunction:Float, NewObject:Float, NextName:Float, NextValue:Float, Nop:Float, Not:Float, Pop:Float, PopScope:Float, PushByte:Float, PushDouble:Float, PushFalse:Float, PushInt:Float, PushNamespace:Float, PushNan:Float, PushNull:Float, PushScope:Float, PushShort:Float, PushString:Float, PushTrue:Float, PushUint:Float, PushUndefined:Float, PushWith:Float, ReturnValue:Float, ReturnVoid:Float, RShift:Float, SetGlobalSlot:Float, SetLocal:Float, SetLocal0:Float, SetLocal1:Float, SetLocal2:Float, SetLocal3:Float, SetProperty:Float, SetSlot:Float, SetSuper:Float, SignExtend1:Float, SignExtend16:Float, SignExtend8:Float, StoreFloat32:Float, StoreFloat64:Float, StoreInt16:Float, StoreInt32:Float, StoreInt8:Float, StrictEquals:Float, Subtract:Float, SubtractInt:Float, Swap:Float, Throw:Float, Timestamp:Float, TypeOf:Float, URShift:Float } return flight._cpp._attempt.Attempt_Types_AbcOpcode.AbcOpcode;

private extern inline function set_AbcOpcode(value:{ Add:Float, AddInt:Float, ApplyType:Float, AsType:Float, AsTypeLate:Float, BitAnd:Float, BitNot:Float, BitOr:Float, BitXor:Float, Breakpoint:Float, BreakpointLine:Float, Call:Float, CallMethod:Float, CallProperty:Float, CallPropLex:Float, CallPropVoid:Float, CallStatic:Float, CallSuper:Float, CallSuperVoid:Float, CheckFilter:Float, Coerce:Float, CoerceAny:Float, CoerceBoolean:Float, CoerceDouble:Float, CoerceInt:Float, CoerceObject:Float, CoerceString:Float, CoerceUint:Float, Construct:Float, ConstructProp:Float, ConstructSuper:Float, ConvertBoolean:Float, ConvertDouble:Float, ConvertInt:Float, ConvertObject:Float, ConvertString:Float, ConvertUint:Float, Debug:Float, DebugFile:Float, DebugLine:Float, DecLocal:Float, DecLocalInt:Float, Decrement:Float, DecrementInt:Float, DeleteProperty:Float, Divide:Float, Dup:Float, Dxns:Float, DxnsLate:Float, Equals:Float, FindDef:Float, FindProperty:Float, FindPropStrict:Float, GetDescendants:Float, GetGlobalScope:Float, GetGlobalSlot:Float, GetLex:Float, GetLocal:Float, GetLocal0:Float, GetLocal1:Float, GetLocal2:Float, GetLocal3:Float, GetProperty:Float, GetScopeObject:Float, GetSlot:Float, GetSuper:Float, GreaterEquals:Float, GreaterThan:Float, HasNext:Float, HasNext2:Float, IfEq:Float, IfFalse:Float, IfGe:Float, IfGt:Float, IfLe:Float, IfLt:Float, IfNe:Float, IfNge:Float, IfNgt:Float, IfNle:Float, IfNlt:Float, IfStrictEq:Float, IfStrictNe:Float, IfTrue:Float, In:Float, IncLocal:Float, IncLocalInt:Float, Increment:Float, IncrementInt:Float, InitProperty:Float, InstanceOf:Float, IsType:Float, IsTypeLate:Float, Jump:Float, Kill:Float, Label:Float, LessEquals:Float, LessThan:Float, LoadFloat32:Float, LoadFloat64:Float, LoadInt16:Float, LoadInt32:Float, LoadInt8:Float, LookupSwitch:Float, LShift:Float, Modulo:Float, Multiply:Float, MultiplyInt:Float, Negate:Float, NegateInt:Float, NewActivation:Float, NewArray:Float, NewCatch:Float, NewClass:Float, NewFunction:Float, NewObject:Float, NextName:Float, NextValue:Float, Nop:Float, Not:Float, Pop:Float, PopScope:Float, PushByte:Float, PushDouble:Float, PushFalse:Float, PushInt:Float, PushNamespace:Float, PushNan:Float, PushNull:Float, PushScope:Float, PushShort:Float, PushString:Float, PushTrue:Float, PushUint:Float, PushUndefined:Float, PushWith:Float, ReturnValue:Float, ReturnVoid:Float, RShift:Float, SetGlobalSlot:Float, SetLocal:Float, SetLocal0:Float, SetLocal1:Float, SetLocal2:Float, SetLocal3:Float, SetProperty:Float, SetSlot:Float, SetSuper:Float, SignExtend1:Float, SignExtend16:Float, SignExtend8:Float, StoreFloat32:Float, StoreFloat64:Float, StoreInt16:Float, StoreInt32:Float, StoreInt8:Float, StrictEquals:Float, Subtract:Float, SubtractInt:Float, Swap:Float, Throw:Float, Timestamp:Float, TypeOf:Float, URShift:Float }):{ Add:Float, AddInt:Float, ApplyType:Float, AsType:Float, AsTypeLate:Float, BitAnd:Float, BitNot:Float, BitOr:Float, BitXor:Float, Breakpoint:Float, BreakpointLine:Float, Call:Float, CallMethod:Float, CallProperty:Float, CallPropLex:Float, CallPropVoid:Float, CallStatic:Float, CallSuper:Float, CallSuperVoid:Float, CheckFilter:Float, Coerce:Float, CoerceAny:Float, CoerceBoolean:Float, CoerceDouble:Float, CoerceInt:Float, CoerceObject:Float, CoerceString:Float, CoerceUint:Float, Construct:Float, ConstructProp:Float, ConstructSuper:Float, ConvertBoolean:Float, ConvertDouble:Float, ConvertInt:Float, ConvertObject:Float, ConvertString:Float, ConvertUint:Float, Debug:Float, DebugFile:Float, DebugLine:Float, DecLocal:Float, DecLocalInt:Float, Decrement:Float, DecrementInt:Float, DeleteProperty:Float, Divide:Float, Dup:Float, Dxns:Float, DxnsLate:Float, Equals:Float, FindDef:Float, FindProperty:Float, FindPropStrict:Float, GetDescendants:Float, GetGlobalScope:Float, GetGlobalSlot:Float, GetLex:Float, GetLocal:Float, GetLocal0:Float, GetLocal1:Float, GetLocal2:Float, GetLocal3:Float, GetProperty:Float, GetScopeObject:Float, GetSlot:Float, GetSuper:Float, GreaterEquals:Float, GreaterThan:Float, HasNext:Float, HasNext2:Float, IfEq:Float, IfFalse:Float, IfGe:Float, IfGt:Float, IfLe:Float, IfLt:Float, IfNe:Float, IfNge:Float, IfNgt:Float, IfNle:Float, IfNlt:Float, IfStrictEq:Float, IfStrictNe:Float, IfTrue:Float, In:Float, IncLocal:Float, IncLocalInt:Float, Increment:Float, IncrementInt:Float, InitProperty:Float, InstanceOf:Float, IsType:Float, IsTypeLate:Float, Jump:Float, Kill:Float, Label:Float, LessEquals:Float, LessThan:Float, LoadFloat32:Float, LoadFloat64:Float, LoadInt16:Float, LoadInt32:Float, LoadInt8:Float, LookupSwitch:Float, LShift:Float, Modulo:Float, Multiply:Float, MultiplyInt:Float, Negate:Float, NegateInt:Float, NewActivation:Float, NewArray:Float, NewCatch:Float, NewClass:Float, NewFunction:Float, NewObject:Float, NextName:Float, NextValue:Float, Nop:Float, Not:Float, Pop:Float, PopScope:Float, PushByte:Float, PushDouble:Float, PushFalse:Float, PushInt:Float, PushNamespace:Float, PushNan:Float, PushNull:Float, PushScope:Float, PushShort:Float, PushString:Float, PushTrue:Float, PushUint:Float, PushUndefined:Float, PushWith:Float, ReturnValue:Float, ReturnVoid:Float, RShift:Float, SetGlobalSlot:Float, SetLocal:Float, SetLocal0:Float, SetLocal1:Float, SetLocal2:Float, SetLocal3:Float, SetProperty:Float, SetSlot:Float, SetSuper:Float, SignExtend1:Float, SignExtend16:Float, SignExtend8:Float, StoreFloat32:Float, StoreFloat64:Float, StoreInt16:Float, StoreInt32:Float, StoreInt8:Float, StrictEquals:Float, Subtract:Float, SubtractInt:Float, Swap:Float, Throw:Float, Timestamp:Float, TypeOf:Float, URShift:Float } return flight._cpp._attempt.Attempt_Types_AbcOpcode.AbcOpcode = value;

var AbcTraitKind(get, set):{ Class:Float, Const:Float, Function:Float, Getter:Float, Method:Float, Setter:Float, Slot:Float };

private extern inline function get_AbcTraitKind():{ Class:Float, Const:Float, Function:Float, Getter:Float, Method:Float, Setter:Float, Slot:Float } return flight._cpp._attempt.Attempt_Types_AbcTraitKind.AbcTraitKind;

private extern inline function set_AbcTraitKind(value:{ Class:Float, Const:Float, Function:Float, Getter:Float, Method:Float, Setter:Float, Slot:Float }):{ Class:Float, Const:Float, Function:Float, Getter:Float, Method:Float, Setter:Float, Slot:Float } return flight._cpp._attempt.Attempt_Types_AbcTraitKind.AbcTraitKind = value;

var AddNodeChildCommandKind(get, set):String;

private extern inline function get_AddNodeChildCommandKind():String return flight._cpp._attempt.Attempt_Types_AddNodeChildCommandKind.AddNodeChildCommandKind;

private extern inline function set_AddNodeChildCommandKind(value:String):String return flight._cpp._attempt.Attempt_Types_AddNodeChildCommandKind.AddNodeChildCommandKind = value;

var AdvancedBlendMode(get, set):{ Color:String, ColorBurn:String, ColorDodge:String, Darken:String, Difference:String, Exclusion:String, HardLight:String, Hue:String, Lighten:String, Luminosity:String, Overlay:String, Saturation:String, SoftLight:String };

private extern inline function get_AdvancedBlendMode():{ Color:String, ColorBurn:String, ColorDodge:String, Darken:String, Difference:String, Exclusion:String, HardLight:String, Hue:String, Lighten:String, Luminosity:String, Overlay:String, Saturation:String, SoftLight:String } return flight._cpp._attempt.Attempt_Types_AdvancedBlendMode.AdvancedBlendMode;

private extern inline function set_AdvancedBlendMode(value:{ Color:String, ColorBurn:String, ColorDodge:String, Darken:String, Difference:String, Exclusion:String, HardLight:String, Hue:String, Lighten:String, Luminosity:String, Overlay:String, Saturation:String, SoftLight:String }):{ Color:String, ColorBurn:String, ColorDodge:String, Darken:String, Difference:String, Exclusion:String, HardLight:String, Hue:String, Lighten:String, Luminosity:String, Overlay:String, Saturation:String, SoftLight:String } return flight._cpp._attempt.Attempt_Types_AdvancedBlendMode.AdvancedBlendMode = value;

var AmbientLightKind(get, set):String;

private extern inline function get_AmbientLightKind():String return flight._cpp._attempt.Attempt_Types_AmbientLightKind.AmbientLightKind;

private extern inline function set_AmbientLightKind(value:String):String return flight._cpp._attempt.Attempt_Types_AmbientLightKind.AmbientLightKind = value;

var AnchorLayoutKind(get, set):String;

private extern inline function get_AnchorLayoutKind():String return flight._cpp._attempt.Attempt_Types_AnchorLayoutKind.AnchorLayoutKind;

private extern inline function set_AnchorLayoutKind(value:String):String return flight._cpp._attempt.Attempt_Types_AnchorLayoutKind.AnchorLayoutKind = value;

var AnimatedNormalModifierKind(get, set):String;

private extern inline function get_AnimatedNormalModifierKind():String return flight._cpp._attempt.Attempt_Types_AnimatedNormalModifierKind.AnimatedNormalModifierKind;

private extern inline function set_AnimatedNormalModifierKind(value:String):String return flight._cpp._attempt.Attempt_Types_AnimatedNormalModifierKind.AnimatedNormalModifierKind = value;

var AnimationInterpolationCubic(get, set):String;

private extern inline function get_AnimationInterpolationCubic():String return flight._cpp._attempt.Attempt_Types_AnimationInterpolationCubic.AnimationInterpolationCubic;

private extern inline function set_AnimationInterpolationCubic(value:String):String return flight._cpp._attempt.Attempt_Types_AnimationInterpolationCubic.AnimationInterpolationCubic = value;

var AnimationInterpolationLinear(get, set):String;

private extern inline function get_AnimationInterpolationLinear():String return flight._cpp._attempt.Attempt_Types_AnimationInterpolationLinear.AnimationInterpolationLinear;

private extern inline function set_AnimationInterpolationLinear(value:String):String return flight._cpp._attempt.Attempt_Types_AnimationInterpolationLinear.AnimationInterpolationLinear = value;

var AnimationInterpolationStep(get, set):String;

private extern inline function get_AnimationInterpolationStep():String return flight._cpp._attempt.Attempt_Types_AnimationInterpolationStep.AnimationInterpolationStep;

private extern inline function set_AnimationInterpolationStep(value:String):String return flight._cpp._attempt.Attempt_Types_AnimationInterpolationStep.AnimationInterpolationStep = value;

var AnimationLoopModePingPong(get, set):String;

private extern inline function get_AnimationLoopModePingPong():String return flight._cpp._attempt.Attempt_Types_AnimationLoopModePingPong.AnimationLoopModePingPong;

private extern inline function set_AnimationLoopModePingPong(value:String):String return flight._cpp._attempt.Attempt_Types_AnimationLoopModePingPong.AnimationLoopModePingPong = value;

var AnimationLoopModeRepeat(get, set):String;

private extern inline function get_AnimationLoopModeRepeat():String return flight._cpp._attempt.Attempt_Types_AnimationLoopModeRepeat.AnimationLoopModeRepeat;

private extern inline function set_AnimationLoopModeRepeat(value:String):String return flight._cpp._attempt.Attempt_Types_AnimationLoopModeRepeat.AnimationLoopModeRepeat = value;

var AnisotropyPbrExtensionKind(get, set):String;

private extern inline function get_AnisotropyPbrExtensionKind():String return flight._cpp._attempt.Attempt_Types_AnisotropyPbrExtensionKind.AnisotropyPbrExtensionKind;

private extern inline function set_AnisotropyPbrExtensionKind(value:String):String return flight._cpp._attempt.Attempt_Types_AnisotropyPbrExtensionKind.AnisotropyPbrExtensionKind = value;

var AreaLightKind(get, set):String;

private extern inline function get_AreaLightKind():String return flight._cpp._attempt.Attempt_Types_AreaLightKind.AreaLightKind;

private extern inline function set_AreaLightKind(value:String):String return flight._cpp._attempt.Attempt_Types_AreaLightKind.AreaLightKind = value;

var AttractorForceKind(get, set):String;

private extern inline function get_AttractorForceKind():String return flight._cpp._attempt.Attempt_Types_AttractorForceKind.AttractorForceKind;

private extern inline function set_AttractorForceKind(value:String):String return flight._cpp._attempt.Attempt_Types_AttractorForceKind.AttractorForceKind = value;

var AudioResourceFailureKind(get, set):{ Error:String, Unavailable:String };

private extern inline function get_AudioResourceFailureKind():{ Error:String, Unavailable:String } return flight._cpp._attempt.Attempt_Types_AudioResourceFailureKind.AudioResourceFailureKind;

private extern inline function set_AudioResourceFailureKind(value:{ Error:String, Unavailable:String }):{ Error:String, Unavailable:String } return flight._cpp._attempt.Attempt_Types_AudioResourceFailureKind.AudioResourceFailureKind = value;

var AudioResourceReferenceKind(get, set):{ Embedded:String, External:String };

private extern inline function get_AudioResourceReferenceKind():{ Embedded:String, External:String } return flight._cpp._attempt.Attempt_Types_AudioResourceReferenceKind.AudioResourceReferenceKind;

private extern inline function set_AudioResourceReferenceKind(value:{ Embedded:String, External:String }):{ Embedded:String, External:String } return flight._cpp._attempt.Attempt_Types_AudioResourceReferenceKind.AudioResourceReferenceKind = value;

var BillboardKind(get, set):String;

private extern inline function get_BillboardKind():String return flight._cpp._attempt.Attempt_Types_BillboardKind.BillboardKind;

private extern inline function set_BillboardKind(value:String):String return flight._cpp._attempt.Attempt_Types_BillboardKind.BillboardKind = value;

var BitmapCompositeMode(get, set):{ Add:String, Clear:String, ColorBurn:String, ColorDodge:String, Copy:String, Darken:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, Difference:String, Exclusion:String, HardLight:String, Invert:String, Lighten:String, Multiply:String, Normal:String, Overlay:String, Screen:String, SoftLight:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Subtract:String, Xor:String };

private extern inline function get_BitmapCompositeMode():{ Add:String, Clear:String, ColorBurn:String, ColorDodge:String, Copy:String, Darken:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, Difference:String, Exclusion:String, HardLight:String, Invert:String, Lighten:String, Multiply:String, Normal:String, Overlay:String, Screen:String, SoftLight:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Subtract:String, Xor:String } return flight._cpp._attempt.Attempt_Types_BitmapCompositeMode.BitmapCompositeMode;

private extern inline function set_BitmapCompositeMode(value:{ Add:String, Clear:String, ColorBurn:String, ColorDodge:String, Copy:String, Darken:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, Difference:String, Exclusion:String, HardLight:String, Invert:String, Lighten:String, Multiply:String, Normal:String, Overlay:String, Screen:String, SoftLight:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Subtract:String, Xor:String }):{ Add:String, Clear:String, ColorBurn:String, ColorDodge:String, Copy:String, Darken:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, Difference:String, Exclusion:String, HardLight:String, Invert:String, Lighten:String, Multiply:String, Normal:String, Overlay:String, Screen:String, SoftLight:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Subtract:String, Xor:String } return flight._cpp._attempt.Attempt_Types_BitmapCompositeMode.BitmapCompositeMode = value;

var BitmapFontFormatKindBmFontBinary(get, set):String;

private extern inline function get_BitmapFontFormatKindBmFontBinary():String return flight._cpp._attempt.Attempt_Types_BitmapFontFormatKindBmFontBinary.BitmapFontFormatKindBmFontBinary;

private extern inline function set_BitmapFontFormatKindBmFontBinary(value:String):String return flight._cpp._attempt.Attempt_Types_BitmapFontFormatKindBmFontBinary.BitmapFontFormatKindBmFontBinary = value;

var BitmapFontFormatKindBmFontJson(get, set):String;

private extern inline function get_BitmapFontFormatKindBmFontJson():String return flight._cpp._attempt.Attempt_Types_BitmapFontFormatKindBmFontJson.BitmapFontFormatKindBmFontJson;

private extern inline function set_BitmapFontFormatKindBmFontJson(value:String):String return flight._cpp._attempt.Attempt_Types_BitmapFontFormatKindBmFontJson.BitmapFontFormatKindBmFontJson = value;

var BitmapFontFormatKindBmFontText(get, set):String;

private extern inline function get_BitmapFontFormatKindBmFontText():String return flight._cpp._attempt.Attempt_Types_BitmapFontFormatKindBmFontText.BitmapFontFormatKindBmFontText;

private extern inline function set_BitmapFontFormatKindBmFontText(value:String):String return flight._cpp._attempt.Attempt_Types_BitmapFontFormatKindBmFontText.BitmapFontFormatKindBmFontText = value;

var BitmapFontFormatKindBmFontXml(get, set):String;

private extern inline function get_BitmapFontFormatKindBmFontXml():String return flight._cpp._attempt.Attempt_Types_BitmapFontFormatKindBmFontXml.BitmapFontFormatKindBmFontXml;

private extern inline function set_BitmapFontFormatKindBmFontXml(value:String):String return flight._cpp._attempt.Attempt_Types_BitmapFontFormatKindBmFontXml.BitmapFontFormatKindBmFontXml = value;

var BitmapTextKind(get, set):String;

private extern inline function get_BitmapTextKind():String return flight._cpp._attempt.Attempt_Types_BitmapTextKind.BitmapTextKind;

private extern inline function set_BitmapTextKind(value:String):String return flight._cpp._attempt.Attempt_Types_BitmapTextKind.BitmapTextKind = value;

var BitmapTextureSourceKind(get, set):String;

private extern inline function get_BitmapTextureSourceKind():String return flight._cpp._attempt.Attempt_Types_BitmapTextureSourceKind.BitmapTextureSourceKind;

private extern inline function set_BitmapTextureSourceKind(value:String):String return flight._cpp._attempt.Attempt_Types_BitmapTextureSourceKind.BitmapTextureSourceKind = value;

var BlendMode(get, set):{ Add:String, Darken:String, Lighten:String, Multiply:String, Normal:String, Screen:String };

private extern inline function get_BlendMode():{ Add:String, Darken:String, Lighten:String, Multiply:String, Normal:String, Screen:String } return flight._cpp._attempt.Attempt_Types_BlendMode.BlendMode;

private extern inline function set_BlendMode(value:{ Add:String, Darken:String, Lighten:String, Multiply:String, Normal:String, Screen:String }):{ Add:String, Darken:String, Lighten:String, Multiply:String, Normal:String, Screen:String } return flight._cpp._attempt.Attempt_Types_BlendMode.BlendMode = value;

var BlinnPhongMaterialKind(get, set):String;

private extern inline function get_BlinnPhongMaterialKind():String return flight._cpp._attempt.Attempt_Types_BlinnPhongMaterialKind.BlinnPhongMaterialKind;

private extern inline function set_BlinnPhongMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_BlinnPhongMaterialKind.BlinnPhongMaterialKind = value;

var BoundingBoxAttachment2DKind(get, set):String;

private extern inline function get_BoundingBoxAttachment2DKind():String return flight._cpp._attempt.Attempt_Types_BoundingBoxAttachment2DKind.BoundingBoxAttachment2DKind;

private extern inline function set_BoundingBoxAttachment2DKind(value:String):String return flight._cpp._attempt.Attempt_Types_BoundingBoxAttachment2DKind.BoundingBoxAttachment2DKind = value;

var CandelaLightUnit(get, set):String;

private extern inline function get_CandelaLightUnit():String return flight._cpp._attempt.Attempt_Types_CandelaLightUnit.CandelaLightUnit;

private extern inline function set_CandelaLightUnit(value:String):String return flight._cpp._attempt.Attempt_Types_CandelaLightUnit.CandelaLightUnit = value;

var CircleColliderKind(get, set):String;

private extern inline function get_CircleColliderKind():String return flight._cpp._attempt.Attempt_Types_CircleColliderKind.CircleColliderKind;

private extern inline function set_CircleColliderKind(value:String):String return flight._cpp._attempt.Attempt_Types_CircleColliderKind.CircleColliderKind = value;

var ClearcoatPbrExtensionKind(get, set):String;

private extern inline function get_ClearcoatPbrExtensionKind():String return flight._cpp._attempt.Attempt_Types_ClearcoatPbrExtensionKind.ClearcoatPbrExtensionKind;

private extern inline function set_ClearcoatPbrExtensionKind(value:String):String return flight._cpp._attempt.Attempt_Types_ClearcoatPbrExtensionKind.ClearcoatPbrExtensionKind = value;

var ClipboardFormatBookmark(get, set):String;

private extern inline function get_ClipboardFormatBookmark():String return flight._cpp._attempt.Attempt_Types_ClipboardFormatBookmark.ClipboardFormatBookmark;

private extern inline function set_ClipboardFormatBookmark(value:String):String return flight._cpp._attempt.Attempt_Types_ClipboardFormatBookmark.ClipboardFormatBookmark = value;

var ClipboardFormatHtml(get, set):String;

private extern inline function get_ClipboardFormatHtml():String return flight._cpp._attempt.Attempt_Types_ClipboardFormatHtml.ClipboardFormatHtml;

private extern inline function set_ClipboardFormatHtml(value:String):String return flight._cpp._attempt.Attempt_Types_ClipboardFormatHtml.ClipboardFormatHtml = value;

var ClipboardFormatImage(get, set):String;

private extern inline function get_ClipboardFormatImage():String return flight._cpp._attempt.Attempt_Types_ClipboardFormatImage.ClipboardFormatImage;

private extern inline function set_ClipboardFormatImage(value:String):String return flight._cpp._attempt.Attempt_Types_ClipboardFormatImage.ClipboardFormatImage = value;

var ClipboardFormatRtf(get, set):String;

private extern inline function get_ClipboardFormatRtf():String return flight._cpp._attempt.Attempt_Types_ClipboardFormatRtf.ClipboardFormatRtf;

private extern inline function set_ClipboardFormatRtf(value:String):String return flight._cpp._attempt.Attempt_Types_ClipboardFormatRtf.ClipboardFormatRtf = value;

var ClipboardFormatText(get, set):String;

private extern inline function get_ClipboardFormatText():String return flight._cpp._attempt.Attempt_Types_ClipboardFormatText.ClipboardFormatText;

private extern inline function set_ClipboardFormatText(value:String):String return flight._cpp._attempt.Attempt_Types_ClipboardFormatText.ClipboardFormatText = value;

var ClipboardFormatUriList(get, set):String;

private extern inline function get_ClipboardFormatUriList():String return flight._cpp._attempt.Attempt_Types_ClipboardFormatUriList.ClipboardFormatUriList;

private extern inline function set_ClipboardFormatUriList(value:String):String return flight._cpp._attempt.Attempt_Types_ClipboardFormatUriList.ClipboardFormatUriList = value;

var ClippingAttachment2DKind(get, set):String;

private extern inline function get_ClippingAttachment2DKind():String return flight._cpp._attempt.Attempt_Types_ClippingAttachment2DKind.ClippingAttachment2DKind;

private extern inline function set_ClippingAttachment2DKind(value:String):String return flight._cpp._attempt.Attempt_Types_ClippingAttachment2DKind.ClippingAttachment2DKind = value;

var CompositeCommandKind(get, set):String;

private extern inline function get_CompositeCommandKind():String return flight._cpp._attempt.Attempt_Types_CompositeCommandKind.CompositeCommandKind;

private extern inline function set_CompositeCommandKind(value:String):String return flight._cpp._attempt.Attempt_Types_CompositeCommandKind.CompositeCommandKind = value;

var CompositeOperator(get, set):{ Clear:String, Copy:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Xor:String };

private extern inline function get_CompositeOperator():{ Clear:String, Copy:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Xor:String } return flight._cpp._attempt.Attempt_Types_CompositeOperator.CompositeOperator;

private extern inline function set_CompositeOperator(value:{ Clear:String, Copy:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Xor:String }):{ Clear:String, Copy:String, DestinationAtop:String, DestinationIn:String, DestinationOut:String, DestinationOver:String, SourceAtop:String, SourceIn:String, SourceOut:String, SourceOver:String, Xor:String } return flight._cpp._attempt.Attempt_Types_CompositeOperator.CompositeOperator = value;

var CompressedImageTextureSourceKind(get, set):String;

private extern inline function get_CompressedImageTextureSourceKind():String return flight._cpp._attempt.Attempt_Types_CompressedImageTextureSourceKind.CompressedImageTextureSourceKind;

private extern inline function set_CompressedImageTextureSourceKind(value:String):String return flight._cpp._attempt.Attempt_Types_CompressedImageTextureSourceKind.CompressedImageTextureSourceKind = value;

var Compression(get, set):{ Brotli:String, Deflate:String, Lzma:String };

private extern inline function get_Compression():{ Brotli:String, Deflate:String, Lzma:String } return flight._cpp._attempt.Attempt_Types_Compression.Compression;

private extern inline function set_Compression(value:{ Brotli:String, Deflate:String, Lzma:String }):{ Brotli:String, Deflate:String, Lzma:String } return flight._cpp._attempt.Attempt_Types_Compression.Compression = value;

var CompressionFraming(get, set):{ Raw:String, Rfc1950:String };

private extern inline function get_CompressionFraming():{ Raw:String, Rfc1950:String } return flight._cpp._attempt.Attempt_Types_CompressionFraming.CompressionFraming;

private extern inline function set_CompressionFraming(value:{ Raw:String, Rfc1950:String }):{ Raw:String, Rfc1950:String } return flight._cpp._attempt.Attempt_Types_CompressionFraming.CompressionFraming = value;

var CubeFaceNegativeX(get, set):Float;

private extern inline function get_CubeFaceNegativeX():Float return flight._cpp._attempt.Attempt_Types_CubeFaceNegativeX.CubeFaceNegativeX;

private extern inline function set_CubeFaceNegativeX(value:Float):Float return flight._cpp._attempt.Attempt_Types_CubeFaceNegativeX.CubeFaceNegativeX = value;

var CubeFaceNegativeY(get, set):Float;

private extern inline function get_CubeFaceNegativeY():Float return flight._cpp._attempt.Attempt_Types_CubeFaceNegativeY.CubeFaceNegativeY;

private extern inline function set_CubeFaceNegativeY(value:Float):Float return flight._cpp._attempt.Attempt_Types_CubeFaceNegativeY.CubeFaceNegativeY = value;

var CubeFaceNegativeZ(get, set):Float;

private extern inline function get_CubeFaceNegativeZ():Float return flight._cpp._attempt.Attempt_Types_CubeFaceNegativeZ.CubeFaceNegativeZ;

private extern inline function set_CubeFaceNegativeZ(value:Float):Float return flight._cpp._attempt.Attempt_Types_CubeFaceNegativeZ.CubeFaceNegativeZ = value;

var CubeFacePositiveX(get, set):Float;

private extern inline function get_CubeFacePositiveX():Float return flight._cpp._attempt.Attempt_Types_CubeFacePositiveX.CubeFacePositiveX;

private extern inline function set_CubeFacePositiveX(value:Float):Float return flight._cpp._attempt.Attempt_Types_CubeFacePositiveX.CubeFacePositiveX = value;

var CubeFacePositiveY(get, set):Float;

private extern inline function get_CubeFacePositiveY():Float return flight._cpp._attempt.Attempt_Types_CubeFacePositiveY.CubeFacePositiveY;

private extern inline function set_CubeFacePositiveY(value:Float):Float return flight._cpp._attempt.Attempt_Types_CubeFacePositiveY.CubeFacePositiveY = value;

var CubeFacePositiveZ(get, set):Float;

private extern inline function get_CubeFacePositiveZ():Float return flight._cpp._attempt.Attempt_Types_CubeFacePositiveZ.CubeFacePositiveZ;

private extern inline function set_CubeFacePositiveZ(value:Float):Float return flight._cpp._attempt.Attempt_Types_CubeFacePositiveZ.CubeFacePositiveZ = value;

var CurlNoiseForceKind(get, set):String;

private extern inline function get_CurlNoiseForceKind():String return flight._cpp._attempt.Attempt_Types_CurlNoiseForceKind.CurlNoiseForceKind;

private extern inline function set_CurlNoiseForceKind(value:String):String return flight._cpp._attempt.Attempt_Types_CurlNoiseForceKind.CurlNoiseForceKind = value;

var CustomShaderMaterialKind(get, set):String;

private extern inline function get_CustomShaderMaterialKind():String return flight._cpp._attempt.Attempt_Types_CustomShaderMaterialKind.CustomShaderMaterialKind;

private extern inline function set_CustomShaderMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_CustomShaderMaterialKind.CustomShaderMaterialKind = value;

var DIRECTIONAL_SHADOW_MAP_SIZE(get, set):Float;

private extern inline function get_DIRECTIONAL_SHADOW_MAP_SIZE():Float return flight._cpp._attempt.Attempt_Types_DIRECTIONAL_SHADOW_MAP_SIZE.DIRECTIONAL_SHADOW_MAP_SIZE;

private extern inline function set_DIRECTIONAL_SHADOW_MAP_SIZE(value:Float):Float return flight._cpp._attempt.Attempt_Types_DIRECTIONAL_SHADOW_MAP_SIZE.DIRECTIONAL_SHADOW_MAP_SIZE = value;

var DepthMaterialKind(get, set):String;

private extern inline function get_DepthMaterialKind():String return flight._cpp._attempt.Attempt_Types_DepthMaterialKind.DepthMaterialKind;

private extern inline function set_DepthMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_DepthMaterialKind.DepthMaterialKind = value;

var DeviceFormFactorCar(get, set):String;

private extern inline function get_DeviceFormFactorCar():String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorCar.DeviceFormFactorCar;

private extern inline function set_DeviceFormFactorCar(value:String):String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorCar.DeviceFormFactorCar = value;

var DeviceFormFactorDesktop(get, set):String;

private extern inline function get_DeviceFormFactorDesktop():String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorDesktop.DeviceFormFactorDesktop;

private extern inline function set_DeviceFormFactorDesktop(value:String):String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorDesktop.DeviceFormFactorDesktop = value;

var DeviceFormFactorPhone(get, set):String;

private extern inline function get_DeviceFormFactorPhone():String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorPhone.DeviceFormFactorPhone;

private extern inline function set_DeviceFormFactorPhone(value:String):String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorPhone.DeviceFormFactorPhone = value;

var DeviceFormFactorTV(get, set):String;

private extern inline function get_DeviceFormFactorTV():String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorTV.DeviceFormFactorTV;

private extern inline function set_DeviceFormFactorTV(value:String):String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorTV.DeviceFormFactorTV = value;

var DeviceFormFactorTablet(get, set):String;

private extern inline function get_DeviceFormFactorTablet():String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorTablet.DeviceFormFactorTablet;

private extern inline function set_DeviceFormFactorTablet(value:String):String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorTablet.DeviceFormFactorTablet = value;

var DeviceFormFactorUnknown(get, set):String;

private extern inline function get_DeviceFormFactorUnknown():String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorUnknown.DeviceFormFactorUnknown;

private extern inline function set_DeviceFormFactorUnknown(value:String):String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorUnknown.DeviceFormFactorUnknown = value;

var DeviceFormFactorWatch(get, set):String;

private extern inline function get_DeviceFormFactorWatch():String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorWatch.DeviceFormFactorWatch;

private extern inline function set_DeviceFormFactorWatch(value:String):String return flight._cpp._attempt.Attempt_Types_DeviceFormFactorWatch.DeviceFormFactorWatch = value;

var DirectionalLightKind(get, set):String;

private extern inline function get_DirectionalLightKind():String return flight._cpp._attempt.Attempt_Types_DirectionalLightKind.DirectionalLightKind;

private extern inline function set_DirectionalLightKind(value:String):String return flight._cpp._attempt.Attempt_Types_DirectionalLightKind.DirectionalLightKind = value;

var DisplayObjectKind(get, set):String;

private extern inline function get_DisplayObjectKind():String return flight._cpp._attempt.Attempt_Types_DisplayObjectKind.DisplayObjectKind;

private extern inline function set_DisplayObjectKind(value:String):String return flight._cpp._attempt.Attempt_Types_DisplayObjectKind.DisplayObjectKind = value;

var DissolveModifierKind(get, set):String;

private extern inline function get_DissolveModifierKind():String return flight._cpp._attempt.Attempt_Types_DissolveModifierKind.DissolveModifierKind;

private extern inline function set_DissolveModifierKind(value:String):String return flight._cpp._attempt.Attempt_Types_DissolveModifierKind.DissolveModifierKind = value;

var DragForceKind(get, set):String;

private extern inline function get_DragForceKind():String return flight._cpp._attempt.Attempt_Types_DragForceKind.DragForceKind;

private extern inline function set_DragForceKind(value:String):String return flight._cpp._attempt.Attempt_Types_DragForceKind.DragForceKind = value;

var DragonBonesSectionKind(get, set):{ Animations:String, Bones:String, IkConstraints:String, Skins:String, Slots:String };

private extern inline function get_DragonBonesSectionKind():{ Animations:String, Bones:String, IkConstraints:String, Skins:String, Slots:String } return flight._cpp._attempt.Attempt_Types_DragonBonesSectionKind.DragonBonesSectionKind;

private extern inline function set_DragonBonesSectionKind(value:{ Animations:String, Bones:String, IkConstraints:String, Skins:String, Slots:String }):{ Animations:String, Bones:String, IkConstraints:String, Skins:String, Slots:String } return flight._cpp._attempt.Attempt_Types_DragonBonesSectionKind.DragonBonesSectionKind = value;

var DragonBonesTimelineKind(get, set):{ Bone:String, Deform:String, Ik:String, Slot:String, ZOrder:String };

private extern inline function get_DragonBonesTimelineKind():{ Bone:String, Deform:String, Ik:String, Slot:String, ZOrder:String } return flight._cpp._attempt.Attempt_Types_DragonBonesTimelineKind.DragonBonesTimelineKind;

private extern inline function set_DragonBonesTimelineKind(value:{ Bone:String, Deform:String, Ik:String, Slot:String, ZOrder:String }):{ Bone:String, Deform:String, Ik:String, Slot:String, ZOrder:String } return flight._cpp._attempt.Attempt_Types_DragonBonesTimelineKind.DragonBonesTimelineKind = value;

var EmissiveMaterialKind(get, set):String;

private extern inline function get_EmissiveMaterialKind():String return flight._cpp._attempt.Attempt_Types_EmissiveMaterialKind.EmissiveMaterialKind;

private extern inline function set_EmissiveMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_EmissiveMaterialKind.EmissiveMaterialKind = value;

var EmissiveModifierFacing(get, set):{ AwayFromLight:String, Ignore:String, TowardLight:String };

private extern inline function get_EmissiveModifierFacing():{ AwayFromLight:String, Ignore:String, TowardLight:String } return flight._cpp._attempt.Attempt_Types_EmissiveModifierFacing.EmissiveModifierFacing;

private extern inline function set_EmissiveModifierFacing(value:{ AwayFromLight:String, Ignore:String, TowardLight:String }):{ AwayFromLight:String, Ignore:String, TowardLight:String } return flight._cpp._attempt.Attempt_Types_EmissiveModifierFacing.EmissiveModifierFacing = value;

var EmissiveModifierKind(get, set):String;

private extern inline function get_EmissiveModifierKind():String return flight._cpp._attempt.Attempt_Types_EmissiveModifierKind.EmissiveModifierKind;

private extern inline function set_EmissiveModifierKind(value:String):String return flight._cpp._attempt.Attempt_Types_EmissiveModifierKind.EmissiveModifierKind = value;

var EntityRuntimeKey(get, set):Dynamic;

private extern inline function get_EntityRuntimeKey():Dynamic return flight._cpp._attempt.Attempt_Types_EntityRuntimeKey.EntityRuntimeKey;

private extern inline function set_EntityRuntimeKey(value:Dynamic):Dynamic return flight._cpp._attempt.Attempt_Types_EntityRuntimeKey.EntityRuntimeKey = value;

var EnvReflectModifierKind(get, set):String;

private extern inline function get_EnvReflectModifierKind():String return flight._cpp._attempt.Attempt_Types_EnvReflectModifierKind.EnvReflectModifierKind;

private extern inline function set_EnvReflectModifierKind(value:String):String return flight._cpp._attempt.Attempt_Types_EnvReflectModifierKind.EnvReflectModifierKind = value;

var EnvironmentKind(get, set):String;

private extern inline function get_EnvironmentKind():String return flight._cpp._attempt.Attempt_Types_EnvironmentKind.EnvironmentKind;

private extern inline function set_EnvironmentKind(value:String):String return flight._cpp._attempt.Attempt_Types_EnvironmentKind.EnvironmentKind = value;

var ExtendedPbrMaterialKind(get, set):String;

private extern inline function get_ExtendedPbrMaterialKind():String return flight._cpp._attempt.Attempt_Types_ExtendedPbrMaterialKind.ExtendedPbrMaterialKind;

private extern inline function set_ExtendedPbrMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_ExtendedPbrMaterialKind.ExtendedPbrMaterialKind = value;

var ExternalTextureSourceKind(get, set):String;

private extern inline function get_ExternalTextureSourceKind():String return flight._cpp._attempt.Attempt_Types_ExternalTextureSourceKind.ExternalTextureSourceKind;

private extern inline function set_ExternalTextureSourceKind(value:String):String return flight._cpp._attempt.Attempt_Types_ExternalTextureSourceKind.ExternalTextureSourceKind = value;

var FlexLayoutKind(get, set):String;

private extern inline function get_FlexLayoutKind():String return flight._cpp._attempt.Attempt_Types_FlexLayoutKind.FlexLayoutKind;

private extern inline function set_FlexLayoutKind(value:String):String return flight._cpp._attempt.Attempt_Types_FlexLayoutKind.FlexLayoutKind = value;

var FlightDocumentRefusalReason(get, set):{ AliasUnsupported:String, AnchorUnsupported:String, BlockScalarUnsupported:String, CollectionEntriesLimitExceeded:String, DefaultSceneOutOfRange:String, DocumentCodeUnitsLimitExceeded:String, DocumentSeparatorUnsupported:String, DuplicateAmbientLight:String, DuplicateDirectionalLight:String, DuplicateKey:String, ExpectedFlowDelimiter:String, ExpectedMappingEntry:String, ExpectedMappingKey:String, ExpectedScalar:String, ExpectedValue:String, FieldInvalid:String, FlowSequenceUnsupported:String, InvalidDocument:String, InvalidEscape:String, InteractiveStateExtensionKindDuplicate:String, InteractiveStateExtensionKindUnregistered:String, InteractiveStateTargetUnsupported:String, InteractiveStateTransitionKindUnregistered:String, KeyCodeUnitsLimitExceeded:String, LayoutTargetAmbiguous:String, LayoutTargetUnresolved:String, MixedCollection:String, MultipleRootValues:String, NestingDepthLimitExceeded:String, NodeKindUnregistered:String, NumberOutOfRange:String, ResourceKindUnregistered:String, ResourceResolverUnregistered:String, ResourceUnresolved:String, RootIndentation:String, RootKindMismatch:String, ScalarCodeUnitsLimitExceeded:String, ScalarInvalid:String, ShapeCommandUnregistered:String, ScenesEmpty:String, StructureInvalid:String, TabCharacter:String, TagUnsupported:String, TokenKeyDuplicate:String, TokenKeyInvalid:String, TokenKindMismatch:String, TokenModeInvalid:String, TokenModeUnresolved:String, TokenReferenceCycle:String, TokenReferenceInvalid:String, TokenResolverUnregistered:String, TokenUnresolved:String, TokenValueInvalid:String, TotalNodesLimitExceeded:String, TrailingFlowComma:String, TrailingFlowContent:String, UnexpectedIndentation:String, UnexpectedToken:String, UnterminatedFlowMapping:String, UnterminatedQuotedScalar:String, VersionUnsupported:String };

private extern inline function get_FlightDocumentRefusalReason():{ AliasUnsupported:String, AnchorUnsupported:String, BlockScalarUnsupported:String, CollectionEntriesLimitExceeded:String, DefaultSceneOutOfRange:String, DocumentCodeUnitsLimitExceeded:String, DocumentSeparatorUnsupported:String, DuplicateAmbientLight:String, DuplicateDirectionalLight:String, DuplicateKey:String, ExpectedFlowDelimiter:String, ExpectedMappingEntry:String, ExpectedMappingKey:String, ExpectedScalar:String, ExpectedValue:String, FieldInvalid:String, FlowSequenceUnsupported:String, InvalidDocument:String, InvalidEscape:String, InteractiveStateExtensionKindDuplicate:String, InteractiveStateExtensionKindUnregistered:String, InteractiveStateTargetUnsupported:String, InteractiveStateTransitionKindUnregistered:String, KeyCodeUnitsLimitExceeded:String, LayoutTargetAmbiguous:String, LayoutTargetUnresolved:String, MixedCollection:String, MultipleRootValues:String, NestingDepthLimitExceeded:String, NodeKindUnregistered:String, NumberOutOfRange:String, ResourceKindUnregistered:String, ResourceResolverUnregistered:String, ResourceUnresolved:String, RootIndentation:String, RootKindMismatch:String, ScalarCodeUnitsLimitExceeded:String, ScalarInvalid:String, ShapeCommandUnregistered:String, ScenesEmpty:String, StructureInvalid:String, TabCharacter:String, TagUnsupported:String, TokenKeyDuplicate:String, TokenKeyInvalid:String, TokenKindMismatch:String, TokenModeInvalid:String, TokenModeUnresolved:String, TokenReferenceCycle:String, TokenReferenceInvalid:String, TokenResolverUnregistered:String, TokenUnresolved:String, TokenValueInvalid:String, TotalNodesLimitExceeded:String, TrailingFlowComma:String, TrailingFlowContent:String, UnexpectedIndentation:String, UnexpectedToken:String, UnterminatedFlowMapping:String, UnterminatedQuotedScalar:String, VersionUnsupported:String } return flight._cpp._attempt.Attempt_Types_FlightDocumentRefusalReason.FlightDocumentRefusalReason;

private extern inline function set_FlightDocumentRefusalReason(value:{ AliasUnsupported:String, AnchorUnsupported:String, BlockScalarUnsupported:String, CollectionEntriesLimitExceeded:String, DefaultSceneOutOfRange:String, DocumentCodeUnitsLimitExceeded:String, DocumentSeparatorUnsupported:String, DuplicateAmbientLight:String, DuplicateDirectionalLight:String, DuplicateKey:String, ExpectedFlowDelimiter:String, ExpectedMappingEntry:String, ExpectedMappingKey:String, ExpectedScalar:String, ExpectedValue:String, FieldInvalid:String, FlowSequenceUnsupported:String, InvalidDocument:String, InvalidEscape:String, InteractiveStateExtensionKindDuplicate:String, InteractiveStateExtensionKindUnregistered:String, InteractiveStateTargetUnsupported:String, InteractiveStateTransitionKindUnregistered:String, KeyCodeUnitsLimitExceeded:String, LayoutTargetAmbiguous:String, LayoutTargetUnresolved:String, MixedCollection:String, MultipleRootValues:String, NestingDepthLimitExceeded:String, NodeKindUnregistered:String, NumberOutOfRange:String, ResourceKindUnregistered:String, ResourceResolverUnregistered:String, ResourceUnresolved:String, RootIndentation:String, RootKindMismatch:String, ScalarCodeUnitsLimitExceeded:String, ScalarInvalid:String, ShapeCommandUnregistered:String, ScenesEmpty:String, StructureInvalid:String, TabCharacter:String, TagUnsupported:String, TokenKeyDuplicate:String, TokenKeyInvalid:String, TokenKindMismatch:String, TokenModeInvalid:String, TokenModeUnresolved:String, TokenReferenceCycle:String, TokenReferenceInvalid:String, TokenResolverUnregistered:String, TokenUnresolved:String, TokenValueInvalid:String, TotalNodesLimitExceeded:String, TrailingFlowComma:String, TrailingFlowContent:String, UnexpectedIndentation:String, UnexpectedToken:String, UnterminatedFlowMapping:String, UnterminatedQuotedScalar:String, VersionUnsupported:String }):{ AliasUnsupported:String, AnchorUnsupported:String, BlockScalarUnsupported:String, CollectionEntriesLimitExceeded:String, DefaultSceneOutOfRange:String, DocumentCodeUnitsLimitExceeded:String, DocumentSeparatorUnsupported:String, DuplicateAmbientLight:String, DuplicateDirectionalLight:String, DuplicateKey:String, ExpectedFlowDelimiter:String, ExpectedMappingEntry:String, ExpectedMappingKey:String, ExpectedScalar:String, ExpectedValue:String, FieldInvalid:String, FlowSequenceUnsupported:String, InvalidDocument:String, InvalidEscape:String, InteractiveStateExtensionKindDuplicate:String, InteractiveStateExtensionKindUnregistered:String, InteractiveStateTargetUnsupported:String, InteractiveStateTransitionKindUnregistered:String, KeyCodeUnitsLimitExceeded:String, LayoutTargetAmbiguous:String, LayoutTargetUnresolved:String, MixedCollection:String, MultipleRootValues:String, NestingDepthLimitExceeded:String, NodeKindUnregistered:String, NumberOutOfRange:String, ResourceKindUnregistered:String, ResourceResolverUnregistered:String, ResourceUnresolved:String, RootIndentation:String, RootKindMismatch:String, ScalarCodeUnitsLimitExceeded:String, ScalarInvalid:String, ShapeCommandUnregistered:String, ScenesEmpty:String, StructureInvalid:String, TabCharacter:String, TagUnsupported:String, TokenKeyDuplicate:String, TokenKeyInvalid:String, TokenKindMismatch:String, TokenModeInvalid:String, TokenModeUnresolved:String, TokenReferenceCycle:String, TokenReferenceInvalid:String, TokenResolverUnregistered:String, TokenUnresolved:String, TokenValueInvalid:String, TotalNodesLimitExceeded:String, TrailingFlowComma:String, TrailingFlowContent:String, UnexpectedIndentation:String, UnexpectedToken:String, UnterminatedFlowMapping:String, UnterminatedQuotedScalar:String, VersionUnsupported:String } return flight._cpp._attempt.Attempt_Types_FlightDocumentRefusalReason.FlightDocumentRefusalReason = value;

var FogModifierKind(get, set):String;

private extern inline function get_FogModifierKind():String return flight._cpp._attempt.Attempt_Types_FogModifierKind.FogModifierKind;

private extern inline function set_FogModifierKind(value:String):String return flight._cpp._attempt.Attempt_Types_FogModifierKind.FogModifierKind = value;

var FogModifierMode(get, set):{ Exponential:String, Exponential2:String, Linear:String };

private extern inline function get_FogModifierMode():{ Exponential:String, Exponential2:String, Linear:String } return flight._cpp._attempt.Attempt_Types_FogModifierMode.FogModifierMode;

private extern inline function set_FogModifierMode(value:{ Exponential:String, Exponential2:String, Linear:String }):{ Exponential:String, Exponential2:String, Linear:String } return flight._cpp._attempt.Attempt_Types_FogModifierMode.FogModifierMode = value;

var FontVariationItalic(get, set):String;

private extern inline function get_FontVariationItalic():String return flight._cpp._attempt.Attempt_Types_FontVariationItalic.FontVariationItalic;

private extern inline function set_FontVariationItalic(value:String):String return flight._cpp._attempt.Attempt_Types_FontVariationItalic.FontVariationItalic = value;

var FontVariationOpticalSize(get, set):String;

private extern inline function get_FontVariationOpticalSize():String return flight._cpp._attempt.Attempt_Types_FontVariationOpticalSize.FontVariationOpticalSize;

private extern inline function set_FontVariationOpticalSize(value:String):String return flight._cpp._attempt.Attempt_Types_FontVariationOpticalSize.FontVariationOpticalSize = value;

var FontVariationSlant(get, set):String;

private extern inline function get_FontVariationSlant():String return flight._cpp._attempt.Attempt_Types_FontVariationSlant.FontVariationSlant;

private extern inline function set_FontVariationSlant(value:String):String return flight._cpp._attempt.Attempt_Types_FontVariationSlant.FontVariationSlant = value;

var FontVariationWeight(get, set):String;

private extern inline function get_FontVariationWeight():String return flight._cpp._attempt.Attempt_Types_FontVariationWeight.FontVariationWeight;

private extern inline function set_FontVariationWeight(value:String):String return flight._cpp._attempt.Attempt_Types_FontVariationWeight.FontVariationWeight = value;

var FontVariationWidth(get, set):String;

private extern inline function get_FontVariationWidth():String return flight._cpp._attempt.Attempt_Types_FontVariationWidth.FontVariationWidth;

private extern inline function set_FontVariationWidth(value:String):String return flight._cpp._attempt.Attempt_Types_FontVariationWidth.FontVariationWidth = value;

var GamepadAxisKind(get, set):{ STICK_LEFT_X:String, STICK_LEFT_Y:String, STICK_RIGHT_X:String, STICK_RIGHT_Y:String };

private extern inline function get_GamepadAxisKind():{ STICK_LEFT_X:String, STICK_LEFT_Y:String, STICK_RIGHT_X:String, STICK_RIGHT_Y:String } return flight._cpp._attempt.Attempt_Types_GamepadAxisKind.GamepadAxisKind;

private extern inline function set_GamepadAxisKind(value:{ STICK_LEFT_X:String, STICK_LEFT_Y:String, STICK_RIGHT_X:String, STICK_RIGHT_Y:String }):{ STICK_LEFT_X:String, STICK_LEFT_Y:String, STICK_RIGHT_X:String, STICK_RIGHT_Y:String } return flight._cpp._attempt.Attempt_Types_GamepadAxisKind.GamepadAxisKind = value;

var GamepadButtonKind(get, set):{ BUTTON_EAST:String, BUTTON_NORTH:String, BUTTON_SOUTH:String, BUTTON_WEST:String, DPAD_DOWN:String, DPAD_LEFT:String, DPAD_RIGHT:String, DPAD_UP:String, HOME:String, SELECT:String, SHOULDER_LEFT:String, SHOULDER_RIGHT:String, START:String, STICK_LEFT:String, STICK_RIGHT:String, TOUCHPAD:String, TRIGGER_LEFT:String, TRIGGER_RIGHT:String };

private extern inline function get_GamepadButtonKind():{ BUTTON_EAST:String, BUTTON_NORTH:String, BUTTON_SOUTH:String, BUTTON_WEST:String, DPAD_DOWN:String, DPAD_LEFT:String, DPAD_RIGHT:String, DPAD_UP:String, HOME:String, SELECT:String, SHOULDER_LEFT:String, SHOULDER_RIGHT:String, START:String, STICK_LEFT:String, STICK_RIGHT:String, TOUCHPAD:String, TRIGGER_LEFT:String, TRIGGER_RIGHT:String } return flight._cpp._attempt.Attempt_Types_GamepadButtonKind.GamepadButtonKind;

private extern inline function set_GamepadButtonKind(value:{ BUTTON_EAST:String, BUTTON_NORTH:String, BUTTON_SOUTH:String, BUTTON_WEST:String, DPAD_DOWN:String, DPAD_LEFT:String, DPAD_RIGHT:String, DPAD_UP:String, HOME:String, SELECT:String, SHOULDER_LEFT:String, SHOULDER_RIGHT:String, START:String, STICK_LEFT:String, STICK_RIGHT:String, TOUCHPAD:String, TRIGGER_LEFT:String, TRIGGER_RIGHT:String }):{ BUTTON_EAST:String, BUTTON_NORTH:String, BUTTON_SOUTH:String, BUTTON_WEST:String, DPAD_DOWN:String, DPAD_LEFT:String, DPAD_RIGHT:String, DPAD_UP:String, HOME:String, SELECT:String, SHOULDER_LEFT:String, SHOULDER_RIGHT:String, START:String, STICK_LEFT:String, STICK_RIGHT:String, TOUCHPAD:String, TRIGGER_LEFT:String, TRIGGER_RIGHT:String } return flight._cpp._attempt.Attempt_Types_GamepadButtonKind.GamepadButtonKind = value;

var GridLayoutKind(get, set):String;

private extern inline function get_GridLayoutKind():String return flight._cpp._attempt.Attempt_Types_GridLayoutKind.GridLayoutKind;

private extern inline function set_GridLayoutKind(value:String):String return flight._cpp._attempt.Attempt_Types_GridLayoutKind.GridLayoutKind = value;

var GroupKind(get, set):String;

private extern inline function get_GroupKind():String return flight._cpp._attempt.Attempt_Types_GroupKind.GroupKind;

private extern inline function set_GroupKind(value:String):String return flight._cpp._attempt.Attempt_Types_GroupKind.GroupKind = value;

var HemisphereLightKind(get, set):String;

private extern inline function get_HemisphereLightKind():String return flight._cpp._attempt.Attempt_Types_HemisphereLightKind.HemisphereLightKind;

private extern inline function set_HemisphereLightKind(value:String):String return flight._cpp._attempt.Attempt_Types_HemisphereLightKind.HemisphereLightKind = value;

var HtmlViewKind(get, set):String;

private extern inline function get_HtmlViewKind():String return flight._cpp._attempt.Attempt_Types_HtmlViewKind.HtmlViewKind;

private extern inline function set_HtmlViewKind(value:String):String return flight._cpp._attempt.Attempt_Types_HtmlViewKind.HtmlViewKind = value;

var ImageChannel(get, set):{ Red:Float, Green:Float, Blue:Float, Alpha:Float };

private extern inline function get_ImageChannel():{ Red:Float, Green:Float, Blue:Float, Alpha:Float } return flight._cpp._attempt.Attempt_Types_ImageChannel.ImageChannel;

private extern inline function set_ImageChannel(value:{ Red:Float, Green:Float, Blue:Float, Alpha:Float }):{ Red:Float, Green:Float, Blue:Float, Alpha:Float } return flight._cpp._attempt.Attempt_Types_ImageChannel.ImageChannel = value;

var ImageResourceFailureKind(get, set):{ Error:String, Unavailable:String };

private extern inline function get_ImageResourceFailureKind():{ Error:String, Unavailable:String } return flight._cpp._attempt.Attempt_Types_ImageResourceFailureKind.ImageResourceFailureKind;

private extern inline function set_ImageResourceFailureKind(value:{ Error:String, Unavailable:String }):{ Error:String, Unavailable:String } return flight._cpp._attempt.Attempt_Types_ImageResourceFailureKind.ImageResourceFailureKind = value;

var ImageResourceReferenceKind(get, set):{ Embedded:String, External:String };

private extern inline function get_ImageResourceReferenceKind():{ Embedded:String, External:String } return flight._cpp._attempt.Attempt_Types_ImageResourceReferenceKind.ImageResourceReferenceKind;

private extern inline function set_ImageResourceReferenceKind(value:{ Embedded:String, External:String }):{ Embedded:String, External:String } return flight._cpp._attempt.Attempt_Types_ImageResourceReferenceKind.ImageResourceReferenceKind = value;

var ImageTextureSourceKind(get, set):String;

private extern inline function get_ImageTextureSourceKind():String return flight._cpp._attempt.Attempt_Types_ImageTextureSourceKind.ImageTextureSourceKind;

private extern inline function set_ImageTextureSourceKind(value:String):String return flight._cpp._attempt.Attempt_Types_ImageTextureSourceKind.ImageTextureSourceKind = value;

var ImportDiagnosticSeverity(get, set):{ Drop:String, Recover:String, Reject:String, Skip:String };

private extern inline function get_ImportDiagnosticSeverity():{ Drop:String, Recover:String, Reject:String, Skip:String } return flight._cpp._attempt.Attempt_Types_ImportDiagnosticSeverity.ImportDiagnosticSeverity;

private extern inline function set_ImportDiagnosticSeverity(value:{ Drop:String, Recover:String, Reject:String, Skip:String }):{ Drop:String, Recover:String, Reject:String, Skip:String } return flight._cpp._attempt.Attempt_Types_ImportDiagnosticSeverity.ImportDiagnosticSeverity = value;

var InstancedMeshKind(get, set):String;

private extern inline function get_InstancedMeshKind():String return flight._cpp._attempt.Attempt_Types_InstancedMeshKind.InstancedMeshKind;

private extern inline function set_InstancedMeshKind(value:String):String return flight._cpp._attempt.Attempt_Types_InstancedMeshKind.InstancedMeshKind = value;

var IridescencePbrExtensionKind(get, set):String;

private extern inline function get_IridescencePbrExtensionKind():String return flight._cpp._attempt.Attempt_Types_IridescencePbrExtensionKind.IridescencePbrExtensionKind;

private extern inline function set_IridescencePbrExtensionKind(value:String):String return flight._cpp._attempt.Attempt_Types_IridescencePbrExtensionKind.IridescencePbrExtensionKind = value;

var KeyCode(get, set):{ A:Float, AGAIN:Float, ALT_ERASE:Float, AMPERSAND:Float, APPLICATION:Float, APP_CONTROL_BACK:Float, APP_CONTROL_BOOKMARKS:Float, APP_CONTROL_FORWARD:Float, APP_CONTROL_HOME:Float, APP_CONTROL_REFRESH:Float, APP_CONTROL_SEARCH:Float, APP_CONTROL_STOP:Float, ASTERISK:Float, AT:Float, AUDIO_MUTE:Float, AUDIO_NEXT:Float, AUDIO_PLAY:Float, AUDIO_PREVIOUS:Float, AUDIO_STOP:Float, B:Float, BACKLIGHT_DOWN:Float, BACKLIGHT_TOGGLE:Float, BACKLIGHT_UP:Float, BACKSLASH:Float, BACKSPACE:Float, BRIGHTNESS_DOWN:Float, BRIGHTNESS_UP:Float, C:Float, CALCULATOR:Float, CANCEL:Float, CAPS_LOCK:Float, CARET:Float, CLEAR:Float, CLEAR_AGAIN:Float, COLON:Float, COMMA:Float, COMPUTER:Float, COPY:Float, CRSEL:Float, CURRENCY_SUBUNIT:Float, CURRENCY_UNIT:Float, CUT:Float, D:Float, DECIMAL_SEPARATOR:Float, DELETE:Float, DISPLAY_SWITCH:Float, DOLLAR:Float, DOWN:Float, E:Float, EJECT:Float, END:Float, EQUALS:Float, ESCAPE:Float, EXCLAMATION:Float, EXECUTE:Float, EXSEL:Float, F:Float, F1:Float, F2:Float, F3:Float, F4:Float, F5:Float, F6:Float, F7:Float, F8:Float, F9:Float, F10:Float, F11:Float, F12:Float, F13:Float, F14:Float, F15:Float, F16:Float, F17:Float, F18:Float, F19:Float, F20:Float, F21:Float, F22:Float, F23:Float, F24:Float, FIND:Float, G:Float, GRAVE:Float, GREATER_THAN:Float, H:Float, HASH:Float, HELP:Float, HOME:Float, I:Float, INSERT:Float, J:Float, K:Float, L:Float, LEFT:Float, LEFT_ALT:Float, LEFT_BRACKET:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_PARENTHESIS:Float, LEFT_SHIFT:Float, LESS_THAN:Float, M:Float, MAIL:Float, MEDIA_SELECT:Float, MENU:Float, MINUS:Float, MODE:Float, MUTE:Float, N:Float, NUMPAD_0:Float, NUMPAD_00:Float, NUMPAD_000:Float, NUMPAD_1:Float, NUMPAD_2:Float, NUMPAD_3:Float, NUMPAD_4:Float, NUMPAD_5:Float, NUMPAD_6:Float, NUMPAD_7:Float, NUMPAD_8:Float, NUMPAD_9:Float, NUMPAD_A:Float, NUMPAD_AMPERSAND:Float, NUMPAD_AT:Float, NUMPAD_B:Float, NUMPAD_BACKSPACE:Float, NUMPAD_BINARY:Float, NUMPAD_C:Float, NUMPAD_CLEAR:Float, NUMPAD_CLEAR_ENTRY:Float, NUMPAD_COLON:Float, NUMPAD_COMMA:Float, NUMPAD_D:Float, NUMPAD_DECIMAL:Float, NUMPAD_DIVIDE:Float, NUMPAD_DOUBLE_AMPERSAND:Float, NUMPAD_DOUBLE_VERTICAL_BAR:Float, NUMPAD_E:Float, NUMPAD_ENTER:Float, NUMPAD_EQUALS:Float, NUMPAD_EXCLAMATION:Float, NUMPAD_F:Float, NUMPAD_GREATER_THAN:Float, NUMPAD_HASH:Float, NUMPAD_HEXADECIMAL:Float, NUMPAD_LEFT_BRACE:Float, NUMPAD_LEFT_PARENTHESIS:Float, NUMPAD_LESS_THAN:Float, NUMPAD_MEM_ADD:Float, NUMPAD_MEM_CLEAR:Float, NUMPAD_MEM_DIVIDE:Float, NUMPAD_MEM_MULTIPLY:Float, NUMPAD_MEM_RECALL:Float, NUMPAD_MEM_STORE:Float, NUMPAD_MEM_SUBTRACT:Float, NUMPAD_MINUS:Float, NUMPAD_MULTIPLY:Float, NUMPAD_OCTAL:Float, NUMPAD_PERCENT:Float, NUMPAD_PERIOD:Float, NUMPAD_PLUS:Float, NUMPAD_PLUS_MINUS:Float, NUMPAD_POWER:Float, NUMPAD_RIGHT_BRACE:Float, NUMPAD_RIGHT_PARENTHESIS:Float, NUMPAD_SPACE:Float, NUMPAD_TAB:Float, NUMPAD_VERTICAL_BAR:Float, NUMPAD_XOR:Float, NUM_LOCK:Float, NUMBER_0:Float, NUMBER_1:Float, NUMBER_2:Float, NUMBER_3:Float, NUMBER_4:Float, NUMBER_5:Float, NUMBER_6:Float, NUMBER_7:Float, NUMBER_8:Float, NUMBER_9:Float, O:Float, OPER:Float, OUT:Float, P:Float, PAGE_DOWN:Float, PAGE_UP:Float, PASTE:Float, PAUSE:Float, PERCENT:Float, PERIOD:Float, PLUS:Float, POWER:Float, PRINT_SCREEN:Float, PRIOR:Float, Q:Float, QUESTION:Float, QUOTE:Float, R:Float, RETURN:Float, RETURN2:Float, RIGHT:Float, RIGHT_ALT:Float, RIGHT_BRACKET:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_PARENTHESIS:Float, RIGHT_SHIFT:Float, S:Float, SCROLL_LOCK:Float, SELECT:Float, SEMICOLON:Float, SEPARATOR:Float, SINGLE_QUOTE:Float, SLASH:Float, SLEEP:Float, SPACE:Float, STOP:Float, SYSTEM_REQUEST:Float, T:Float, TAB:Float, THOUSAND_SEPARATOR:Float, U:Float, UNDO:Float, UNDERSCORE:Float, UNKNOWN:Float, UP:Float, V:Float, VOLUME_DOWN:Float, VOLUME_UP:Float, W:Float, WWW:Float, X:Float, Y:Float, Z:Float };

private extern inline function get_KeyCode():{ A:Float, AGAIN:Float, ALT_ERASE:Float, AMPERSAND:Float, APPLICATION:Float, APP_CONTROL_BACK:Float, APP_CONTROL_BOOKMARKS:Float, APP_CONTROL_FORWARD:Float, APP_CONTROL_HOME:Float, APP_CONTROL_REFRESH:Float, APP_CONTROL_SEARCH:Float, APP_CONTROL_STOP:Float, ASTERISK:Float, AT:Float, AUDIO_MUTE:Float, AUDIO_NEXT:Float, AUDIO_PLAY:Float, AUDIO_PREVIOUS:Float, AUDIO_STOP:Float, B:Float, BACKLIGHT_DOWN:Float, BACKLIGHT_TOGGLE:Float, BACKLIGHT_UP:Float, BACKSLASH:Float, BACKSPACE:Float, BRIGHTNESS_DOWN:Float, BRIGHTNESS_UP:Float, C:Float, CALCULATOR:Float, CANCEL:Float, CAPS_LOCK:Float, CARET:Float, CLEAR:Float, CLEAR_AGAIN:Float, COLON:Float, COMMA:Float, COMPUTER:Float, COPY:Float, CRSEL:Float, CURRENCY_SUBUNIT:Float, CURRENCY_UNIT:Float, CUT:Float, D:Float, DECIMAL_SEPARATOR:Float, DELETE:Float, DISPLAY_SWITCH:Float, DOLLAR:Float, DOWN:Float, E:Float, EJECT:Float, END:Float, EQUALS:Float, ESCAPE:Float, EXCLAMATION:Float, EXECUTE:Float, EXSEL:Float, F:Float, F1:Float, F2:Float, F3:Float, F4:Float, F5:Float, F6:Float, F7:Float, F8:Float, F9:Float, F10:Float, F11:Float, F12:Float, F13:Float, F14:Float, F15:Float, F16:Float, F17:Float, F18:Float, F19:Float, F20:Float, F21:Float, F22:Float, F23:Float, F24:Float, FIND:Float, G:Float, GRAVE:Float, GREATER_THAN:Float, H:Float, HASH:Float, HELP:Float, HOME:Float, I:Float, INSERT:Float, J:Float, K:Float, L:Float, LEFT:Float, LEFT_ALT:Float, LEFT_BRACKET:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_PARENTHESIS:Float, LEFT_SHIFT:Float, LESS_THAN:Float, M:Float, MAIL:Float, MEDIA_SELECT:Float, MENU:Float, MINUS:Float, MODE:Float, MUTE:Float, N:Float, NUMPAD_0:Float, NUMPAD_00:Float, NUMPAD_000:Float, NUMPAD_1:Float, NUMPAD_2:Float, NUMPAD_3:Float, NUMPAD_4:Float, NUMPAD_5:Float, NUMPAD_6:Float, NUMPAD_7:Float, NUMPAD_8:Float, NUMPAD_9:Float, NUMPAD_A:Float, NUMPAD_AMPERSAND:Float, NUMPAD_AT:Float, NUMPAD_B:Float, NUMPAD_BACKSPACE:Float, NUMPAD_BINARY:Float, NUMPAD_C:Float, NUMPAD_CLEAR:Float, NUMPAD_CLEAR_ENTRY:Float, NUMPAD_COLON:Float, NUMPAD_COMMA:Float, NUMPAD_D:Float, NUMPAD_DECIMAL:Float, NUMPAD_DIVIDE:Float, NUMPAD_DOUBLE_AMPERSAND:Float, NUMPAD_DOUBLE_VERTICAL_BAR:Float, NUMPAD_E:Float, NUMPAD_ENTER:Float, NUMPAD_EQUALS:Float, NUMPAD_EXCLAMATION:Float, NUMPAD_F:Float, NUMPAD_GREATER_THAN:Float, NUMPAD_HASH:Float, NUMPAD_HEXADECIMAL:Float, NUMPAD_LEFT_BRACE:Float, NUMPAD_LEFT_PARENTHESIS:Float, NUMPAD_LESS_THAN:Float, NUMPAD_MEM_ADD:Float, NUMPAD_MEM_CLEAR:Float, NUMPAD_MEM_DIVIDE:Float, NUMPAD_MEM_MULTIPLY:Float, NUMPAD_MEM_RECALL:Float, NUMPAD_MEM_STORE:Float, NUMPAD_MEM_SUBTRACT:Float, NUMPAD_MINUS:Float, NUMPAD_MULTIPLY:Float, NUMPAD_OCTAL:Float, NUMPAD_PERCENT:Float, NUMPAD_PERIOD:Float, NUMPAD_PLUS:Float, NUMPAD_PLUS_MINUS:Float, NUMPAD_POWER:Float, NUMPAD_RIGHT_BRACE:Float, NUMPAD_RIGHT_PARENTHESIS:Float, NUMPAD_SPACE:Float, NUMPAD_TAB:Float, NUMPAD_VERTICAL_BAR:Float, NUMPAD_XOR:Float, NUM_LOCK:Float, NUMBER_0:Float, NUMBER_1:Float, NUMBER_2:Float, NUMBER_3:Float, NUMBER_4:Float, NUMBER_5:Float, NUMBER_6:Float, NUMBER_7:Float, NUMBER_8:Float, NUMBER_9:Float, O:Float, OPER:Float, OUT:Float, P:Float, PAGE_DOWN:Float, PAGE_UP:Float, PASTE:Float, PAUSE:Float, PERCENT:Float, PERIOD:Float, PLUS:Float, POWER:Float, PRINT_SCREEN:Float, PRIOR:Float, Q:Float, QUESTION:Float, QUOTE:Float, R:Float, RETURN:Float, RETURN2:Float, RIGHT:Float, RIGHT_ALT:Float, RIGHT_BRACKET:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_PARENTHESIS:Float, RIGHT_SHIFT:Float, S:Float, SCROLL_LOCK:Float, SELECT:Float, SEMICOLON:Float, SEPARATOR:Float, SINGLE_QUOTE:Float, SLASH:Float, SLEEP:Float, SPACE:Float, STOP:Float, SYSTEM_REQUEST:Float, T:Float, TAB:Float, THOUSAND_SEPARATOR:Float, U:Float, UNDO:Float, UNDERSCORE:Float, UNKNOWN:Float, UP:Float, V:Float, VOLUME_DOWN:Float, VOLUME_UP:Float, W:Float, WWW:Float, X:Float, Y:Float, Z:Float } return flight._cpp._attempt.Attempt_Types_KeyCode.KeyCode;

private extern inline function set_KeyCode(value:{ A:Float, AGAIN:Float, ALT_ERASE:Float, AMPERSAND:Float, APPLICATION:Float, APP_CONTROL_BACK:Float, APP_CONTROL_BOOKMARKS:Float, APP_CONTROL_FORWARD:Float, APP_CONTROL_HOME:Float, APP_CONTROL_REFRESH:Float, APP_CONTROL_SEARCH:Float, APP_CONTROL_STOP:Float, ASTERISK:Float, AT:Float, AUDIO_MUTE:Float, AUDIO_NEXT:Float, AUDIO_PLAY:Float, AUDIO_PREVIOUS:Float, AUDIO_STOP:Float, B:Float, BACKLIGHT_DOWN:Float, BACKLIGHT_TOGGLE:Float, BACKLIGHT_UP:Float, BACKSLASH:Float, BACKSPACE:Float, BRIGHTNESS_DOWN:Float, BRIGHTNESS_UP:Float, C:Float, CALCULATOR:Float, CANCEL:Float, CAPS_LOCK:Float, CARET:Float, CLEAR:Float, CLEAR_AGAIN:Float, COLON:Float, COMMA:Float, COMPUTER:Float, COPY:Float, CRSEL:Float, CURRENCY_SUBUNIT:Float, CURRENCY_UNIT:Float, CUT:Float, D:Float, DECIMAL_SEPARATOR:Float, DELETE:Float, DISPLAY_SWITCH:Float, DOLLAR:Float, DOWN:Float, E:Float, EJECT:Float, END:Float, EQUALS:Float, ESCAPE:Float, EXCLAMATION:Float, EXECUTE:Float, EXSEL:Float, F:Float, F1:Float, F2:Float, F3:Float, F4:Float, F5:Float, F6:Float, F7:Float, F8:Float, F9:Float, F10:Float, F11:Float, F12:Float, F13:Float, F14:Float, F15:Float, F16:Float, F17:Float, F18:Float, F19:Float, F20:Float, F21:Float, F22:Float, F23:Float, F24:Float, FIND:Float, G:Float, GRAVE:Float, GREATER_THAN:Float, H:Float, HASH:Float, HELP:Float, HOME:Float, I:Float, INSERT:Float, J:Float, K:Float, L:Float, LEFT:Float, LEFT_ALT:Float, LEFT_BRACKET:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_PARENTHESIS:Float, LEFT_SHIFT:Float, LESS_THAN:Float, M:Float, MAIL:Float, MEDIA_SELECT:Float, MENU:Float, MINUS:Float, MODE:Float, MUTE:Float, N:Float, NUMPAD_0:Float, NUMPAD_00:Float, NUMPAD_000:Float, NUMPAD_1:Float, NUMPAD_2:Float, NUMPAD_3:Float, NUMPAD_4:Float, NUMPAD_5:Float, NUMPAD_6:Float, NUMPAD_7:Float, NUMPAD_8:Float, NUMPAD_9:Float, NUMPAD_A:Float, NUMPAD_AMPERSAND:Float, NUMPAD_AT:Float, NUMPAD_B:Float, NUMPAD_BACKSPACE:Float, NUMPAD_BINARY:Float, NUMPAD_C:Float, NUMPAD_CLEAR:Float, NUMPAD_CLEAR_ENTRY:Float, NUMPAD_COLON:Float, NUMPAD_COMMA:Float, NUMPAD_D:Float, NUMPAD_DECIMAL:Float, NUMPAD_DIVIDE:Float, NUMPAD_DOUBLE_AMPERSAND:Float, NUMPAD_DOUBLE_VERTICAL_BAR:Float, NUMPAD_E:Float, NUMPAD_ENTER:Float, NUMPAD_EQUALS:Float, NUMPAD_EXCLAMATION:Float, NUMPAD_F:Float, NUMPAD_GREATER_THAN:Float, NUMPAD_HASH:Float, NUMPAD_HEXADECIMAL:Float, NUMPAD_LEFT_BRACE:Float, NUMPAD_LEFT_PARENTHESIS:Float, NUMPAD_LESS_THAN:Float, NUMPAD_MEM_ADD:Float, NUMPAD_MEM_CLEAR:Float, NUMPAD_MEM_DIVIDE:Float, NUMPAD_MEM_MULTIPLY:Float, NUMPAD_MEM_RECALL:Float, NUMPAD_MEM_STORE:Float, NUMPAD_MEM_SUBTRACT:Float, NUMPAD_MINUS:Float, NUMPAD_MULTIPLY:Float, NUMPAD_OCTAL:Float, NUMPAD_PERCENT:Float, NUMPAD_PERIOD:Float, NUMPAD_PLUS:Float, NUMPAD_PLUS_MINUS:Float, NUMPAD_POWER:Float, NUMPAD_RIGHT_BRACE:Float, NUMPAD_RIGHT_PARENTHESIS:Float, NUMPAD_SPACE:Float, NUMPAD_TAB:Float, NUMPAD_VERTICAL_BAR:Float, NUMPAD_XOR:Float, NUM_LOCK:Float, NUMBER_0:Float, NUMBER_1:Float, NUMBER_2:Float, NUMBER_3:Float, NUMBER_4:Float, NUMBER_5:Float, NUMBER_6:Float, NUMBER_7:Float, NUMBER_8:Float, NUMBER_9:Float, O:Float, OPER:Float, OUT:Float, P:Float, PAGE_DOWN:Float, PAGE_UP:Float, PASTE:Float, PAUSE:Float, PERCENT:Float, PERIOD:Float, PLUS:Float, POWER:Float, PRINT_SCREEN:Float, PRIOR:Float, Q:Float, QUESTION:Float, QUOTE:Float, R:Float, RETURN:Float, RETURN2:Float, RIGHT:Float, RIGHT_ALT:Float, RIGHT_BRACKET:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_PARENTHESIS:Float, RIGHT_SHIFT:Float, S:Float, SCROLL_LOCK:Float, SELECT:Float, SEMICOLON:Float, SEPARATOR:Float, SINGLE_QUOTE:Float, SLASH:Float, SLEEP:Float, SPACE:Float, STOP:Float, SYSTEM_REQUEST:Float, T:Float, TAB:Float, THOUSAND_SEPARATOR:Float, U:Float, UNDO:Float, UNDERSCORE:Float, UNKNOWN:Float, UP:Float, V:Float, VOLUME_DOWN:Float, VOLUME_UP:Float, W:Float, WWW:Float, X:Float, Y:Float, Z:Float }):{ A:Float, AGAIN:Float, ALT_ERASE:Float, AMPERSAND:Float, APPLICATION:Float, APP_CONTROL_BACK:Float, APP_CONTROL_BOOKMARKS:Float, APP_CONTROL_FORWARD:Float, APP_CONTROL_HOME:Float, APP_CONTROL_REFRESH:Float, APP_CONTROL_SEARCH:Float, APP_CONTROL_STOP:Float, ASTERISK:Float, AT:Float, AUDIO_MUTE:Float, AUDIO_NEXT:Float, AUDIO_PLAY:Float, AUDIO_PREVIOUS:Float, AUDIO_STOP:Float, B:Float, BACKLIGHT_DOWN:Float, BACKLIGHT_TOGGLE:Float, BACKLIGHT_UP:Float, BACKSLASH:Float, BACKSPACE:Float, BRIGHTNESS_DOWN:Float, BRIGHTNESS_UP:Float, C:Float, CALCULATOR:Float, CANCEL:Float, CAPS_LOCK:Float, CARET:Float, CLEAR:Float, CLEAR_AGAIN:Float, COLON:Float, COMMA:Float, COMPUTER:Float, COPY:Float, CRSEL:Float, CURRENCY_SUBUNIT:Float, CURRENCY_UNIT:Float, CUT:Float, D:Float, DECIMAL_SEPARATOR:Float, DELETE:Float, DISPLAY_SWITCH:Float, DOLLAR:Float, DOWN:Float, E:Float, EJECT:Float, END:Float, EQUALS:Float, ESCAPE:Float, EXCLAMATION:Float, EXECUTE:Float, EXSEL:Float, F:Float, F1:Float, F2:Float, F3:Float, F4:Float, F5:Float, F6:Float, F7:Float, F8:Float, F9:Float, F10:Float, F11:Float, F12:Float, F13:Float, F14:Float, F15:Float, F16:Float, F17:Float, F18:Float, F19:Float, F20:Float, F21:Float, F22:Float, F23:Float, F24:Float, FIND:Float, G:Float, GRAVE:Float, GREATER_THAN:Float, H:Float, HASH:Float, HELP:Float, HOME:Float, I:Float, INSERT:Float, J:Float, K:Float, L:Float, LEFT:Float, LEFT_ALT:Float, LEFT_BRACKET:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_PARENTHESIS:Float, LEFT_SHIFT:Float, LESS_THAN:Float, M:Float, MAIL:Float, MEDIA_SELECT:Float, MENU:Float, MINUS:Float, MODE:Float, MUTE:Float, N:Float, NUMPAD_0:Float, NUMPAD_00:Float, NUMPAD_000:Float, NUMPAD_1:Float, NUMPAD_2:Float, NUMPAD_3:Float, NUMPAD_4:Float, NUMPAD_5:Float, NUMPAD_6:Float, NUMPAD_7:Float, NUMPAD_8:Float, NUMPAD_9:Float, NUMPAD_A:Float, NUMPAD_AMPERSAND:Float, NUMPAD_AT:Float, NUMPAD_B:Float, NUMPAD_BACKSPACE:Float, NUMPAD_BINARY:Float, NUMPAD_C:Float, NUMPAD_CLEAR:Float, NUMPAD_CLEAR_ENTRY:Float, NUMPAD_COLON:Float, NUMPAD_COMMA:Float, NUMPAD_D:Float, NUMPAD_DECIMAL:Float, NUMPAD_DIVIDE:Float, NUMPAD_DOUBLE_AMPERSAND:Float, NUMPAD_DOUBLE_VERTICAL_BAR:Float, NUMPAD_E:Float, NUMPAD_ENTER:Float, NUMPAD_EQUALS:Float, NUMPAD_EXCLAMATION:Float, NUMPAD_F:Float, NUMPAD_GREATER_THAN:Float, NUMPAD_HASH:Float, NUMPAD_HEXADECIMAL:Float, NUMPAD_LEFT_BRACE:Float, NUMPAD_LEFT_PARENTHESIS:Float, NUMPAD_LESS_THAN:Float, NUMPAD_MEM_ADD:Float, NUMPAD_MEM_CLEAR:Float, NUMPAD_MEM_DIVIDE:Float, NUMPAD_MEM_MULTIPLY:Float, NUMPAD_MEM_RECALL:Float, NUMPAD_MEM_STORE:Float, NUMPAD_MEM_SUBTRACT:Float, NUMPAD_MINUS:Float, NUMPAD_MULTIPLY:Float, NUMPAD_OCTAL:Float, NUMPAD_PERCENT:Float, NUMPAD_PERIOD:Float, NUMPAD_PLUS:Float, NUMPAD_PLUS_MINUS:Float, NUMPAD_POWER:Float, NUMPAD_RIGHT_BRACE:Float, NUMPAD_RIGHT_PARENTHESIS:Float, NUMPAD_SPACE:Float, NUMPAD_TAB:Float, NUMPAD_VERTICAL_BAR:Float, NUMPAD_XOR:Float, NUM_LOCK:Float, NUMBER_0:Float, NUMBER_1:Float, NUMBER_2:Float, NUMBER_3:Float, NUMBER_4:Float, NUMBER_5:Float, NUMBER_6:Float, NUMBER_7:Float, NUMBER_8:Float, NUMBER_9:Float, O:Float, OPER:Float, OUT:Float, P:Float, PAGE_DOWN:Float, PAGE_UP:Float, PASTE:Float, PAUSE:Float, PERCENT:Float, PERIOD:Float, PLUS:Float, POWER:Float, PRINT_SCREEN:Float, PRIOR:Float, Q:Float, QUESTION:Float, QUOTE:Float, R:Float, RETURN:Float, RETURN2:Float, RIGHT:Float, RIGHT_ALT:Float, RIGHT_BRACKET:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_PARENTHESIS:Float, RIGHT_SHIFT:Float, S:Float, SCROLL_LOCK:Float, SELECT:Float, SEMICOLON:Float, SEPARATOR:Float, SINGLE_QUOTE:Float, SLASH:Float, SLEEP:Float, SPACE:Float, STOP:Float, SYSTEM_REQUEST:Float, T:Float, TAB:Float, THOUSAND_SEPARATOR:Float, U:Float, UNDO:Float, UNDERSCORE:Float, UNKNOWN:Float, UP:Float, V:Float, VOLUME_DOWN:Float, VOLUME_UP:Float, W:Float, WWW:Float, X:Float, Y:Float, Z:Float } return flight._cpp._attempt.Attempt_Types_KeyCode.KeyCode = value;

var KeyModifier(get, set):{ ALT:Float, CAPS_LOCK:Float, CTRL:Float, LEFT_ALT:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_SHIFT:Float, META:Float, MODE:Float, NONE:Float, NUM_LOCK:Float, RIGHT_ALT:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_SHIFT:Float, SHIFT:Float };

private extern inline function get_KeyModifier():{ ALT:Float, CAPS_LOCK:Float, CTRL:Float, LEFT_ALT:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_SHIFT:Float, META:Float, MODE:Float, NONE:Float, NUM_LOCK:Float, RIGHT_ALT:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_SHIFT:Float, SHIFT:Float } return flight._cpp._attempt.Attempt_Types_KeyModifier.KeyModifier;

private extern inline function set_KeyModifier(value:{ ALT:Float, CAPS_LOCK:Float, CTRL:Float, LEFT_ALT:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_SHIFT:Float, META:Float, MODE:Float, NONE:Float, NUM_LOCK:Float, RIGHT_ALT:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_SHIFT:Float, SHIFT:Float }):{ ALT:Float, CAPS_LOCK:Float, CTRL:Float, LEFT_ALT:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_SHIFT:Float, META:Float, MODE:Float, NONE:Float, NUM_LOCK:Float, RIGHT_ALT:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_SHIFT:Float, SHIFT:Float } return flight._cpp._attempt.Attempt_Types_KeyModifier.KeyModifier = value;

var LIGHT_PROBE_SH_FLOATS(get, set):Float;

private extern inline function get_LIGHT_PROBE_SH_FLOATS():Float return flight._cpp._attempt.Attempt_Types_LIGHT_PROBE_SH_FLOATS.LIGHT_PROBE_SH_FLOATS;

private extern inline function set_LIGHT_PROBE_SH_FLOATS(value:Float):Float return flight._cpp._attempt.Attempt_Types_LIGHT_PROBE_SH_FLOATS.LIGHT_PROBE_SH_FLOATS = value;

var LambertMaterialKind(get, set):String;

private extern inline function get_LambertMaterialKind():String return flight._cpp._attempt.Attempt_Types_LambertMaterialKind.LambertMaterialKind;

private extern inline function set_LambertMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_LambertMaterialKind.LambertMaterialKind = value;

var LayoutResolutionFailureKind(get, set):{ IntrinsicSizesTooSmall:String, InvalidContainerStyle:String, InvalidHierarchy:String, InvalidItemStyle:String, OutputTooSmall:String, UnregisteredKind:String };

private extern inline function get_LayoutResolutionFailureKind():{ IntrinsicSizesTooSmall:String, InvalidContainerStyle:String, InvalidHierarchy:String, InvalidItemStyle:String, OutputTooSmall:String, UnregisteredKind:String } return flight._cpp._attempt.Attempt_Types_LayoutResolutionFailureKind.LayoutResolutionFailureKind;

private extern inline function set_LayoutResolutionFailureKind(value:{ IntrinsicSizesTooSmall:String, InvalidContainerStyle:String, InvalidHierarchy:String, InvalidItemStyle:String, OutputTooSmall:String, UnregisteredKind:String }):{ IntrinsicSizesTooSmall:String, InvalidContainerStyle:String, InvalidHierarchy:String, InvalidItemStyle:String, OutputTooSmall:String, UnregisteredKind:String } return flight._cpp._attempt.Attempt_Types_LayoutResolutionFailureKind.LayoutResolutionFailureKind = value;

var LibgdxParticleFormatKind(get, set):String;

private extern inline function get_LibgdxParticleFormatKind():String return flight._cpp._attempt.Attempt_Types_LibgdxParticleFormatKind.LibgdxParticleFormatKind;

private extern inline function set_LibgdxParticleFormatKind(value:String):String return flight._cpp._attempt.Attempt_Types_LibgdxParticleFormatKind.LibgdxParticleFormatKind = value;

var LodMeshKind(get, set):String;

private extern inline function get_LodMeshKind():String return flight._cpp._attempt.Attempt_Types_LodMeshKind.LodMeshKind;

private extern inline function set_LodMeshKind(value:String):String return flight._cpp._attempt.Attempt_Types_LodMeshKind.LodMeshKind = value;

var LottieLayerKind(get, set):{ Image:Float, Null:Float, Precomposition:Float, Shape:Float, Solid:Float, Text:Float };

private extern inline function get_LottieLayerKind():{ Image:Float, Null:Float, Precomposition:Float, Shape:Float, Solid:Float, Text:Float } return flight._cpp._attempt.Attempt_Types_LottieLayerKind.LottieLayerKind;

private extern inline function set_LottieLayerKind(value:{ Image:Float, Null:Float, Precomposition:Float, Shape:Float, Solid:Float, Text:Float }):{ Image:Float, Null:Float, Precomposition:Float, Shape:Float, Solid:Float, Text:Float } return flight._cpp._attempt.Attempt_Types_LottieLayerKind.LottieLayerKind = value;

var LottieMaskKind(get, set):{ Additive:String, Darken:String, Difference:String, Intersect:String, Lighten:String, None:String, Subtract:String };

private extern inline function get_LottieMaskKind():{ Additive:String, Darken:String, Difference:String, Intersect:String, Lighten:String, None:String, Subtract:String } return flight._cpp._attempt.Attempt_Types_LottieMaskKind.LottieMaskKind;

private extern inline function set_LottieMaskKind(value:{ Additive:String, Darken:String, Difference:String, Intersect:String, Lighten:String, None:String, Subtract:String }):{ Additive:String, Darken:String, Difference:String, Intersect:String, Lighten:String, None:String, Subtract:String } return flight._cpp._attempt.Attempt_Types_LottieMaskKind.LottieMaskKind = value;

var LottieShapeItemKind(get, set):{ Ellipse:String, Fill:String, GradientFill:String, GradientStroke:String, Path:String, Polystar:String, Rectangle:String, Stroke:String, TrimPath:String };

private extern inline function get_LottieShapeItemKind():{ Ellipse:String, Fill:String, GradientFill:String, GradientStroke:String, Path:String, Polystar:String, Rectangle:String, Stroke:String, TrimPath:String } return flight._cpp._attempt.Attempt_Types_LottieShapeItemKind.LottieShapeItemKind;

private extern inline function set_LottieShapeItemKind(value:{ Ellipse:String, Fill:String, GradientFill:String, GradientStroke:String, Path:String, Polystar:String, Rectangle:String, Stroke:String, TrimPath:String }):{ Ellipse:String, Fill:String, GradientFill:String, GradientStroke:String, Path:String, Polystar:String, Rectangle:String, Stroke:String, TrimPath:String } return flight._cpp._attempt.Attempt_Types_LottieShapeItemKind.LottieShapeItemKind = value;

var LumenLightUnit(get, set):String;

private extern inline function get_LumenLightUnit():String return flight._cpp._attempt.Attempt_Types_LumenLightUnit.LumenLightUnit;

private extern inline function set_LumenLightUnit(value:String):String return flight._cpp._attempt.Attempt_Types_LumenLightUnit.LumenLightUnit = value;

var LuxLightUnit(get, set):String;

private extern inline function get_LuxLightUnit():String return flight._cpp._attempt.Attempt_Types_LuxLightUnit.LuxLightUnit;

private extern inline function set_LuxLightUnit(value:String):String return flight._cpp._attempt.Attempt_Types_LuxLightUnit.LuxLightUnit = value;

var MAX_COLLISION_CONTACT_POINTS_3D(get, set):Float;

private extern inline function get_MAX_COLLISION_CONTACT_POINTS_3D():Float return flight._cpp._attempt.Attempt_Types_MAX_COLLISION_CONTACT_POINTS_3D.MAX_COLLISION_CONTACT_POINTS_3D;

private extern inline function set_MAX_COLLISION_CONTACT_POINTS_3D(value:Float):Float return flight._cpp._attempt.Attempt_Types_MAX_COLLISION_CONTACT_POINTS_3D.MAX_COLLISION_CONTACT_POINTS_3D = value;

var MAX_DIRECTIONAL_SHADOW_PCF_RADIUS(get, set):Float;

private extern inline function get_MAX_DIRECTIONAL_SHADOW_PCF_RADIUS():Float return flight._cpp._attempt.Attempt_Types_MAX_DIRECTIONAL_SHADOW_PCF_RADIUS.MAX_DIRECTIONAL_SHADOW_PCF_RADIUS;

private extern inline function set_MAX_DIRECTIONAL_SHADOW_PCF_RADIUS(value:Float):Float return flight._cpp._attempt.Attempt_Types_MAX_DIRECTIONAL_SHADOW_PCF_RADIUS.MAX_DIRECTIONAL_SHADOW_PCF_RADIUS = value;

var MAX_FORWARD_LIGHTS(get, set):Float;

private extern inline function get_MAX_FORWARD_LIGHTS():Float return flight._cpp._attempt.Attempt_Types_MAX_FORWARD_LIGHTS.MAX_FORWARD_LIGHTS;

private extern inline function set_MAX_FORWARD_LIGHTS(value:Float):Float return flight._cpp._attempt.Attempt_Types_MAX_FORWARD_LIGHTS.MAX_FORWARD_LIGHTS = value;

var MD5_MATERIAL_FEATURE(get, set):String;

private extern inline function get_MD5_MATERIAL_FEATURE():String return flight._cpp._attempt.Attempt_Types_MD5_MATERIAL_FEATURE.MD5_MATERIAL_FEATURE;

private extern inline function set_MD5_MATERIAL_FEATURE(value:String):String return flight._cpp._attempt.Attempt_Types_MD5_MATERIAL_FEATURE.MD5_MATERIAL_FEATURE = value;

var MD5_SKELETON_FEATURE(get, set):String;

private extern inline function get_MD5_SKELETON_FEATURE():String return flight._cpp._attempt.Attempt_Types_MD5_SKELETON_FEATURE.MD5_SKELETON_FEATURE;

private extern inline function set_MD5_SKELETON_FEATURE(value:String):String return flight._cpp._attempt.Attempt_Types_MD5_SKELETON_FEATURE.MD5_SKELETON_FEATURE = value;

var MatcapMaterialKind(get, set):String;

private extern inline function get_MatcapMaterialKind():String return flight._cpp._attempt.Attempt_Types_MatcapMaterialKind.MatcapMaterialKind;

private extern inline function set_MatcapMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_MatcapMaterialKind.MatcapMaterialKind = value;

var MeshAttachment2DKind(get, set):String;

private extern inline function get_MeshAttachment2DKind():String return flight._cpp._attempt.Attempt_Types_MeshAttachment2DKind.MeshAttachment2DKind;

private extern inline function set_MeshAttachment2DKind(value:String):String return flight._cpp._attempt.Attempt_Types_MeshAttachment2DKind.MeshAttachment2DKind = value;

var MeshDeformerMorph(get, set):String;

private extern inline function get_MeshDeformerMorph():String return flight._cpp._attempt.Attempt_Types_MeshDeformerMorph.MeshDeformerMorph;

private extern inline function set_MeshDeformerMorph(value:String):String return flight._cpp._attempt.Attempt_Types_MeshDeformerMorph.MeshDeformerMorph = value;

var MeshDeformerNone(get, set):String;

private extern inline function get_MeshDeformerNone():String return flight._cpp._attempt.Attempt_Types_MeshDeformerNone.MeshDeformerNone;

private extern inline function set_MeshDeformerNone(value:String):String return flight._cpp._attempt.Attempt_Types_MeshDeformerNone.MeshDeformerNone = value;

var MeshDeformerSkeletal(get, set):String;

private extern inline function get_MeshDeformerSkeletal():String return flight._cpp._attempt.Attempt_Types_MeshDeformerSkeletal.MeshDeformerSkeletal;

private extern inline function set_MeshDeformerSkeletal(value:String):String return flight._cpp._attempt.Attempt_Types_MeshDeformerSkeletal.MeshDeformerSkeletal = value;

var MeshKind(get, set):String;

private extern inline function get_MeshKind():String return flight._cpp._attempt.Attempt_Types_MeshKind.MeshKind;

private extern inline function set_MeshKind(value:String):String return flight._cpp._attempt.Attempt_Types_MeshKind.MeshKind = value;

var ModifierSlot(get, set):{ Diffuse:String, Effect:String, Emissive:String, Normal:String, Specular:String, Vertex:String };

private extern inline function get_ModifierSlot():{ Diffuse:String, Effect:String, Emissive:String, Normal:String, Specular:String, Vertex:String } return flight._cpp._attempt.Attempt_Types_ModifierSlot.ModifierSlot;

private extern inline function set_ModifierSlot(value:{ Diffuse:String, Effect:String, Emissive:String, Normal:String, Specular:String, Vertex:String }):{ Diffuse:String, Effect:String, Emissive:String, Normal:String, Specular:String, Vertex:String } return flight._cpp._attempt.Attempt_Types_ModifierSlot.ModifierSlot = value;

var MorphShapeKind(get, set):String;

private extern inline function get_MorphShapeKind():String return flight._cpp._attempt.Attempt_Types_MorphShapeKind.MorphShapeKind;

private extern inline function set_MorphShapeKind(value:String):String return flight._cpp._attempt.Attempt_Types_MorphShapeKind.MorphShapeKind = value;

var MouseButton(get, set):{ LEFT:Float, MIDDLE:Float, RIGHT:Float };

private extern inline function get_MouseButton():{ LEFT:Float, MIDDLE:Float, RIGHT:Float } return flight._cpp._attempt.Attempt_Types_MouseButton.MouseButton;

private extern inline function set_MouseButton(value:{ LEFT:Float, MIDDLE:Float, RIGHT:Float }):{ LEFT:Float, MIDDLE:Float, RIGHT:Float } return flight._cpp._attempt.Attempt_Types_MouseButton.MouseButton = value;

var MovieClipKind(get, set):String;

private extern inline function get_MovieClipKind():String return flight._cpp._attempt.Attempt_Types_MovieClipKind.MovieClipKind;

private extern inline function set_MovieClipKind(value:String):String return flight._cpp._attempt.Attempt_Types_MovieClipKind.MovieClipKind = value;

var NativeTextKind(get, set):String;

private extern inline function get_NativeTextKind():String return flight._cpp._attempt.Attempt_Types_NativeTextKind.NativeTextKind;

private extern inline function set_NativeTextKind(value:String):String return flight._cpp._attempt.Attempt_Types_NativeTextKind.NativeTextKind = value;

var Node2DAnimationPathAlpha(get, set):String;

private extern inline function get_Node2DAnimationPathAlpha():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathAlpha.Node2DAnimationPathAlpha;

private extern inline function set_Node2DAnimationPathAlpha(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathAlpha.Node2DAnimationPathAlpha = value;

var Node2DAnimationPathPivot(get, set):String;

private extern inline function get_Node2DAnimationPathPivot():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathPivot.Node2DAnimationPathPivot;

private extern inline function set_Node2DAnimationPathPivot(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathPivot.Node2DAnimationPathPivot = value;

var Node2DAnimationPathPivotX(get, set):String;

private extern inline function get_Node2DAnimationPathPivotX():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathPivotX.Node2DAnimationPathPivotX;

private extern inline function set_Node2DAnimationPathPivotX(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathPivotX.Node2DAnimationPathPivotX = value;

var Node2DAnimationPathPivotY(get, set):String;

private extern inline function get_Node2DAnimationPathPivotY():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathPivotY.Node2DAnimationPathPivotY;

private extern inline function set_Node2DAnimationPathPivotY(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathPivotY.Node2DAnimationPathPivotY = value;

var Node2DAnimationPathPosition(get, set):String;

private extern inline function get_Node2DAnimationPathPosition():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathPosition.Node2DAnimationPathPosition;

private extern inline function set_Node2DAnimationPathPosition(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathPosition.Node2DAnimationPathPosition = value;

var Node2DAnimationPathRotation(get, set):String;

private extern inline function get_Node2DAnimationPathRotation():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathRotation.Node2DAnimationPathRotation;

private extern inline function set_Node2DAnimationPathRotation(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathRotation.Node2DAnimationPathRotation = value;

var Node2DAnimationPathScale(get, set):String;

private extern inline function get_Node2DAnimationPathScale():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathScale.Node2DAnimationPathScale;

private extern inline function set_Node2DAnimationPathScale(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathScale.Node2DAnimationPathScale = value;

var Node2DAnimationPathScaleX(get, set):String;

private extern inline function get_Node2DAnimationPathScaleX():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathScaleX.Node2DAnimationPathScaleX;

private extern inline function set_Node2DAnimationPathScaleX(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathScaleX.Node2DAnimationPathScaleX = value;

var Node2DAnimationPathScaleY(get, set):String;

private extern inline function get_Node2DAnimationPathScaleY():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathScaleY.Node2DAnimationPathScaleY;

private extern inline function set_Node2DAnimationPathScaleY(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathScaleY.Node2DAnimationPathScaleY = value;

var Node2DAnimationPathSkew(get, set):String;

private extern inline function get_Node2DAnimationPathSkew():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathSkew.Node2DAnimationPathSkew;

private extern inline function set_Node2DAnimationPathSkew(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathSkew.Node2DAnimationPathSkew = value;

var Node2DAnimationPathSkewX(get, set):String;

private extern inline function get_Node2DAnimationPathSkewX():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathSkewX.Node2DAnimationPathSkewX;

private extern inline function set_Node2DAnimationPathSkewX(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathSkewX.Node2DAnimationPathSkewX = value;

var Node2DAnimationPathSkewY(get, set):String;

private extern inline function get_Node2DAnimationPathSkewY():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathSkewY.Node2DAnimationPathSkewY;

private extern inline function set_Node2DAnimationPathSkewY(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathSkewY.Node2DAnimationPathSkewY = value;

var Node2DAnimationPathVisible(get, set):String;

private extern inline function get_Node2DAnimationPathVisible():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathVisible.Node2DAnimationPathVisible;

private extern inline function set_Node2DAnimationPathVisible(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathVisible.Node2DAnimationPathVisible = value;

var Node2DAnimationPathX(get, set):String;

private extern inline function get_Node2DAnimationPathX():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathX.Node2DAnimationPathX;

private extern inline function set_Node2DAnimationPathX(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathX.Node2DAnimationPathX = value;

var Node2DAnimationPathY(get, set):String;

private extern inline function get_Node2DAnimationPathY():String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathY.Node2DAnimationPathY;

private extern inline function set_Node2DAnimationPathY(value:String):String return flight._cpp._attempt.Attempt_Types_Node2DAnimationPathY.Node2DAnimationPathY = value;

var Node2DTraitsKey(get, set):Dynamic;

private extern inline function get_Node2DTraitsKey():Dynamic return flight._cpp._attempt.Attempt_Types_Node2DTraitsKey.Node2DTraitsKey;

private extern inline function set_Node2DTraitsKey(value:Dynamic):Dynamic return flight._cpp._attempt.Attempt_Types_Node2DTraitsKey.Node2DTraitsKey = value;

var Node3DKind(get, set):String;

private extern inline function get_Node3DKind():String return flight._cpp._attempt.Attempt_Types_Node3DKind.Node3DKind;

private extern inline function set_Node3DKind(value:String):String return flight._cpp._attempt.Attempt_Types_Node3DKind.Node3DKind = value;

var Node3DTraitsKey(get, set):Dynamic;

private extern inline function get_Node3DTraitsKey():Dynamic return flight._cpp._attempt.Attempt_Types_Node3DTraitsKey.Node3DTraitsKey;

private extern inline function set_Node3DTraitsKey(value:Dynamic):Dynamic return flight._cpp._attempt.Attempt_Types_Node3DTraitsKey.Node3DTraitsKey = value;

var NodeInteractiveStateRefusalReason(get, set):{ ExtensionCreationFailed:String, ExtensionKindUnregistered:String, ExtensionTargetUnsupported:String, PropertyTargetUnsupported:String, TransitionCreationFailed:String, TransitionKindUnregistered:String };

private extern inline function get_NodeInteractiveStateRefusalReason():{ ExtensionCreationFailed:String, ExtensionKindUnregistered:String, ExtensionTargetUnsupported:String, PropertyTargetUnsupported:String, TransitionCreationFailed:String, TransitionKindUnregistered:String } return flight._cpp._attempt.Attempt_Types_NodeInteractiveStateRefusalReason.NodeInteractiveStateRefusalReason;

private extern inline function set_NodeInteractiveStateRefusalReason(value:{ ExtensionCreationFailed:String, ExtensionKindUnregistered:String, ExtensionTargetUnsupported:String, PropertyTargetUnsupported:String, TransitionCreationFailed:String, TransitionKindUnregistered:String }):{ ExtensionCreationFailed:String, ExtensionKindUnregistered:String, ExtensionTargetUnsupported:String, PropertyTargetUnsupported:String, TransitionCreationFailed:String, TransitionKindUnregistered:String } return flight._cpp._attempt.Attempt_Types_NodeInteractiveStateRefusalReason.NodeInteractiveStateRefusalReason = value;

var NodeKind(get, set):String;

private extern inline function get_NodeKind():String return flight._cpp._attempt.Attempt_Types_NodeKind.NodeKind;

private extern inline function set_NodeKind(value:String):String return flight._cpp._attempt.Attempt_Types_NodeKind.NodeKind = value;

var NormalMaterialKind(get, set):String;

private extern inline function get_NormalMaterialKind():String return flight._cpp._attempt.Attempt_Types_NormalMaterialKind.NormalMaterialKind;

private extern inline function set_NormalMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_NormalMaterialKind.NormalMaterialKind = value;

var NullScene3D(get, set):Dynamic;

private extern inline function get_NullScene3D():Dynamic return flight._cpp._attempt.Attempt_Types_NullScene3D.NullScene3D;

private extern inline function set_NullScene3D(value:Dynamic):Dynamic return flight._cpp._attempt.Attempt_Types_NullScene3D.NullScene3D = value;

var OBJ_MATERIAL_BLINN_PHONG_FEATURE(get, set):String;

private extern inline function get_OBJ_MATERIAL_BLINN_PHONG_FEATURE():String return flight._cpp._attempt.Attempt_Types_OBJ_MATERIAL_BLINN_PHONG_FEATURE.OBJ_MATERIAL_BLINN_PHONG_FEATURE;

private extern inline function set_OBJ_MATERIAL_BLINN_PHONG_FEATURE(value:String):String return flight._cpp._attempt.Attempt_Types_OBJ_MATERIAL_BLINN_PHONG_FEATURE.OBJ_MATERIAL_BLINN_PHONG_FEATURE = value;

var OBJ_MATERIAL_STANDARD_PBR_FEATURE(get, set):String;

private extern inline function get_OBJ_MATERIAL_STANDARD_PBR_FEATURE():String return flight._cpp._attempt.Attempt_Types_OBJ_MATERIAL_STANDARD_PBR_FEATURE.OBJ_MATERIAL_STANDARD_PBR_FEATURE;

private extern inline function set_OBJ_MATERIAL_STANDARD_PBR_FEATURE(value:String):String return flight._cpp._attempt.Attempt_Types_OBJ_MATERIAL_STANDARD_PBR_FEATURE.OBJ_MATERIAL_STANDARD_PBR_FEATURE = value;

var ParticleDesignerFormatKind(get, set):String;

private extern inline function get_ParticleDesignerFormatKind():String return flight._cpp._attempt.Attempt_Types_ParticleDesignerFormatKind.ParticleDesignerFormatKind;

private extern inline function set_ParticleDesignerFormatKind(value:String):String return flight._cpp._attempt.Attempt_Types_ParticleDesignerFormatKind.ParticleDesignerFormatKind = value;

var ParticleEmitter2DKind(get, set):String;

private extern inline function get_ParticleEmitter2DKind():String return flight._cpp._attempt.Attempt_Types_ParticleEmitter2DKind.ParticleEmitter2DKind;

private extern inline function set_ParticleEmitter2DKind(value:String):String return flight._cpp._attempt.Attempt_Types_ParticleEmitter2DKind.ParticleEmitter2DKind = value;

var ParticleEmitter3DKind(get, set):String;

private extern inline function get_ParticleEmitter3DKind():String return flight._cpp._attempt.Attempt_Types_ParticleEmitter3DKind.ParticleEmitter3DKind;

private extern inline function set_ParticleEmitter3DKind(value:String):String return flight._cpp._attempt.Attempt_Types_ParticleEmitter3DKind.ParticleEmitter3DKind = value;

var PathAttachment2DKind(get, set):String;

private extern inline function get_PathAttachment2DKind():String return flight._cpp._attempt.Attempt_Types_PathAttachment2DKind.PathAttachment2DKind;

private extern inline function set_PathAttachment2DKind(value:String):String return flight._cpp._attempt.Attempt_Types_PathAttachment2DKind.PathAttachment2DKind = value;

var PathCommand(get, set):{ NO_OP:Float, MOVE_TO:Float, LINE_TO:Float, QUADRATIC_CURVE_TO:Float, WIDE_MOVE_TO:Float, WIDE_LINE_TO:Float, CUBIC_CURVE_TO:Float, CLOSE:Float };

private extern inline function get_PathCommand():{ NO_OP:Float, MOVE_TO:Float, LINE_TO:Float, QUADRATIC_CURVE_TO:Float, WIDE_MOVE_TO:Float, WIDE_LINE_TO:Float, CUBIC_CURVE_TO:Float, CLOSE:Float } return flight._cpp._attempt.Attempt_Types_PathCommand.PathCommand;

private extern inline function set_PathCommand(value:{ NO_OP:Float, MOVE_TO:Float, LINE_TO:Float, QUADRATIC_CURVE_TO:Float, WIDE_MOVE_TO:Float, WIDE_LINE_TO:Float, CUBIC_CURVE_TO:Float, CLOSE:Float }):{ NO_OP:Float, MOVE_TO:Float, LINE_TO:Float, QUADRATIC_CURVE_TO:Float, WIDE_MOVE_TO:Float, WIDE_LINE_TO:Float, CUBIC_CURVE_TO:Float, CLOSE:Float } return flight._cpp._attempt.Attempt_Types_PathCommand.PathCommand = value;

var PhongMaterialKind(get, set):String;

private extern inline function get_PhongMaterialKind():String return flight._cpp._attempt.Attempt_Types_PhongMaterialKind.PhongMaterialKind;

private extern inline function set_PhongMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_PhongMaterialKind.PhongMaterialKind = value;

var PixiParticleFormatKind(get, set):String;

private extern inline function get_PixiParticleFormatKind():String return flight._cpp._attempt.Attempt_Types_PixiParticleFormatKind.PixiParticleFormatKind;

private extern inline function set_PixiParticleFormatKind(value:String):String return flight._cpp._attempt.Attempt_Types_PixiParticleFormatKind.PixiParticleFormatKind = value;

var PlaneColliderKind(get, set):String;

private extern inline function get_PlaneColliderKind():String return flight._cpp._attempt.Attempt_Types_PlaneColliderKind.PlaneColliderKind;

private extern inline function set_PlaneColliderKind(value:String):String return flight._cpp._attempt.Attempt_Types_PlaneColliderKind.PlaneColliderKind = value;

var PointAttachment2DKind(get, set):String;

private extern inline function get_PointAttachment2DKind():String return flight._cpp._attempt.Attempt_Types_PointAttachment2DKind.PointAttachment2DKind;

private extern inline function set_PointAttachment2DKind(value:String):String return flight._cpp._attempt.Attempt_Types_PointAttachment2DKind.PointAttachment2DKind = value;

var PointGravityWellForceKind(get, set):String;

private extern inline function get_PointGravityWellForceKind():String return flight._cpp._attempt.Attempt_Types_PointGravityWellForceKind.PointGravityWellForceKind;

private extern inline function set_PointGravityWellForceKind(value:String):String return flight._cpp._attempt.Attempt_Types_PointGravityWellForceKind.PointGravityWellForceKind = value;

var PointLightKind(get, set):String;

private extern inline function get_PointLightKind():String return flight._cpp._attempt.Attempt_Types_PointLightKind.PointLightKind;

private extern inline function set_PointLightKind(value:String):String return flight._cpp._attempt.Attempt_Types_PointLightKind.PointLightKind = value;

var QuadBatchKind(get, set):String;

private extern inline function get_QuadBatchKind():String return flight._cpp._attempt.Attempt_Types_QuadBatchKind.QuadBatchKind;

private extern inline function set_QuadBatchKind(value:String):String return flight._cpp._attempt.Attempt_Types_QuadBatchKind.QuadBatchKind = value;

var RectangleColliderKind(get, set):String;

private extern inline function get_RectangleColliderKind():String return flight._cpp._attempt.Attempt_Types_RectangleColliderKind.RectangleColliderKind;

private extern inline function set_RectangleColliderKind(value:String):String return flight._cpp._attempt.Attempt_Types_RectangleColliderKind.RectangleColliderKind = value;

var RegionAttachment2DKind(get, set):String;

private extern inline function get_RegionAttachment2DKind():String return flight._cpp._attempt.Attempt_Types_RegionAttachment2DKind.RegionAttachment2DKind;

private extern inline function set_RegionAttachment2DKind(value:String):String return flight._cpp._attempt.Attempt_Types_RegionAttachment2DKind.RegionAttachment2DKind = value;

var RemoveNodeChildCommandKind(get, set):String;

private extern inline function get_RemoveNodeChildCommandKind():String return flight._cpp._attempt.Attempt_Types_RemoveNodeChildCommandKind.RemoveNodeChildCommandKind;

private extern inline function set_RemoveNodeChildCommandKind(value:String):String return flight._cpp._attempt.Attempt_Types_RemoveNodeChildCommandKind.RemoveNodeChildCommandKind = value;

var RenderCacheKind(get, set):String;

private extern inline function get_RenderCacheKind():String return flight._cpp._attempt.Attempt_Types_RenderCacheKind.RenderCacheKind;

private extern inline function set_RenderCacheKind(value:String):String return flight._cpp._attempt.Attempt_Types_RenderCacheKind.RenderCacheKind = value;

var RenderTargetTextureSourceKind(get, set):String;

private extern inline function get_RenderTargetTextureSourceKind():String return flight._cpp._attempt.Attempt_Types_RenderTargetTextureSourceKind.RenderTargetTextureSourceKind;

private extern inline function set_RenderTargetTextureSourceKind(value:String):String return flight._cpp._attempt.Attempt_Types_RenderTargetTextureSourceKind.RenderTargetTextureSourceKind = value;

var ReorderNodeChildCommandKind(get, set):String;

private extern inline function get_ReorderNodeChildCommandKind():String return flight._cpp._attempt.Attempt_Types_ReorderNodeChildCommandKind.ReorderNodeChildCommandKind;

private extern inline function set_ReorderNodeChildCommandKind(value:String):String return flight._cpp._attempt.Attempt_Types_ReorderNodeChildCommandKind.ReorderNodeChildCommandKind = value;

var RequirementFacet(get, set):{ CompressionKind:String, DocumentFormat:String, Physics2DJointKind:String, SceneBlendMode:String, SceneMaterialKind:String, SceneModifierKind:String, SceneNodeKind:String, SceneResourceMimeType:String, SceneShapeCommand:String, SceneTextureSourceKind:String };

private extern inline function get_RequirementFacet():{ CompressionKind:String, DocumentFormat:String, Physics2DJointKind:String, SceneBlendMode:String, SceneMaterialKind:String, SceneModifierKind:String, SceneNodeKind:String, SceneResourceMimeType:String, SceneShapeCommand:String, SceneTextureSourceKind:String } return flight._cpp._attempt.Attempt_Types_RequirementFacet.RequirementFacet;

private extern inline function set_RequirementFacet(value:{ CompressionKind:String, DocumentFormat:String, Physics2DJointKind:String, SceneBlendMode:String, SceneMaterialKind:String, SceneModifierKind:String, SceneNodeKind:String, SceneResourceMimeType:String, SceneShapeCommand:String, SceneTextureSourceKind:String }):{ CompressionKind:String, DocumentFormat:String, Physics2DJointKind:String, SceneBlendMode:String, SceneMaterialKind:String, SceneModifierKind:String, SceneNodeKind:String, SceneResourceMimeType:String, SceneShapeCommand:String, SceneTextureSourceKind:String } return flight._cpp._attempt.Attempt_Types_RequirementFacet.RequirementFacet = value;

var ResourceResolutionState(get, set):{ Failed:String, Loading:String, Resolved:String, Unresolved:String };

private extern inline function get_ResourceResolutionState():{ Failed:String, Loading:String, Resolved:String, Unresolved:String } return flight._cpp._attempt.Attempt_Types_ResourceResolutionState.ResourceResolutionState;

private extern inline function set_ResourceResolutionState(value:{ Failed:String, Loading:String, Resolved:String, Unresolved:String }):{ Failed:String, Loading:String, Resolved:String, Unresolved:String } return flight._cpp._attempt.Attempt_Types_ResourceResolutionState.ResourceResolutionState = value;

var RichTextKind(get, set):String;

private extern inline function get_RichTextKind():String return flight._cpp._attempt.Attempt_Types_RichTextKind.RichTextKind;

private extern inline function set_RichTextKind(value:String):String return flight._cpp._attempt.Attempt_Types_RichTextKind.RichTextKind = value;

var RimModifierKind(get, set):String;

private extern inline function get_RimModifierKind():String return flight._cpp._attempt.Attempt_Types_RimModifierKind.RimModifierKind;

private extern inline function set_RimModifierKind(value:String):String return flight._cpp._attempt.Attempt_Types_RimModifierKind.RimModifierKind = value;

var RiveAnimationLoop(get, set):{ OneShot:String, Loop:String, PingPong:String };

private extern inline function get_RiveAnimationLoop():{ OneShot:String, Loop:String, PingPong:String } return flight._cpp._attempt.Attempt_Types_RiveAnimationLoop.RiveAnimationLoop;

private extern inline function set_RiveAnimationLoop(value:{ OneShot:String, Loop:String, PingPong:String }):{ OneShot:String, Loop:String, PingPong:String } return flight._cpp._attempt.Attempt_Types_RiveAnimationLoop.RiveAnimationLoop = value;

var RiveFieldType(get, set):{ Uint:Float, String:Float, Double:Float, Color:Float };

private extern inline function get_RiveFieldType():{ Uint:Float, String:Float, Double:Float, Color:Float } return flight._cpp._attempt.Attempt_Types_RiveFieldType.RiveFieldType;

private extern inline function set_RiveFieldType(value:{ Uint:Float, String:Float, Double:Float, Color:Float }):{ Uint:Float, String:Float, Double:Float, Color:Float } return flight._cpp._attempt.Attempt_Types_RiveFieldType.RiveFieldType = value;

var RiveWeightedPointKind(get, set):{ Point:String, In:String, Out:String };

private extern inline function get_RiveWeightedPointKind():{ Point:String, In:String, Out:String } return flight._cpp._attempt.Attempt_Types_RiveWeightedPointKind.RiveWeightedPointKind;

private extern inline function set_RiveWeightedPointKind(value:{ Point:String, In:String, Out:String }):{ Point:String, In:String, Out:String } return flight._cpp._attempt.Attempt_Types_RiveWeightedPointKind.RiveWeightedPointKind = value;

var SCENE_LIGHT_AMBIENT_RADIANCE_OFFSET(get, set):Float;

private extern inline function get_SCENE_LIGHT_AMBIENT_RADIANCE_OFFSET():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_AMBIENT_RADIANCE_OFFSET.SCENE_LIGHT_AMBIENT_RADIANCE_OFFSET;

private extern inline function set_SCENE_LIGHT_AMBIENT_RADIANCE_OFFSET(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_AMBIENT_RADIANCE_OFFSET.SCENE_LIGHT_AMBIENT_RADIANCE_OFFSET = value;

var SCENE_LIGHT_BLOCK_FLOATS(get, set):Float;

private extern inline function get_SCENE_LIGHT_BLOCK_FLOATS():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_BLOCK_FLOATS.SCENE_LIGHT_BLOCK_FLOATS;

private extern inline function set_SCENE_LIGHT_BLOCK_FLOATS(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_BLOCK_FLOATS.SCENE_LIGHT_BLOCK_FLOATS = value;

var SCENE_LIGHT_DIRECTIONAL_DIRECTION_OFFSET(get, set):Float;

private extern inline function get_SCENE_LIGHT_DIRECTIONAL_DIRECTION_OFFSET():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_DIRECTIONAL_DIRECTION_OFFSET.SCENE_LIGHT_DIRECTIONAL_DIRECTION_OFFSET;

private extern inline function set_SCENE_LIGHT_DIRECTIONAL_DIRECTION_OFFSET(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_DIRECTIONAL_DIRECTION_OFFSET.SCENE_LIGHT_DIRECTIONAL_DIRECTION_OFFSET = value;

var SCENE_LIGHT_DIRECTIONAL_RADIANCE_OFFSET(get, set):Float;

private extern inline function get_SCENE_LIGHT_DIRECTIONAL_RADIANCE_OFFSET():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_DIRECTIONAL_RADIANCE_OFFSET.SCENE_LIGHT_DIRECTIONAL_RADIANCE_OFFSET;

private extern inline function set_SCENE_LIGHT_DIRECTIONAL_RADIANCE_OFFSET(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_DIRECTIONAL_RADIANCE_OFFSET.SCENE_LIGHT_DIRECTIONAL_RADIANCE_OFFSET = value;

var SCENE_LIGHT_HEAD_FLOATS(get, set):Float;

private extern inline function get_SCENE_LIGHT_HEAD_FLOATS():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_HEAD_FLOATS.SCENE_LIGHT_HEAD_FLOATS;

private extern inline function set_SCENE_LIGHT_HEAD_FLOATS(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_HEAD_FLOATS.SCENE_LIGHT_HEAD_FLOATS = value;

var SCENE_LIGHT_HEMISPHERE_OFFSET(get, set):Float;

private extern inline function get_SCENE_LIGHT_HEMISPHERE_OFFSET():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_HEMISPHERE_OFFSET.SCENE_LIGHT_HEMISPHERE_OFFSET;

private extern inline function set_SCENE_LIGHT_HEMISPHERE_OFFSET(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_HEMISPHERE_OFFSET.SCENE_LIGHT_HEMISPHERE_OFFSET = value;

var SCENE_LIGHT_HEMISPHERE_STRIDE(get, set):Float;

private extern inline function get_SCENE_LIGHT_HEMISPHERE_STRIDE():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_HEMISPHERE_STRIDE.SCENE_LIGHT_HEMISPHERE_STRIDE;

private extern inline function set_SCENE_LIGHT_HEMISPHERE_STRIDE(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_HEMISPHERE_STRIDE.SCENE_LIGHT_HEMISPHERE_STRIDE = value;

var SCENE_LIGHT_POINT_OFFSET(get, set):Float;

private extern inline function get_SCENE_LIGHT_POINT_OFFSET():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_POINT_OFFSET.SCENE_LIGHT_POINT_OFFSET;

private extern inline function set_SCENE_LIGHT_POINT_OFFSET(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_POINT_OFFSET.SCENE_LIGHT_POINT_OFFSET = value;

var SCENE_LIGHT_POINT_STRIDE(get, set):Float;

private extern inline function get_SCENE_LIGHT_POINT_STRIDE():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_POINT_STRIDE.SCENE_LIGHT_POINT_STRIDE;

private extern inline function set_SCENE_LIGHT_POINT_STRIDE(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_POINT_STRIDE.SCENE_LIGHT_POINT_STRIDE = value;

var SCENE_LIGHT_SPOT_OFFSET(get, set):Float;

private extern inline function get_SCENE_LIGHT_SPOT_OFFSET():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_SPOT_OFFSET.SCENE_LIGHT_SPOT_OFFSET;

private extern inline function set_SCENE_LIGHT_SPOT_OFFSET(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_SPOT_OFFSET.SCENE_LIGHT_SPOT_OFFSET = value;

var SCENE_LIGHT_SPOT_STRIDE(get, set):Float;

private extern inline function get_SCENE_LIGHT_SPOT_STRIDE():Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_SPOT_STRIDE.SCENE_LIGHT_SPOT_STRIDE;

private extern inline function set_SCENE_LIGHT_SPOT_STRIDE(value:Float):Float return flight._cpp._attempt.Attempt_Types_SCENE_LIGHT_SPOT_STRIDE.SCENE_LIGHT_SPOT_STRIDE = value;

var SamplerKind(get, set):String;

private extern inline function get_SamplerKind():String return flight._cpp._attempt.Attempt_Types_SamplerKind.SamplerKind;

private extern inline function set_SamplerKind(value:String):String return flight._cpp._attempt.Attempt_Types_SamplerKind.SamplerKind = value;

var Scale9ShapeKind(get, set):String;

private extern inline function get_Scale9ShapeKind():String return flight._cpp._attempt.Attempt_Types_Scale9ShapeKind.Scale9ShapeKind;

private extern inline function set_Scale9ShapeKind(value:String):String return flight._cpp._attempt.Attempt_Types_Scale9ShapeKind.Scale9ShapeKind = value;

var Scale9SpriteKind(get, set):String;

private extern inline function get_Scale9SpriteKind():String return flight._cpp._attempt.Attempt_Types_Scale9SpriteKind.Scale9SpriteKind;

private extern inline function set_Scale9SpriteKind(value:String):String return flight._cpp._attempt.Attempt_Types_Scale9SpriteKind.Scale9SpriteKind = value;

var Scene3DAnimationPathRotation(get, set):String;

private extern inline function get_Scene3DAnimationPathRotation():String return flight._cpp._attempt.Attempt_Types_Scene3DAnimationPathRotation.Scene3DAnimationPathRotation;

private extern inline function set_Scene3DAnimationPathRotation(value:String):String return flight._cpp._attempt.Attempt_Types_Scene3DAnimationPathRotation.Scene3DAnimationPathRotation = value;

var Scene3DAnimationPathScale(get, set):String;

private extern inline function get_Scene3DAnimationPathScale():String return flight._cpp._attempt.Attempt_Types_Scene3DAnimationPathScale.Scene3DAnimationPathScale;

private extern inline function set_Scene3DAnimationPathScale(value:String):String return flight._cpp._attempt.Attempt_Types_Scene3DAnimationPathScale.Scene3DAnimationPathScale = value;

var Scene3DAnimationPathTranslation(get, set):String;

private extern inline function get_Scene3DAnimationPathTranslation():String return flight._cpp._attempt.Attempt_Types_Scene3DAnimationPathTranslation.Scene3DAnimationPathTranslation;

private extern inline function set_Scene3DAnimationPathTranslation(value:String):String return flight._cpp._attempt.Attempt_Types_Scene3DAnimationPathTranslation.Scene3DAnimationPathTranslation = value;

var Scene3DAnimationPathWeights(get, set):String;

private extern inline function get_Scene3DAnimationPathWeights():String return flight._cpp._attempt.Attempt_Types_Scene3DAnimationPathWeights.Scene3DAnimationPathWeights;

private extern inline function set_Scene3DAnimationPathWeights(value:String):String return flight._cpp._attempt.Attempt_Types_Scene3DAnimationPathWeights.Scene3DAnimationPathWeights = value;

var Scene3DResourceResolverRuntimeKey(get, set):Dynamic;

private extern inline function get_Scene3DResourceResolverRuntimeKey():Dynamic return flight._cpp._attempt.Attempt_Types_Scene3DResourceResolverRuntimeKey.Scene3DResourceResolverRuntimeKey;

private extern inline function set_Scene3DResourceResolverRuntimeKey(value:Dynamic):Dynamic return flight._cpp._attempt.Attempt_Types_Scene3DResourceResolverRuntimeKey.Scene3DResourceResolverRuntimeKey = value;

var SceneCoverage(get, set):{ FallbackRemediable:String, FallbackUnavailable:String, Satisfied:String, Unavailable:String, Unregistered:String };

private extern inline function get_SceneCoverage():{ FallbackRemediable:String, FallbackUnavailable:String, Satisfied:String, Unavailable:String, Unregistered:String } return flight._cpp._attempt.Attempt_Types_SceneCoverage.SceneCoverage;

private extern inline function set_SceneCoverage(value:{ FallbackRemediable:String, FallbackUnavailable:String, Satisfied:String, Unavailable:String, Unregistered:String }):{ FallbackRemediable:String, FallbackUnavailable:String, Satisfied:String, Unavailable:String, Unregistered:String } return flight._cpp._attempt.Attempt_Types_SceneCoverage.SceneCoverage = value;

var SetNodePropertyCommandKind(get, set):String;

private extern inline function get_SetNodePropertyCommandKind():String return flight._cpp._attempt.Attempt_Types_SetNodePropertyCommandKind.SetNodePropertyCommandKind;

private extern inline function set_SetNodePropertyCommandKind(value:String):String return flight._cpp._attempt.Attempt_Types_SetNodePropertyCommandKind.SetNodePropertyCommandKind = value;

var ShadedMaterialKind(get, set):String;

private extern inline function get_ShadedMaterialKind():String return flight._cpp._attempt.Attempt_Types_ShadedMaterialKind.ShadedMaterialKind;

private extern inline function set_ShadedMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_ShadedMaterialKind.ShadedMaterialKind = value;

var ShapeKind(get, set):String;

private extern inline function get_ShapeKind():String return flight._cpp._attempt.Attempt_Types_ShapeKind.ShapeKind;

private extern inline function set_ShapeKind(value:String):String return flight._cpp._attempt.Attempt_Types_ShapeKind.ShapeKind = value;

var SheenPbrExtensionKind(get, set):String;

private extern inline function get_SheenPbrExtensionKind():String return flight._cpp._attempt.Attempt_Types_SheenPbrExtensionKind.SheenPbrExtensionKind;

private extern inline function set_SheenPbrExtensionKind(value:String):String return flight._cpp._attempt.Attempt_Types_SheenPbrExtensionKind.SheenPbrExtensionKind = value;

var Skeleton2DAnimationPath(get, set):{ Translation:String, TranslationX:String, TranslationY:String, Rotation:String, Scale:String, ScaleX:String, ScaleY:String, Shear:String, ShearX:String, ShearY:String };

private extern inline function get_Skeleton2DAnimationPath():{ Translation:String, TranslationX:String, TranslationY:String, Rotation:String, Scale:String, ScaleX:String, ScaleY:String, Shear:String, ShearX:String, ShearY:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DAnimationPath.Skeleton2DAnimationPath;

private extern inline function set_Skeleton2DAnimationPath(value:{ Translation:String, TranslationX:String, TranslationY:String, Rotation:String, Scale:String, ScaleX:String, ScaleY:String, Shear:String, ShearX:String, ShearY:String }):{ Translation:String, TranslationX:String, TranslationY:String, Rotation:String, Scale:String, ScaleX:String, ScaleY:String, Shear:String, ShearX:String, ShearY:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DAnimationPath.Skeleton2DAnimationPath = value;

var Skeleton2DAnimationTargetKind(get, set):{ Bone:String, Constraint:String, Deform:String, DrawOrder:String, Slot:String };

private extern inline function get_Skeleton2DAnimationTargetKind():{ Bone:String, Constraint:String, Deform:String, DrawOrder:String, Slot:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DAnimationTargetKind.Skeleton2DAnimationTargetKind;

private extern inline function set_Skeleton2DAnimationTargetKind(value:{ Bone:String, Constraint:String, Deform:String, DrawOrder:String, Slot:String }):{ Bone:String, Constraint:String, Deform:String, DrawOrder:String, Slot:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DAnimationTargetKind.Skeleton2DAnimationTargetKind = value;

var Skeleton2DConstraintKind(get, set):{ Ik:String, Path:String, Transform:String };

private extern inline function get_Skeleton2DConstraintKind():{ Ik:String, Path:String, Transform:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DConstraintKind.Skeleton2DConstraintKind;

private extern inline function set_Skeleton2DConstraintKind(value:{ Ik:String, Path:String, Transform:String }):{ Ik:String, Path:String, Transform:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DConstraintKind.Skeleton2DConstraintKind = value;

var Skeleton2DPathPositionMode(get, set):{ Fixed:String, Percent:String };

private extern inline function get_Skeleton2DPathPositionMode():{ Fixed:String, Percent:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DPathPositionMode.Skeleton2DPathPositionMode;

private extern inline function set_Skeleton2DPathPositionMode(value:{ Fixed:String, Percent:String }):{ Fixed:String, Percent:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DPathPositionMode.Skeleton2DPathPositionMode = value;

var Skeleton2DPathRotateMode(get, set):{ Chain:String, Tangent:String };

private extern inline function get_Skeleton2DPathRotateMode():{ Chain:String, Tangent:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DPathRotateMode.Skeleton2DPathRotateMode;

private extern inline function set_Skeleton2DPathRotateMode(value:{ Chain:String, Tangent:String }):{ Chain:String, Tangent:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DPathRotateMode.Skeleton2DPathRotateMode = value;

var Skeleton2DPathSpacingMode(get, set):{ Fixed:String, Length:String, Percent:String };

private extern inline function get_Skeleton2DPathSpacingMode():{ Fixed:String, Length:String, Percent:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DPathSpacingMode.Skeleton2DPathSpacingMode;

private extern inline function set_Skeleton2DPathSpacingMode(value:{ Fixed:String, Length:String, Percent:String }):{ Fixed:String, Length:String, Percent:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DPathSpacingMode.Skeleton2DPathSpacingMode = value;

var Skeleton2DSlotAnimationPath(get, set):{ Attachment:String, Color:String };

private extern inline function get_Skeleton2DSlotAnimationPath():{ Attachment:String, Color:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DSlotAnimationPath.Skeleton2DSlotAnimationPath;

private extern inline function set_Skeleton2DSlotAnimationPath(value:{ Attachment:String, Color:String }):{ Attachment:String, Color:String } return flight._cpp._attempt.Attempt_Types_Skeleton2DSlotAnimationPath.Skeleton2DSlotAnimationPath = value;

var SoftKeyboardAttachAcquisitionFailedKind(get, set):String;

private extern inline function get_SoftKeyboardAttachAcquisitionFailedKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardAttachAcquisitionFailedKind.SoftKeyboardAttachAcquisitionFailedKind;

private extern inline function set_SoftKeyboardAttachAcquisitionFailedKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardAttachAcquisitionFailedKind.SoftKeyboardAttachAcquisitionFailedKind = value;

var SoftKeyboardAttachOkKind(get, set):String;

private extern inline function get_SoftKeyboardAttachOkKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardAttachOkKind.SoftKeyboardAttachOkKind;

private extern inline function set_SoftKeyboardAttachOkKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardAttachOkKind.SoftKeyboardAttachOkKind = value;

var SoftKeyboardResizeBodyKind(get, set):String;

private extern inline function get_SoftKeyboardResizeBodyKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardResizeBodyKind.SoftKeyboardResizeBodyKind;

private extern inline function set_SoftKeyboardResizeBodyKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardResizeBodyKind.SoftKeyboardResizeBodyKind = value;

var SoftKeyboardResizeNoneKind(get, set):String;

private extern inline function get_SoftKeyboardResizeNoneKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardResizeNoneKind.SoftKeyboardResizeNoneKind;

private extern inline function set_SoftKeyboardResizeNoneKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardResizeNoneKind.SoftKeyboardResizeNoneKind = value;

var SoftKeyboardSetterOkKind(get, set):String;

private extern inline function get_SoftKeyboardSetterOkKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardSetterOkKind.SoftKeyboardSetterOkKind;

private extern inline function set_SoftKeyboardSetterOkKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardSetterOkKind.SoftKeyboardSetterOkKind = value;

var SoftKeyboardSetterOperationFailedKind(get, set):String;

private extern inline function get_SoftKeyboardSetterOperationFailedKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardSetterOperationFailedKind.SoftKeyboardSetterOperationFailedKind;

private extern inline function set_SoftKeyboardSetterOperationFailedKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardSetterOperationFailedKind.SoftKeyboardSetterOperationFailedKind = value;

var SoftKeyboardSetterOperationUnavailableKind(get, set):String;

private extern inline function get_SoftKeyboardSetterOperationUnavailableKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardSetterOperationUnavailableKind.SoftKeyboardSetterOperationUnavailableKind;

private extern inline function set_SoftKeyboardSetterOperationUnavailableKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardSetterOperationUnavailableKind.SoftKeyboardSetterOperationUnavailableKind = value;

var SoftKeyboardStyleDarkKind(get, set):String;

private extern inline function get_SoftKeyboardStyleDarkKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardStyleDarkKind.SoftKeyboardStyleDarkKind;

private extern inline function set_SoftKeyboardStyleDarkKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardStyleDarkKind.SoftKeyboardStyleDarkKind = value;

var SoftKeyboardStyleDefaultKind(get, set):String;

private extern inline function get_SoftKeyboardStyleDefaultKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardStyleDefaultKind.SoftKeyboardStyleDefaultKind;

private extern inline function set_SoftKeyboardStyleDefaultKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardStyleDefaultKind.SoftKeyboardStyleDefaultKind = value;

var SoftKeyboardVisibilityOkKind(get, set):String;

private extern inline function get_SoftKeyboardVisibilityOkKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardVisibilityOkKind.SoftKeyboardVisibilityOkKind;

private extern inline function set_SoftKeyboardVisibilityOkKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardVisibilityOkKind.SoftKeyboardVisibilityOkKind = value;

var SoftKeyboardVisibilityOperationFailedKind(get, set):String;

private extern inline function get_SoftKeyboardVisibilityOperationFailedKind():String return flight._cpp._attempt.Attempt_Types_SoftKeyboardVisibilityOperationFailedKind.SoftKeyboardVisibilityOperationFailedKind;

private extern inline function set_SoftKeyboardVisibilityOperationFailedKind(value:String):String return flight._cpp._attempt.Attempt_Types_SoftKeyboardVisibilityOperationFailedKind.SoftKeyboardVisibilityOperationFailedKind = value;

var SpecularGlossinessPbrMaterialKind(get, set):String;

private extern inline function get_SpecularGlossinessPbrMaterialKind():String return flight._cpp._attempt.Attempt_Types_SpecularGlossinessPbrMaterialKind.SpecularGlossinessPbrMaterialKind;

private extern inline function set_SpecularGlossinessPbrMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_SpecularGlossinessPbrMaterialKind.SpecularGlossinessPbrMaterialKind = value;

var SpecularPbrExtensionKind(get, set):String;

private extern inline function get_SpecularPbrExtensionKind():String return flight._cpp._attempt.Attempt_Types_SpecularPbrExtensionKind.SpecularPbrExtensionKind;

private extern inline function set_SpecularPbrExtensionKind(value:String):String return flight._cpp._attempt.Attempt_Types_SpecularPbrExtensionKind.SpecularPbrExtensionKind = value;

var SphereColliderKind(get, set):String;

private extern inline function get_SphereColliderKind():String return flight._cpp._attempt.Attempt_Types_SphereColliderKind.SphereColliderKind;

private extern inline function set_SphereColliderKind(value:String):String return flight._cpp._attempt.Attempt_Types_SphereColliderKind.SphereColliderKind = value;

var SpineBinarySectionKind(get, set):{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String };

private extern inline function get_SpineBinarySectionKind():{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String } return flight._cpp._attempt.Attempt_Types_SpineBinarySectionKind.SpineBinarySectionKind;

private extern inline function set_SpineBinarySectionKind(value:{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String }):{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String } return flight._cpp._attempt.Attempt_Types_SpineBinarySectionKind.SpineBinarySectionKind = value;

var SpineBinaryTimelineKind(get, set):{ Bone:String, Deform:String, DrawOrder:String, Event:String, Ik:String, Path:String, Slot:String, Transform:String };

private extern inline function get_SpineBinaryTimelineKind():{ Bone:String, Deform:String, DrawOrder:String, Event:String, Ik:String, Path:String, Slot:String, Transform:String } return flight._cpp._attempt.Attempt_Types_SpineBinaryTimelineKind.SpineBinaryTimelineKind;

private extern inline function set_SpineBinaryTimelineKind(value:{ Bone:String, Deform:String, DrawOrder:String, Event:String, Ik:String, Path:String, Slot:String, Transform:String }):{ Bone:String, Deform:String, DrawOrder:String, Event:String, Ik:String, Path:String, Slot:String, Transform:String } return flight._cpp._attempt.Attempt_Types_SpineBinaryTimelineKind.SpineBinaryTimelineKind = value;

var SpineJsonSectionKind(get, set):{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String };

private extern inline function get_SpineJsonSectionKind():{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String } return flight._cpp._attempt.Attempt_Types_SpineJsonSectionKind.SpineJsonSectionKind;

private extern inline function set_SpineJsonSectionKind(value:{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String }):{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String } return flight._cpp._attempt.Attempt_Types_SpineJsonSectionKind.SpineJsonSectionKind = value;

var SpineJsonTimelineKind(get, set):{ Bone:String, Deform:String, DrawOrder:String, Event:String, Ik:String, Path:String, Slot:String, Transform:String };

private extern inline function get_SpineJsonTimelineKind():{ Bone:String, Deform:String, DrawOrder:String, Event:String, Ik:String, Path:String, Slot:String, Transform:String } return flight._cpp._attempt.Attempt_Types_SpineJsonTimelineKind.SpineJsonTimelineKind;

private extern inline function set_SpineJsonTimelineKind(value:{ Bone:String, Deform:String, DrawOrder:String, Event:String, Ik:String, Path:String, Slot:String, Transform:String }):{ Bone:String, Deform:String, DrawOrder:String, Event:String, Ik:String, Path:String, Slot:String, Transform:String } return flight._cpp._attempt.Attempt_Types_SpineJsonTimelineKind.SpineJsonTimelineKind = value;

var SpineParticleFormatKind(get, set):String;

private extern inline function get_SpineParticleFormatKind():String return flight._cpp._attempt.Attempt_Types_SpineParticleFormatKind.SpineParticleFormatKind;

private extern inline function set_SpineParticleFormatKind(value:String):String return flight._cpp._attempt.Attempt_Types_SpineParticleFormatKind.SpineParticleFormatKind = value;

var SpotLightKind(get, set):String;

private extern inline function get_SpotLightKind():String return flight._cpp._attempt.Attempt_Types_SpotLightKind.SpotLightKind;

private extern inline function set_SpotLightKind(value:String):String return flight._cpp._attempt.Attempt_Types_SpotLightKind.SpotLightKind = value;

var SpriteKind(get, set):String;

private extern inline function get_SpriteKind():String return flight._cpp._attempt.Attempt_Types_SpriteKind.SpriteKind;

private extern inline function set_SpriteKind(value:String):String return flight._cpp._attempt.Attempt_Types_SpriteKind.SpriteKind = value;

var SpritesheetFormatKindAseprite(get, set):String;

private extern inline function get_SpritesheetFormatKindAseprite():String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindAseprite.SpritesheetFormatKindAseprite;

private extern inline function set_SpritesheetFormatKindAseprite(value:String):String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindAseprite.SpritesheetFormatKindAseprite = value;

var SpritesheetFormatKindCocosPlist(get, set):String;

private extern inline function get_SpritesheetFormatKindCocosPlist():String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindCocosPlist.SpritesheetFormatKindCocosPlist;

private extern inline function set_SpritesheetFormatKindCocosPlist(value:String):String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindCocosPlist.SpritesheetFormatKindCocosPlist = value;

var SpritesheetFormatKindLibgdxAtlas(get, set):String;

private extern inline function get_SpritesheetFormatKindLibgdxAtlas():String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindLibgdxAtlas.SpritesheetFormatKindLibgdxAtlas;

private extern inline function set_SpritesheetFormatKindLibgdxAtlas(value:String):String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindLibgdxAtlas.SpritesheetFormatKindLibgdxAtlas = value;

var SpritesheetFormatKindStarling(get, set):String;

private extern inline function get_SpritesheetFormatKindStarling():String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindStarling.SpritesheetFormatKindStarling;

private extern inline function set_SpritesheetFormatKindStarling(value:String):String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindStarling.SpritesheetFormatKindStarling = value;

var SpritesheetFormatKindTexturePacker(get, set):String;

private extern inline function get_SpritesheetFormatKindTexturePacker():String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindTexturePacker.SpritesheetFormatKindTexturePacker;

private extern inline function set_SpritesheetFormatKindTexturePacker(value:String):String return flight._cpp._attempt.Attempt_Types_SpritesheetFormatKindTexturePacker.SpritesheetFormatKindTexturePacker = value;

var StandardMaterialKind(get, set):String;

private extern inline function get_StandardMaterialKind():String return flight._cpp._attempt.Attempt_Types_StandardMaterialKind.StandardMaterialKind;

private extern inline function set_StandardMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_StandardMaterialKind.StandardMaterialKind = value;

var StandardPbrMaterialKind(get, set):String;

private extern inline function get_StandardPbrMaterialKind():String return flight._cpp._attempt.Attempt_Types_StandardPbrMaterialKind.StandardPbrMaterialKind;

private extern inline function set_StandardPbrMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_StandardPbrMaterialKind.StandardPbrMaterialKind = value;

var StarlingPexFormatKind(get, set):String;

private extern inline function get_StarlingPexFormatKind():String return flight._cpp._attempt.Attempt_Types_StarlingPexFormatKind.StarlingPexFormatKind;

private extern inline function set_StarlingPexFormatKind(value:String):String return flight._cpp._attempt.Attempt_Types_StarlingPexFormatKind.StarlingPexFormatKind = value;

var StatechartAtomicStateKind(get, set):String;

private extern inline function get_StatechartAtomicStateKind():String return flight._cpp._attempt.Attempt_Types_StatechartAtomicStateKind.StatechartAtomicStateKind;

private extern inline function set_StatechartAtomicStateKind(value:String):String return flight._cpp._attempt.Attempt_Types_StatechartAtomicStateKind.StatechartAtomicStateKind = value;

var StatechartComparison(get, set):{ Equal:String, GreaterThan:String, GreaterThanOrEqual:String, LessThan:String, LessThanOrEqual:String, NotEqual:String };

private extern inline function get_StatechartComparison():{ Equal:String, GreaterThan:String, GreaterThanOrEqual:String, LessThan:String, LessThanOrEqual:String, NotEqual:String } return flight._cpp._attempt.Attempt_Types_StatechartComparison.StatechartComparison;

private extern inline function set_StatechartComparison(value:{ Equal:String, GreaterThan:String, GreaterThanOrEqual:String, LessThan:String, LessThanOrEqual:String, NotEqual:String }):{ Equal:String, GreaterThan:String, GreaterThanOrEqual:String, LessThan:String, LessThanOrEqual:String, NotEqual:String } return flight._cpp._attempt.Attempt_Types_StatechartComparison.StatechartComparison = value;

var StatechartInputKind(get, set):{ Boolean:String, Number:String, Trigger:String };

private extern inline function get_StatechartInputKind():{ Boolean:String, Number:String, Trigger:String } return flight._cpp._attempt.Attempt_Types_StatechartInputKind.StatechartInputKind;

private extern inline function set_StatechartInputKind(value:{ Boolean:String, Number:String, Trigger:String }):{ Boolean:String, Number:String, Trigger:String } return flight._cpp._attempt.Attempt_Types_StatechartInputKind.StatechartInputKind = value;

var StatechartNestedStateKind(get, set):String;

private extern inline function get_StatechartNestedStateKind():String return flight._cpp._attempt.Attempt_Types_StatechartNestedStateKind.StatechartNestedStateKind;

private extern inline function set_StatechartNestedStateKind(value:String):String return flight._cpp._attempt.Attempt_Types_StatechartNestedStateKind.StatechartNestedStateKind = value;

var StatechartTransitionStatus(get, set):{ ConditionsUnmet:String, ExitTimePending:String, InvalidRegion:String, MissingRegionDuration:String, NoTransitions:String, Ready:String, Transitioning:String };

private extern inline function get_StatechartTransitionStatus():{ ConditionsUnmet:String, ExitTimePending:String, InvalidRegion:String, MissingRegionDuration:String, NoTransitions:String, Ready:String, Transitioning:String } return flight._cpp._attempt.Attempt_Types_StatechartTransitionStatus.StatechartTransitionStatus;

private extern inline function set_StatechartTransitionStatus(value:{ ConditionsUnmet:String, ExitTimePending:String, InvalidRegion:String, MissingRegionDuration:String, NoTransitions:String, Ready:String, Transitioning:String }):{ ConditionsUnmet:String, ExitTimePending:String, InvalidRegion:String, MissingRegionDuration:String, NoTransitions:String, Ready:String, Transitioning:String } return flight._cpp._attempt.Attempt_Types_StatechartTransitionStatus.StatechartTransitionStatus = value;

var SvgClipKind(get, set):{ Path:String };

private extern inline function get_SvgClipKind():{ Path:String } return flight._cpp._attempt.Attempt_Types_SvgClipKind.SvgClipKind;

private extern inline function set_SvgClipKind(value:{ Path:String }):{ Path:String } return flight._cpp._attempt.Attempt_Types_SvgClipKind.SvgClipKind = value;

var SvgElementKind(get, set):{ Container:String, Geometry:String, Image:String, Text:String, Use:String };

private extern inline function get_SvgElementKind():{ Container:String, Geometry:String, Image:String, Text:String, Use:String } return flight._cpp._attempt.Attempt_Types_SvgElementKind.SvgElementKind;

private extern inline function set_SvgElementKind(value:{ Container:String, Geometry:String, Image:String, Text:String, Use:String }):{ Container:String, Geometry:String, Image:String, Text:String, Use:String } return flight._cpp._attempt.Attempt_Types_SvgElementKind.SvgElementKind = value;

var THREE_DS_CAMERA(get, set):Float;

private extern inline function get_THREE_DS_CAMERA():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_CAMERA.THREE_DS_CAMERA;

private extern inline function set_THREE_DS_CAMERA(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_CAMERA.THREE_DS_CAMERA = value;

var THREE_DS_CAMERA_APERTURE_MM(get, set):Float;

private extern inline function get_THREE_DS_CAMERA_APERTURE_MM():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_CAMERA_APERTURE_MM.THREE_DS_CAMERA_APERTURE_MM;

private extern inline function set_THREE_DS_CAMERA_APERTURE_MM(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_CAMERA_APERTURE_MM.THREE_DS_CAMERA_APERTURE_MM = value;

var THREE_DS_CAMERA_RANGES(get, set):Float;

private extern inline function get_THREE_DS_CAMERA_RANGES():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_CAMERA_RANGES.THREE_DS_CAMERA_RANGES;

private extern inline function set_THREE_DS_CAMERA_RANGES(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_CAMERA_RANGES.THREE_DS_CAMERA_RANGES = value;

var THREE_DS_CHUNK_HEADER_BYTES(get, set):Float;

private extern inline function get_THREE_DS_CHUNK_HEADER_BYTES():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_CHUNK_HEADER_BYTES.THREE_DS_CHUNK_HEADER_BYTES;

private extern inline function set_THREE_DS_CHUNK_HEADER_BYTES(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_CHUNK_HEADER_BYTES.THREE_DS_CHUNK_HEADER_BYTES = value;

var THREE_DS_COLOR_BYTE(get, set):Float;

private extern inline function get_THREE_DS_COLOR_BYTE():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_COLOR_BYTE.THREE_DS_COLOR_BYTE;

private extern inline function set_THREE_DS_COLOR_BYTE(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_COLOR_BYTE.THREE_DS_COLOR_BYTE = value;

var THREE_DS_COLOR_FLOAT(get, set):Float;

private extern inline function get_THREE_DS_COLOR_FLOAT():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_COLOR_FLOAT.THREE_DS_COLOR_FLOAT;

private extern inline function set_THREE_DS_COLOR_FLOAT(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_COLOR_FLOAT.THREE_DS_COLOR_FLOAT = value;

var THREE_DS_EDITOR(get, set):Float;

private extern inline function get_THREE_DS_EDITOR():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_EDITOR.THREE_DS_EDITOR;

private extern inline function set_THREE_DS_EDITOR(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_EDITOR.THREE_DS_EDITOR = value;

var THREE_DS_FACES(get, set):Float;

private extern inline function get_THREE_DS_FACES():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_FACES.THREE_DS_FACES;

private extern inline function set_THREE_DS_FACES(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_FACES.THREE_DS_FACES = value;

var THREE_DS_FACE_MATERIAL(get, set):Float;

private extern inline function get_THREE_DS_FACE_MATERIAL():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_FACE_MATERIAL.THREE_DS_FACE_MATERIAL;

private extern inline function set_THREE_DS_FACE_MATERIAL(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_FACE_MATERIAL.THREE_DS_FACE_MATERIAL = value;

var THREE_DS_KEYFRAME(get, set):Float;

private extern inline function get_THREE_DS_KEYFRAME():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_KEYFRAME.THREE_DS_KEYFRAME;

private extern inline function set_THREE_DS_KEYFRAME(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_KEYFRAME.THREE_DS_KEYFRAME = value;

var THREE_DS_KEYFRAME_NODE_HEADER(get, set):Float;

private extern inline function get_THREE_DS_KEYFRAME_NODE_HEADER():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_KEYFRAME_NODE_HEADER.THREE_DS_KEYFRAME_NODE_HEADER;

private extern inline function set_THREE_DS_KEYFRAME_NODE_HEADER(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_KEYFRAME_NODE_HEADER.THREE_DS_KEYFRAME_NODE_HEADER = value;

var THREE_DS_KEYFRAME_OBJECT_NODE(get, set):Float;

private extern inline function get_THREE_DS_KEYFRAME_OBJECT_NODE():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_KEYFRAME_OBJECT_NODE.THREE_DS_KEYFRAME_OBJECT_NODE;

private extern inline function set_THREE_DS_KEYFRAME_OBJECT_NODE(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_KEYFRAME_OBJECT_NODE.THREE_DS_KEYFRAME_OBJECT_NODE = value;

var THREE_DS_KEYFRAME_PIVOT(get, set):Float;

private extern inline function get_THREE_DS_KEYFRAME_PIVOT():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_KEYFRAME_PIVOT.THREE_DS_KEYFRAME_PIVOT;

private extern inline function set_THREE_DS_KEYFRAME_PIVOT(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_KEYFRAME_PIVOT.THREE_DS_KEYFRAME_PIVOT = value;

var THREE_DS_LIGHT(get, set):Float;

private extern inline function get_THREE_DS_LIGHT():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT.THREE_DS_LIGHT;

private extern inline function set_THREE_DS_LIGHT(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT.THREE_DS_LIGHT = value;

var THREE_DS_LIGHT_INNER_RANGE(get, set):Float;

private extern inline function get_THREE_DS_LIGHT_INNER_RANGE():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_INNER_RANGE.THREE_DS_LIGHT_INNER_RANGE;

private extern inline function set_THREE_DS_LIGHT_INNER_RANGE(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_INNER_RANGE.THREE_DS_LIGHT_INNER_RANGE = value;

var THREE_DS_LIGHT_MULTIPLIER(get, set):Float;

private extern inline function get_THREE_DS_LIGHT_MULTIPLIER():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_MULTIPLIER.THREE_DS_LIGHT_MULTIPLIER;

private extern inline function set_THREE_DS_LIGHT_MULTIPLIER(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_MULTIPLIER.THREE_DS_LIGHT_MULTIPLIER = value;

var THREE_DS_LIGHT_OFF(get, set):Float;

private extern inline function get_THREE_DS_LIGHT_OFF():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_OFF.THREE_DS_LIGHT_OFF;

private extern inline function set_THREE_DS_LIGHT_OFF(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_OFF.THREE_DS_LIGHT_OFF = value;

var THREE_DS_LIGHT_OUTER_RANGE(get, set):Float;

private extern inline function get_THREE_DS_LIGHT_OUTER_RANGE():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_OUTER_RANGE.THREE_DS_LIGHT_OUTER_RANGE;

private extern inline function set_THREE_DS_LIGHT_OUTER_RANGE(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_OUTER_RANGE.THREE_DS_LIGHT_OUTER_RANGE = value;

var THREE_DS_LIGHT_SPOT(get, set):Float;

private extern inline function get_THREE_DS_LIGHT_SPOT():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_SPOT.THREE_DS_LIGHT_SPOT;

private extern inline function set_THREE_DS_LIGHT_SPOT(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_LIGHT_SPOT.THREE_DS_LIGHT_SPOT = value;

var THREE_DS_MAIN(get, set):Float;

private extern inline function get_THREE_DS_MAIN():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MAIN.THREE_DS_MAIN;

private extern inline function set_THREE_DS_MAIN(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MAIN.THREE_DS_MAIN = value;

var THREE_DS_MATERIAL(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL.THREE_DS_MATERIAL;

private extern inline function set_THREE_DS_MATERIAL(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL.THREE_DS_MATERIAL = value;

var THREE_DS_MATERIAL_AMBIENT(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_AMBIENT():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_AMBIENT.THREE_DS_MATERIAL_AMBIENT;

private extern inline function set_THREE_DS_MATERIAL_AMBIENT(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_AMBIENT.THREE_DS_MATERIAL_AMBIENT = value;

var THREE_DS_MATERIAL_BUMP_MAP(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_BUMP_MAP():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_BUMP_MAP.THREE_DS_MATERIAL_BUMP_MAP;

private extern inline function set_THREE_DS_MATERIAL_BUMP_MAP(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_BUMP_MAP.THREE_DS_MATERIAL_BUMP_MAP = value;

var THREE_DS_MATERIAL_DIFFUSE(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_DIFFUSE():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_DIFFUSE.THREE_DS_MATERIAL_DIFFUSE;

private extern inline function set_THREE_DS_MATERIAL_DIFFUSE(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_DIFFUSE.THREE_DS_MATERIAL_DIFFUSE = value;

var THREE_DS_MATERIAL_NAME(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_NAME():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_NAME.THREE_DS_MATERIAL_NAME;

private extern inline function set_THREE_DS_MATERIAL_NAME(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_NAME.THREE_DS_MATERIAL_NAME = value;

var THREE_DS_MATERIAL_OPACITY_MAP(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_OPACITY_MAP():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_OPACITY_MAP.THREE_DS_MATERIAL_OPACITY_MAP;

private extern inline function set_THREE_DS_MATERIAL_OPACITY_MAP(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_OPACITY_MAP.THREE_DS_MATERIAL_OPACITY_MAP = value;

var THREE_DS_MATERIAL_SHININESS(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_SHININESS():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_SHININESS.THREE_DS_MATERIAL_SHININESS;

private extern inline function set_THREE_DS_MATERIAL_SHININESS(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_SHININESS.THREE_DS_MATERIAL_SHININESS = value;

var THREE_DS_MATERIAL_SPECULAR(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_SPECULAR():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_SPECULAR.THREE_DS_MATERIAL_SPECULAR;

private extern inline function set_THREE_DS_MATERIAL_SPECULAR(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_SPECULAR.THREE_DS_MATERIAL_SPECULAR = value;

var THREE_DS_MATERIAL_TEXTURE_FILENAME(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_TEXTURE_FILENAME():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_TEXTURE_FILENAME.THREE_DS_MATERIAL_TEXTURE_FILENAME;

private extern inline function set_THREE_DS_MATERIAL_TEXTURE_FILENAME(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_TEXTURE_FILENAME.THREE_DS_MATERIAL_TEXTURE_FILENAME = value;

var THREE_DS_MATERIAL_TEXTURE_MAP(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_TEXTURE_MAP():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_TEXTURE_MAP.THREE_DS_MATERIAL_TEXTURE_MAP;

private extern inline function set_THREE_DS_MATERIAL_TEXTURE_MAP(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_TEXTURE_MAP.THREE_DS_MATERIAL_TEXTURE_MAP = value;

var THREE_DS_MATERIAL_TRANSPARENCY(get, set):Float;

private extern inline function get_THREE_DS_MATERIAL_TRANSPARENCY():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_TRANSPARENCY.THREE_DS_MATERIAL_TRANSPARENCY;

private extern inline function set_THREE_DS_MATERIAL_TRANSPARENCY(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_MATERIAL_TRANSPARENCY.THREE_DS_MATERIAL_TRANSPARENCY = value;

var THREE_DS_OBJECT(get, set):Float;

private extern inline function get_THREE_DS_OBJECT():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_OBJECT.THREE_DS_OBJECT;

private extern inline function set_THREE_DS_OBJECT(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_OBJECT.THREE_DS_OBJECT = value;

var THREE_DS_PERCENT_FLOAT(get, set):Float;

private extern inline function get_THREE_DS_PERCENT_FLOAT():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_PERCENT_FLOAT.THREE_DS_PERCENT_FLOAT;

private extern inline function set_THREE_DS_PERCENT_FLOAT(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_PERCENT_FLOAT.THREE_DS_PERCENT_FLOAT = value;

var THREE_DS_PERCENT_INT(get, set):Float;

private extern inline function get_THREE_DS_PERCENT_INT():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_PERCENT_INT.THREE_DS_PERCENT_INT;

private extern inline function set_THREE_DS_PERCENT_INT(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_PERCENT_INT.THREE_DS_PERCENT_INT = value;

var THREE_DS_SMOOTH_GROUP(get, set):Float;

private extern inline function get_THREE_DS_SMOOTH_GROUP():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_SMOOTH_GROUP.THREE_DS_SMOOTH_GROUP;

private extern inline function set_THREE_DS_SMOOTH_GROUP(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_SMOOTH_GROUP.THREE_DS_SMOOTH_GROUP = value;

var THREE_DS_TRANSFORM_MATRIX(get, set):Float;

private extern inline function get_THREE_DS_TRANSFORM_MATRIX():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_TRANSFORM_MATRIX.THREE_DS_TRANSFORM_MATRIX;

private extern inline function set_THREE_DS_TRANSFORM_MATRIX(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_TRANSFORM_MATRIX.THREE_DS_TRANSFORM_MATRIX = value;

var THREE_DS_TRIMESH(get, set):Float;

private extern inline function get_THREE_DS_TRIMESH():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_TRIMESH.THREE_DS_TRIMESH;

private extern inline function set_THREE_DS_TRIMESH(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_TRIMESH.THREE_DS_TRIMESH = value;

var THREE_DS_UV_COORDS(get, set):Float;

private extern inline function get_THREE_DS_UV_COORDS():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_UV_COORDS.THREE_DS_UV_COORDS;

private extern inline function set_THREE_DS_UV_COORDS(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_UV_COORDS.THREE_DS_UV_COORDS = value;

var THREE_DS_VERTICES(get, set):Float;

private extern inline function get_THREE_DS_VERTICES():Float return flight._cpp._attempt.Attempt_Types_THREE_DS_VERTICES.THREE_DS_VERTICES;

private extern inline function set_THREE_DS_VERTICES(value:Float):Float return flight._cpp._attempt.Attempt_Types_THREE_DS_VERTICES.THREE_DS_VERTICES = value;

var TextDirectionLeftToRight(get, set):String;

private extern inline function get_TextDirectionLeftToRight():String return flight._cpp._attempt.Attempt_Types_TextDirectionLeftToRight.TextDirectionLeftToRight;

private extern inline function set_TextDirectionLeftToRight(value:String):String return flight._cpp._attempt.Attempt_Types_TextDirectionLeftToRight.TextDirectionLeftToRight = value;

var TextDirectionRightToLeft(get, set):String;

private extern inline function get_TextDirectionRightToLeft():String return flight._cpp._attempt.Attempt_Types_TextDirectionRightToLeft.TextDirectionRightToLeft;

private extern inline function set_TextDirectionRightToLeft(value:String):String return flight._cpp._attempt.Attempt_Types_TextDirectionRightToLeft.TextDirectionRightToLeft = value;

var TextDirectionTopToBottom(get, set):String;

private extern inline function get_TextDirectionTopToBottom():String return flight._cpp._attempt.Attempt_Types_TextDirectionTopToBottom.TextDirectionTopToBottom;

private extern inline function set_TextDirectionTopToBottom(value:String):String return flight._cpp._attempt.Attempt_Types_TextDirectionTopToBottom.TextDirectionTopToBottom = value;

var TextFeatureCapitals(get, set):String;

private extern inline function get_TextFeatureCapitals():String return flight._cpp._attempt.Attempt_Types_TextFeatureCapitals.TextFeatureCapitals;

private extern inline function set_TextFeatureCapitals(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureCapitals.TextFeatureCapitals = value;

var TextFeatureContextualAlternates(get, set):String;

private extern inline function get_TextFeatureContextualAlternates():String return flight._cpp._attempt.Attempt_Types_TextFeatureContextualAlternates.TextFeatureContextualAlternates;

private extern inline function set_TextFeatureContextualAlternates(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureContextualAlternates.TextFeatureContextualAlternates = value;

var TextFeatureDiscretionaryLigatures(get, set):String;

private extern inline function get_TextFeatureDiscretionaryLigatures():String return flight._cpp._attempt.Attempt_Types_TextFeatureDiscretionaryLigatures.TextFeatureDiscretionaryLigatures;

private extern inline function set_TextFeatureDiscretionaryLigatures(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureDiscretionaryLigatures.TextFeatureDiscretionaryLigatures = value;

var TextFeatureFractions(get, set):String;

private extern inline function get_TextFeatureFractions():String return flight._cpp._attempt.Attempt_Types_TextFeatureFractions.TextFeatureFractions;

private extern inline function set_TextFeatureFractions(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureFractions.TextFeatureFractions = value;

var TextFeatureKerning(get, set):String;

private extern inline function get_TextFeatureKerning():String return flight._cpp._attempt.Attempt_Types_TextFeatureKerning.TextFeatureKerning;

private extern inline function set_TextFeatureKerning(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureKerning.TextFeatureKerning = value;

var TextFeatureLigatures(get, set):String;

private extern inline function get_TextFeatureLigatures():String return flight._cpp._attempt.Attempt_Types_TextFeatureLigatures.TextFeatureLigatures;

private extern inline function set_TextFeatureLigatures(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureLigatures.TextFeatureLigatures = value;

var TextFeatureOldStyleFigures(get, set):String;

private extern inline function get_TextFeatureOldStyleFigures():String return flight._cpp._attempt.Attempt_Types_TextFeatureOldStyleFigures.TextFeatureOldStyleFigures;

private extern inline function set_TextFeatureOldStyleFigures(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureOldStyleFigures.TextFeatureOldStyleFigures = value;

var TextFeatureSmallCaps(get, set):String;

private extern inline function get_TextFeatureSmallCaps():String return flight._cpp._attempt.Attempt_Types_TextFeatureSmallCaps.TextFeatureSmallCaps;

private extern inline function set_TextFeatureSmallCaps(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureSmallCaps.TextFeatureSmallCaps = value;

var TextFeatureStylisticAlternates(get, set):String;

private extern inline function get_TextFeatureStylisticAlternates():String return flight._cpp._attempt.Attempt_Types_TextFeatureStylisticAlternates.TextFeatureStylisticAlternates;

private extern inline function set_TextFeatureStylisticAlternates(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureStylisticAlternates.TextFeatureStylisticAlternates = value;

var TextFeatureSubscript(get, set):String;

private extern inline function get_TextFeatureSubscript():String return flight._cpp._attempt.Attempt_Types_TextFeatureSubscript.TextFeatureSubscript;

private extern inline function set_TextFeatureSubscript(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureSubscript.TextFeatureSubscript = value;

var TextFeatureSuperscript(get, set):String;

private extern inline function get_TextFeatureSuperscript():String return flight._cpp._attempt.Attempt_Types_TextFeatureSuperscript.TextFeatureSuperscript;

private extern inline function set_TextFeatureSuperscript(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureSuperscript.TextFeatureSuperscript = value;

var TextFeatureTabularFigures(get, set):String;

private extern inline function get_TextFeatureTabularFigures():String return flight._cpp._attempt.Attempt_Types_TextFeatureTabularFigures.TextFeatureTabularFigures;

private extern inline function set_TextFeatureTabularFigures(value:String):String return flight._cpp._attempt.Attempt_Types_TextFeatureTabularFigures.TextFeatureTabularFigures = value;

var TextLabelKind(get, set):String;

private extern inline function get_TextLabelKind():String return flight._cpp._attempt.Attempt_Types_TextLabelKind.TextLabelKind;

private extern inline function set_TextLabelKind(value:String):String return flight._cpp._attempt.Attempt_Types_TextLabelKind.TextLabelKind = value;

var TextureAtlasFormatKindAseprite(get, set):String;

private extern inline function get_TextureAtlasFormatKindAseprite():String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindAseprite.TextureAtlasFormatKindAseprite;

private extern inline function set_TextureAtlasFormatKindAseprite(value:String):String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindAseprite.TextureAtlasFormatKindAseprite = value;

var TextureAtlasFormatKindCocosPlist(get, set):String;

private extern inline function get_TextureAtlasFormatKindCocosPlist():String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindCocosPlist.TextureAtlasFormatKindCocosPlist;

private extern inline function set_TextureAtlasFormatKindCocosPlist(value:String):String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindCocosPlist.TextureAtlasFormatKindCocosPlist = value;

var TextureAtlasFormatKindLibgdxAtlas(get, set):String;

private extern inline function get_TextureAtlasFormatKindLibgdxAtlas():String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindLibgdxAtlas.TextureAtlasFormatKindLibgdxAtlas;

private extern inline function set_TextureAtlasFormatKindLibgdxAtlas(value:String):String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindLibgdxAtlas.TextureAtlasFormatKindLibgdxAtlas = value;

var TextureAtlasFormatKindStarling(get, set):String;

private extern inline function get_TextureAtlasFormatKindStarling():String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindStarling.TextureAtlasFormatKindStarling;

private extern inline function set_TextureAtlasFormatKindStarling(value:String):String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindStarling.TextureAtlasFormatKindStarling = value;

var TextureAtlasFormatKindTexturePacker(get, set):String;

private extern inline function get_TextureAtlasFormatKindTexturePacker():String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindTexturePacker.TextureAtlasFormatKindTexturePacker;

private extern inline function set_TextureAtlasFormatKindTexturePacker(value:String):String return flight._cpp._attempt.Attempt_Types_TextureAtlasFormatKindTexturePacker.TextureAtlasFormatKindTexturePacker = value;

var TextureKind(get, set):String;

private extern inline function get_TextureKind():String return flight._cpp._attempt.Attempt_Types_TextureKind.TextureKind;

private extern inline function set_TextureKind(value:String):String return flight._cpp._attempt.Attempt_Types_TextureKind.TextureKind = value;

var TilemapFormatKindTiledTmj(get, set):String;

private extern inline function get_TilemapFormatKindTiledTmj():String return flight._cpp._attempt.Attempt_Types_TilemapFormatKindTiledTmj.TilemapFormatKindTiledTmj;

private extern inline function set_TilemapFormatKindTiledTmj(value:String):String return flight._cpp._attempt.Attempt_Types_TilemapFormatKindTiledTmj.TilemapFormatKindTiledTmj = value;

var TilemapFormatKindTiledTmx(get, set):String;

private extern inline function get_TilemapFormatKindTiledTmx():String return flight._cpp._attempt.Attempt_Types_TilemapFormatKindTiledTmx.TilemapFormatKindTiledTmx;

private extern inline function set_TilemapFormatKindTiledTmx(value:String):String return flight._cpp._attempt.Attempt_Types_TilemapFormatKindTiledTmx.TilemapFormatKindTiledTmx = value;

var TilemapFormatKindTiledTsj(get, set):String;

private extern inline function get_TilemapFormatKindTiledTsj():String return flight._cpp._attempt.Attempt_Types_TilemapFormatKindTiledTsj.TilemapFormatKindTiledTsj;

private extern inline function set_TilemapFormatKindTiledTsj(value:String):String return flight._cpp._attempt.Attempt_Types_TilemapFormatKindTiledTsj.TilemapFormatKindTiledTsj = value;

var TilemapFormatKindTiledTsx(get, set):String;

private extern inline function get_TilemapFormatKindTiledTsx():String return flight._cpp._attempt.Attempt_Types_TilemapFormatKindTiledTsx.TilemapFormatKindTiledTsx;

private extern inline function set_TilemapFormatKindTiledTsx(value:String):String return flight._cpp._attempt.Attempt_Types_TilemapFormatKindTiledTsx.TilemapFormatKindTiledTsx = value;

var TilemapKind(get, set):String;

private extern inline function get_TilemapKind():String return flight._cpp._attempt.Attempt_Types_TilemapKind.TilemapKind;

private extern inline function set_TilemapKind(value:String):String return flight._cpp._attempt.Attempt_Types_TilemapKind.TilemapKind = value;

var TimelineAudioCueKind(get, set):String;

private extern inline function get_TimelineAudioCueKind():String return flight._cpp._attempt.Attempt_Types_TimelineAudioCueKind.TimelineAudioCueKind;

private extern inline function set_TimelineAudioCueKind(value:String):String return flight._cpp._attempt.Attempt_Types_TimelineAudioCueKind.TimelineAudioCueKind = value;

var TimelineFrameEntryCause(get, set):{ Advance:String, Seek:String };

private extern inline function get_TimelineFrameEntryCause():{ Advance:String, Seek:String } return flight._cpp._attempt.Attempt_Types_TimelineFrameEntryCause.TimelineFrameEntryCause;

private extern inline function set_TimelineFrameEntryCause(value:{ Advance:String, Seek:String }):{ Advance:String, Seek:String } return flight._cpp._attempt.Attempt_Types_TimelineFrameEntryCause.TimelineFrameEntryCause = value;

var TimelineGotoCueKind(get, set):String;

private extern inline function get_TimelineGotoCueKind():String return flight._cpp._attempt.Attempt_Types_TimelineGotoCueKind.TimelineGotoCueKind;

private extern inline function set_TimelineGotoCueKind(value:String):String return flight._cpp._attempt.Attempt_Types_TimelineGotoCueKind.TimelineGotoCueKind = value;

var TimelineNextFrameCueKind(get, set):String;

private extern inline function get_TimelineNextFrameCueKind():String return flight._cpp._attempt.Attempt_Types_TimelineNextFrameCueKind.TimelineNextFrameCueKind;

private extern inline function set_TimelineNextFrameCueKind(value:String):String return flight._cpp._attempt.Attempt_Types_TimelineNextFrameCueKind.TimelineNextFrameCueKind = value;

var TimelinePlayCueKind(get, set):String;

private extern inline function get_TimelinePlayCueKind():String return flight._cpp._attempt.Attempt_Types_TimelinePlayCueKind.TimelinePlayCueKind;

private extern inline function set_TimelinePlayCueKind(value:String):String return flight._cpp._attempt.Attempt_Types_TimelinePlayCueKind.TimelinePlayCueKind = value;

var TimelinePreviousFrameCueKind(get, set):String;

private extern inline function get_TimelinePreviousFrameCueKind():String return flight._cpp._attempt.Attempt_Types_TimelinePreviousFrameCueKind.TimelinePreviousFrameCueKind;

private extern inline function set_TimelinePreviousFrameCueKind(value:String):String return flight._cpp._attempt.Attempt_Types_TimelinePreviousFrameCueKind.TimelinePreviousFrameCueKind = value;

var TimelineStopCueKind(get, set):String;

private extern inline function get_TimelineStopCueKind():String return flight._cpp._attempt.Attempt_Types_TimelineStopCueKind.TimelineStopCueKind;

private extern inline function set_TimelineStopCueKind(value:String):String return flight._cpp._attempt.Attempt_Types_TimelineStopCueKind.TimelineStopCueKind = value;

var TimelineStreamAudioCueKind(get, set):String;

private extern inline function get_TimelineStreamAudioCueKind():String return flight._cpp._attempt.Attempt_Types_TimelineStreamAudioCueKind.TimelineStreamAudioCueKind;

private extern inline function set_TimelineStreamAudioCueKind(value:String):String return flight._cpp._attempt.Attempt_Types_TimelineStreamAudioCueKind.TimelineStreamAudioCueKind = value;

var ToonMaterialKind(get, set):String;

private extern inline function get_ToonMaterialKind():String return flight._cpp._attempt.Attempt_Types_ToonMaterialKind.ToonMaterialKind;

private extern inline function set_ToonMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_ToonMaterialKind.ToonMaterialKind = value;

var ToonModifierKind(get, set):String;

private extern inline function get_ToonModifierKind():String return flight._cpp._attempt.Attempt_Types_ToonModifierKind.ToonModifierKind;

private extern inline function set_ToonModifierKind(value:String):String return flight._cpp._attempt.Attempt_Types_ToonModifierKind.ToonModifierKind = value;

var TransformMode2D(get, set):{ Normal:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, OnlyTranslation:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoRotationOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScale:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScaleOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool } };

private extern inline function get_TransformMode2D():{ Normal:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, OnlyTranslation:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoRotationOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScale:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScaleOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool } } return flight._cpp._attempt.Attempt_Types_TransformMode2D.TransformMode2D;

private extern inline function set_TransformMode2D(value:{ Normal:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, OnlyTranslation:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoRotationOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScale:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScaleOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool } }):{ Normal:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, OnlyTranslation:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoRotationOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScale:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScaleOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool } } return flight._cpp._attempt.Attempt_Types_TransformMode2D.TransformMode2D = value;

var TransmissionVolumePbrExtensionKind(get, set):String;

private extern inline function get_TransmissionVolumePbrExtensionKind():String return flight._cpp._attempt.Attempt_Types_TransmissionVolumePbrExtensionKind.TransmissionVolumePbrExtensionKind;

private extern inline function set_TransmissionVolumePbrExtensionKind(value:String):String return flight._cpp._attempt.Attempt_Types_TransmissionVolumePbrExtensionKind.TransmissionVolumePbrExtensionKind = value;

var TurbulenceForceKind(get, set):String;

private extern inline function get_TurbulenceForceKind():String return flight._cpp._attempt.Attempt_Types_TurbulenceForceKind.TurbulenceForceKind;

private extern inline function set_TurbulenceForceKind(value:String):String return flight._cpp._attempt.Attempt_Types_TurbulenceForceKind.TurbulenceForceKind = value;

var UnitlessLightUnit(get, set):String;

private extern inline function get_UnitlessLightUnit():String return flight._cpp._attempt.Attempt_Types_UnitlessLightUnit.UnitlessLightUnit;

private extern inline function set_UnitlessLightUnit(value:String):String return flight._cpp._attempt.Attempt_Types_UnitlessLightUnit.UnitlessLightUnit = value;

var UnityParticleFormatKind(get, set):String;

private extern inline function get_UnityParticleFormatKind():String return flight._cpp._attempt.Attempt_Types_UnityParticleFormatKind.UnityParticleFormatKind;

private extern inline function set_UnityParticleFormatKind(value:String):String return flight._cpp._attempt.Attempt_Types_UnityParticleFormatKind.UnityParticleFormatKind = value;

var UnlitMaterialKind(get, set):String;

private extern inline function get_UnlitMaterialKind():String return flight._cpp._attempt.Attempt_Types_UnlitMaterialKind.UnlitMaterialKind;

private extern inline function set_UnlitMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_UnlitMaterialKind.UnlitMaterialKind = value;

var VertexColorMaterialKind(get, set):String;

private extern inline function get_VertexColorMaterialKind():String return flight._cpp._attempt.Attempt_Types_VertexColorMaterialKind.VertexColorMaterialKind;

private extern inline function set_VertexColorMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_VertexColorMaterialKind.VertexColorMaterialKind = value;

var VertexDisplaceModifierKind(get, set):String;

private extern inline function get_VertexDisplaceModifierKind():String return flight._cpp._attempt.Attempt_Types_VertexDisplaceModifierKind.VertexDisplaceModifierKind;

private extern inline function set_VertexDisplaceModifierKind(value:String):String return flight._cpp._attempt.Attempt_Types_VertexDisplaceModifierKind.VertexDisplaceModifierKind = value;

var VertexDisplaceModifierSource(get, set):{ HeightMap:String, Sine:String };

private extern inline function get_VertexDisplaceModifierSource():{ HeightMap:String, Sine:String } return flight._cpp._attempt.Attempt_Types_VertexDisplaceModifierSource.VertexDisplaceModifierSource;

private extern inline function set_VertexDisplaceModifierSource(value:{ HeightMap:String, Sine:String }):{ HeightMap:String, Sine:String } return flight._cpp._attempt.Attempt_Types_VertexDisplaceModifierSource.VertexDisplaceModifierSource = value;

var VortexForceKind(get, set):String;

private extern inline function get_VortexForceKind():String return flight._cpp._attempt.Attempt_Types_VortexForceKind.VortexForceKind;

private extern inline function set_VortexForceKind(value:String):String return flight._cpp._attempt.Attempt_Types_VortexForceKind.VortexForceKind = value;

var VoxelGridTextureSourceKind(get, set):String;

private extern inline function get_VoxelGridTextureSourceKind():String return flight._cpp._attempt.Attempt_Types_VoxelGridTextureSourceKind.VoxelGridTextureSourceKind;

private extern inline function set_VoxelGridTextureSourceKind(value:String):String return flight._cpp._attempt.Attempt_Types_VoxelGridTextureSourceKind.VoxelGridTextureSourceKind = value;

var WellKnownMenuItemRole(get, set):{ copy:String, cut:String, delete:String, paste:String, pasteAndMatchStyle:String, redo:String, selectAll:String, toggleSpellChecker:String, undo:String, about:String, close:String, front:String, hide:String, hideOthers:String, mergeAllWindows:String, minimize:String, moveTabToNewWindow:String, quit:String, selectNextTab:String, selectPreviousTab:String, toggleTabBar:String, unhide:String, zoom:String, forceReload:String, reload:String, resetZoom:String, toggleDevTools:String, toggleFullscreen:String, zoomIn:String, zoomOut:String, help:String, services:String, startSpeaking:String, stopSpeaking:String, clearRecentDocuments:String, recentDocuments:String, appMenu:String, editMenu:String, fileMenu:String, helpMenu:String, shareMenu:String, viewMenu:String, windowMenu:String };

private extern inline function get_WellKnownMenuItemRole():{ copy:String, cut:String, delete:String, paste:String, pasteAndMatchStyle:String, redo:String, selectAll:String, toggleSpellChecker:String, undo:String, about:String, close:String, front:String, hide:String, hideOthers:String, mergeAllWindows:String, minimize:String, moveTabToNewWindow:String, quit:String, selectNextTab:String, selectPreviousTab:String, toggleTabBar:String, unhide:String, zoom:String, forceReload:String, reload:String, resetZoom:String, toggleDevTools:String, toggleFullscreen:String, zoomIn:String, zoomOut:String, help:String, services:String, startSpeaking:String, stopSpeaking:String, clearRecentDocuments:String, recentDocuments:String, appMenu:String, editMenu:String, fileMenu:String, helpMenu:String, shareMenu:String, viewMenu:String, windowMenu:String } return flight._cpp._attempt.Attempt_Types_WellKnownMenuItemRole.WellKnownMenuItemRole;

private extern inline function set_WellKnownMenuItemRole(value:{ copy:String, cut:String, delete:String, paste:String, pasteAndMatchStyle:String, redo:String, selectAll:String, toggleSpellChecker:String, undo:String, about:String, close:String, front:String, hide:String, hideOthers:String, mergeAllWindows:String, minimize:String, moveTabToNewWindow:String, quit:String, selectNextTab:String, selectPreviousTab:String, toggleTabBar:String, unhide:String, zoom:String, forceReload:String, reload:String, resetZoom:String, toggleDevTools:String, toggleFullscreen:String, zoomIn:String, zoomOut:String, help:String, services:String, startSpeaking:String, stopSpeaking:String, clearRecentDocuments:String, recentDocuments:String, appMenu:String, editMenu:String, fileMenu:String, helpMenu:String, shareMenu:String, viewMenu:String, windowMenu:String }):{ copy:String, cut:String, delete:String, paste:String, pasteAndMatchStyle:String, redo:String, selectAll:String, toggleSpellChecker:String, undo:String, about:String, close:String, front:String, hide:String, hideOthers:String, mergeAllWindows:String, minimize:String, moveTabToNewWindow:String, quit:String, selectNextTab:String, selectPreviousTab:String, toggleTabBar:String, unhide:String, zoom:String, forceReload:String, reload:String, resetZoom:String, toggleDevTools:String, toggleFullscreen:String, zoomIn:String, zoomOut:String, help:String, services:String, startSpeaking:String, stopSpeaking:String, clearRecentDocuments:String, recentDocuments:String, appMenu:String, editMenu:String, fileMenu:String, helpMenu:String, shareMenu:String, viewMenu:String, windowMenu:String } return flight._cpp._attempt.Attempt_Types_WellKnownMenuItemRole.WellKnownMenuItemRole = value;

var WindForceKind(get, set):String;

private extern inline function get_WindForceKind():String return flight._cpp._attempt.Attempt_Types_WindForceKind.WindForceKind;

private extern inline function set_WindForceKind(value:String):String return flight._cpp._attempt.Attempt_Types_WindForceKind.WindForceKind = value;

var WireframeMaterialKind(get, set):String;

private extern inline function get_WireframeMaterialKind():String return flight._cpp._attempt.Attempt_Types_WireframeMaterialKind.WireframeMaterialKind;

private extern inline function set_WireframeMaterialKind(value:String):String return flight._cpp._attempt.Attempt_Types_WireframeMaterialKind.WireframeMaterialKind = value;

var WrappedDiffusePbrExtensionKind(get, set):String;

private extern inline function get_WrappedDiffusePbrExtensionKind():String return flight._cpp._attempt.Attempt_Types_WrappedDiffusePbrExtensionKind.WrappedDiffusePbrExtensionKind;

private extern inline function set_WrappedDiffusePbrExtensionKind(value:String):String return flight._cpp._attempt.Attempt_Types_WrappedDiffusePbrExtensionKind.WrappedDiffusePbrExtensionKind = value;
