package flight._js._fn;

@:jsRequire("@flighthq/tokens")
extern class Tokens {
	@:native("createFlightDocumentTokenResolverRegistry")
	public static function createFlightDocumentTokenResolverRegistry():flight._js.FlightDocumentTokenResolverRegistry;
	@:native("explainFlightDocumentSceneTokenResolution")
	public static function explainFlightDocumentSceneTokenResolution(scene:flight._js.FlightDocumentScene, mode:String, resolvers:Null<flight._js.FlightDocumentTokenResolverRegistry>):Null<flight._js.FlightDocumentRefusalExplanation>;
	@:native("resolveFlightDocumentSceneTokens")
	public static function resolveFlightDocumentSceneTokens(scene:flight._js.FlightDocumentScene, mode:String, resolvers:Null<flight._js.FlightDocumentTokenResolverRegistry>):Null<flight._js.FlightDocumentTokenResolution>;
	@:native("explainFlightDocumentSceneTokenSubstitution")
	public static function explainFlightDocumentSceneTokenSubstitution(scene:flight._js.FlightDocumentScene, resolution:flight._js.FlightDocumentTokenResolution):Null<flight._js.FlightDocumentRefusalExplanation>;
	@:native("substituteFlightDocumentSceneTokens")
	public static function substituteFlightDocumentSceneTokens(scene:flight._js.FlightDocumentScene, resolution:flight._js.FlightDocumentTokenResolution):Null<flight._js.FlightDocumentScene>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFlightDocumentTokenResolverRegistry(ptr:flight._js.FlightDocumentTokenResolverRegistry):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFlightDocumentRefusalExplanation(ptr:flight._js.FlightDocumentRefusalExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFlightDocumentTokenResolution(ptr:flight._js.FlightDocumentTokenResolution):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFlightDocumentScene(ptr:flight._js.FlightDocumentScene):Void {}
}
