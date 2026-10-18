// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_FlightDocumentRefusalReason extends AttemptConfig {
  @:native("flight::types::flight_document_refusal_reason")
  public static var FlightDocumentRefusalReason:{ AliasUnsupported:String, AnchorUnsupported:String, BlockScalarUnsupported:String, CollectionEntriesLimitExceeded:String, DefaultSceneOutOfRange:String, DocumentCodeUnitsLimitExceeded:String, DocumentSeparatorUnsupported:String, DuplicateAmbientLight:String, DuplicateDirectionalLight:String, DuplicateKey:String, ExpectedFlowDelimiter:String, ExpectedMappingEntry:String, ExpectedMappingKey:String, ExpectedScalar:String, ExpectedValue:String, FieldInvalid:String, FlowSequenceUnsupported:String, InvalidDocument:String, InvalidEscape:String, InteractiveStateExtensionKindDuplicate:String, InteractiveStateExtensionKindUnregistered:String, InteractiveStateTargetUnsupported:String, InteractiveStateTransitionKindUnregistered:String, KeyCodeUnitsLimitExceeded:String, LayoutTargetAmbiguous:String, LayoutTargetUnresolved:String, MixedCollection:String, MultipleRootValues:String, NestingDepthLimitExceeded:String, NodeKindUnregistered:String, NumberOutOfRange:String, ResourceKindUnregistered:String, ResourceResolverUnregistered:String, ResourceUnresolved:String, RootIndentation:String, RootKindMismatch:String, ScalarCodeUnitsLimitExceeded:String, ScalarInvalid:String, ShapeCommandUnregistered:String, ScenesEmpty:String, StructureInvalid:String, TabCharacter:String, TagUnsupported:String, TokenKeyDuplicate:String, TokenKeyInvalid:String, TokenKindMismatch:String, TokenModeInvalid:String, TokenModeUnresolved:String, TokenReferenceCycle:String, TokenReferenceInvalid:String, TokenResolverUnregistered:String, TokenUnresolved:String, TokenValueInvalid:String, TotalNodesLimitExceeded:String, TrailingFlowComma:String, TrailingFlowContent:String, UnexpectedIndentation:String, UnexpectedToken:String, UnterminatedFlowMapping:String, UnterminatedQuotedScalar:String, VersionUnsupported:String };
}
#end
