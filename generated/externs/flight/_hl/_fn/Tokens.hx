package flight._hl._fn;

extern class Tokens {
	@:hlNative("flight", "flight_create_flight_document_token_resolver_registry")
	public static function createFlightDocumentTokenResolverRegistry():flight._hl.FlightDocumentTokenResolverRegistry;
	@:hlNative("flight", "flight_explain_flight_document_scene_token_resolution")
	public static function explainFlightDocumentSceneTokenResolution(scene:flight._hl.FlightDocumentScene, mode:hl.Bytes, resolvers:flight._hl.FlightDocumentTokenResolverRegistry):flight._hl.FlightDocumentRefusalExplanation;
	@:hlNative("flight", "flight_resolve_flight_document_scene_tokens")
	public static function resolveFlightDocumentSceneTokens(scene:flight._hl.FlightDocumentScene, mode:hl.Bytes, resolvers:flight._hl.FlightDocumentTokenResolverRegistry):flight._hl.FlightDocumentTokenResolution;
	@:hlNative("flight", "flight_explain_flight_document_scene_token_substitution")
	public static function explainFlightDocumentSceneTokenSubstitution(scene:flight._hl.FlightDocumentScene, resolution:flight._hl.FlightDocumentTokenResolution):flight._hl.FlightDocumentRefusalExplanation;
	@:hlNative("flight", "flight_substitute_flight_document_scene_tokens")
	public static function substituteFlightDocumentSceneTokens(scene:flight._hl.FlightDocumentScene, resolution:flight._hl.FlightDocumentTokenResolution):flight._hl.FlightDocumentScene;
	@:hlNative("flight", "flight_free_flight_document_token_resolver_registry")
	public static function freeFlightDocumentTokenResolverRegistry(ptr:flight._hl.FlightDocumentTokenResolverRegistry):Void;
	@:hlNative("flight", "flight_free_flight_document_refusal_explanation")
	public static function freeFlightDocumentRefusalExplanation(ptr:flight._hl.FlightDocumentRefusalExplanation):Void;
	@:hlNative("flight", "flight_free_flight_document_token_resolution")
	public static function freeFlightDocumentTokenResolution(ptr:flight._hl.FlightDocumentTokenResolution):Void;
	@:hlNative("flight", "flight_free_flight_document_scene")
	public static function freeFlightDocumentScene(ptr:flight._hl.FlightDocumentScene):Void;
}
