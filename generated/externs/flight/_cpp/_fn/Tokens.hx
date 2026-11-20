package flight._cpp._fn;

extern class Tokens {
	@:native("flight_create_flight_document_token_resolver_registry")
	public static function createFlightDocumentTokenResolverRegistry():flight._cpp.FlightDocumentTokenResolverRegistry;
	@:native("flight_explain_flight_document_scene_token_resolution")
	public static function explainFlightDocumentSceneTokenResolution(scene:flight._cpp.FlightDocumentScene, mode:cpp.ConstCharStar, resolvers:flight._cpp.FlightDocumentTokenResolverRegistry):flight._cpp.FlightDocumentRefusalExplanation;
	@:native("flight_resolve_flight_document_scene_tokens")
	public static function resolveFlightDocumentSceneTokens(scene:flight._cpp.FlightDocumentScene, mode:cpp.ConstCharStar, resolvers:flight._cpp.FlightDocumentTokenResolverRegistry):flight._cpp.FlightDocumentTokenResolution;
	@:native("flight_explain_flight_document_scene_token_substitution")
	public static function explainFlightDocumentSceneTokenSubstitution(scene:flight._cpp.FlightDocumentScene, resolution:flight._cpp.FlightDocumentTokenResolution):flight._cpp.FlightDocumentRefusalExplanation;
	@:native("flight_substitute_flight_document_scene_tokens")
	public static function substituteFlightDocumentSceneTokens(scene:flight._cpp.FlightDocumentScene, resolution:flight._cpp.FlightDocumentTokenResolution):flight._cpp.FlightDocumentScene;
	@:native("flight_free_flight_document_token_resolver_registry")
	public static function freeFlightDocumentTokenResolverRegistry(ptr:flight._cpp.FlightDocumentTokenResolverRegistry):Void;
	@:native("flight_free_flight_document_refusal_explanation")
	public static function freeFlightDocumentRefusalExplanation(ptr:flight._cpp.FlightDocumentRefusalExplanation):Void;
	@:native("flight_free_flight_document_token_resolution")
	public static function freeFlightDocumentTokenResolution(ptr:flight._cpp.FlightDocumentTokenResolution):Void;
	@:native("flight_free_flight_document_scene")
	public static function freeFlightDocumentScene(ptr:flight._cpp.FlightDocumentScene):Void;
}
