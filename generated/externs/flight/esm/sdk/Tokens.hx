package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/tokens")
extern class Tokens {
  public static function createFlightDocumentTokenResolverRegistry():flight.esm.types.tokens.Types.FlightDocumentTokenResolverRegistry;
  public static function explainFlightDocumentSceneTokenResolution(scene:flight.esm.types.scene_document.Types.FlightDocumentScene, mode:String, ?resolvers:Null<flight.esm.types.tokens.Types.FlightDocumentTokenResolverRegistry>):Null<flight.esm.types.scene_document.Types.FlightDocumentRefusalExplanation>;
  public static function explainFlightDocumentSceneTokenSubstitution(scene:flight.esm.types.scene_document.Types.FlightDocumentScene, resolution:flight.esm.types.tokens.Types.FlightDocumentTokenResolution):Null<flight.esm.types.scene_document.Types.FlightDocumentRefusalExplanation>;
  public static function resolveFlightDocumentSceneTokens(scene:flight.esm.types.scene_document.Types.FlightDocumentScene, mode:String, ?resolvers:Null<flight.esm.types.tokens.Types.FlightDocumentTokenResolverRegistry>):Null<flight.esm.types.tokens.Types.FlightDocumentTokenResolution>;
  public static function substituteFlightDocumentSceneTokens<T>(scene:T, resolution:flight.esm.types.tokens.Types.FlightDocumentTokenResolution):Null<T>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
