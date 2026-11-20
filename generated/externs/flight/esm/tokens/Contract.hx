package flight.esm.tokens;

#if (js && flight_esm)
@:jsRequire("@flighthq/tokens/contract")
extern class Contract {
  public static final INVALID_FLIGHT_DOCUMENT_TOKEN_VALUE:Dynamic;
  public static function createFlightDocumentTokenResolverRegistry():flight.esm.types.tokens.Types.FlightDocumentTokenResolverRegistry;
  public static function explainFlightDocumentSceneTokenResolution(scene:flight.esm.types.scene_document.Types.FlightDocumentScene, mode:String, ?resolvers:Null<flight.esm.types.tokens.Types.FlightDocumentTokenResolverRegistry>):Null<flight.esm.types.scene_document.Types.FlightDocumentRefusalExplanation>;
  public static function explainFlightDocumentSceneTokenSubstitution(scene:flight.esm.types.scene_document.Types.FlightDocumentScene, resolution:flight.esm.types.tokens.Types.FlightDocumentTokenResolution):Null<flight.esm.types.scene_document.Types.FlightDocumentRefusalExplanation>;
  public static function initializeFlightDocumentTokenResolverRegistry(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.tokens.Types.FlightDocumentTokenResolverRegistry>):Void;
  public static function isFlightDocumentTokenReference(value:flight.esm.types.scene_document.Types.FlightDocumentValue):Bool;
  public static function readFlightDocumentTokenReferenceKey(value:String):Null<String>;
  public static function resolveFlightDocumentSceneTokens(scene:flight.esm.types.scene_document.Types.FlightDocumentScene, mode:String, ?resolvers:Null<flight.esm.types.tokens.Types.FlightDocumentTokenResolverRegistry>):Null<flight.esm.types.tokens.Types.FlightDocumentTokenResolution>;
  public static function substituteFlightDocumentSceneTokens<T>(scene:T, resolution:flight.esm.types.tokens.Types.FlightDocumentTokenResolution):Null<T>;
  public static function substituteFlightDocumentTokenValue(value:flight.esm.types.scene_document.Types.FlightDocumentValue, path:String, lookup:((key:String, path:String) -> Dynamic), refuseMalformed:((path:String) -> Void)):Dynamic;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
