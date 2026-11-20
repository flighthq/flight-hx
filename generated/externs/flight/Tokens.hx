package flight;

#if (js && flight_esm)
extern inline function createFlightDocumentTokenResolverRegistry():FlightDocumentTokenResolverRegistry {
	return flight._js._fn.Tokens.createFlightDocumentTokenResolverRegistry();
}
#else
extern inline function createFlightDocumentTokenResolverRegistry():FlightDocumentTokenResolverRegistry {
#if hl
	return flight._hl._fn.Tokens.createFlightDocumentTokenResolverRegistry();
#elseif cpp
	return flight._cpp._fn.Tokens.createFlightDocumentTokenResolverRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.Tokens.createFlightDocumentTokenResolverRegistry();
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainFlightDocumentSceneTokenResolution(scene:FlightDocumentScene, mode:String, resolvers:Null<FlightDocumentTokenResolverRegistry>):Null<FlightDocumentRefusalExplanation> {
	return flight._js._fn.Tokens.explainFlightDocumentSceneTokenResolution(scene, mode, resolvers);
}
#else
extern inline function explainFlightDocumentSceneTokenResolution(scene:FlightDocumentScene, mode:String, resolvers:FlightDocumentTokenResolverRegistry):FlightDocumentRefusalExplanation {
#if hl
	return flight._hl._fn.Tokens.explainFlightDocumentSceneTokenResolution(scene, cast mode, resolvers);
#elseif cpp
	return flight._cpp._fn.Tokens.explainFlightDocumentSceneTokenResolution(scene, cast mode, resolvers);
#elseif (js && flight_esm)
	return flight._js._fn.Tokens.explainFlightDocumentSceneTokenResolution(scene, mode, resolvers);
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resolveFlightDocumentSceneTokens(scene:FlightDocumentScene, mode:String, resolvers:Null<FlightDocumentTokenResolverRegistry>):Null<FlightDocumentTokenResolution> {
	return flight._js._fn.Tokens.resolveFlightDocumentSceneTokens(scene, mode, resolvers);
}
#else
extern inline function resolveFlightDocumentSceneTokens(scene:FlightDocumentScene, mode:String, resolvers:FlightDocumentTokenResolverRegistry):FlightDocumentTokenResolution {
#if hl
	return flight._hl._fn.Tokens.resolveFlightDocumentSceneTokens(scene, cast mode, resolvers);
#elseif cpp
	return flight._cpp._fn.Tokens.resolveFlightDocumentSceneTokens(scene, cast mode, resolvers);
#elseif (js && flight_esm)
	return flight._js._fn.Tokens.resolveFlightDocumentSceneTokens(scene, mode, resolvers);
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainFlightDocumentSceneTokenSubstitution(scene:FlightDocumentScene, resolution:FlightDocumentTokenResolution):Null<FlightDocumentRefusalExplanation> {
	return flight._js._fn.Tokens.explainFlightDocumentSceneTokenSubstitution(scene, resolution);
}
#else
extern inline function explainFlightDocumentSceneTokenSubstitution(scene:FlightDocumentScene, resolution:FlightDocumentTokenResolution):FlightDocumentRefusalExplanation {
#if hl
	return flight._hl._fn.Tokens.explainFlightDocumentSceneTokenSubstitution(scene, resolution);
#elseif cpp
	return flight._cpp._fn.Tokens.explainFlightDocumentSceneTokenSubstitution(scene, resolution);
#elseif (js && flight_esm)
	return flight._js._fn.Tokens.explainFlightDocumentSceneTokenSubstitution(scene, resolution);
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function substituteFlightDocumentSceneTokens(scene:FlightDocumentScene, resolution:FlightDocumentTokenResolution):Null<FlightDocumentScene> {
	return flight._js._fn.Tokens.substituteFlightDocumentSceneTokens(scene, resolution);
}
#else
extern inline function substituteFlightDocumentSceneTokens(scene:FlightDocumentScene, resolution:FlightDocumentTokenResolution):FlightDocumentScene {
#if hl
	return flight._hl._fn.Tokens.substituteFlightDocumentSceneTokens(scene, resolution);
#elseif cpp
	return flight._cpp._fn.Tokens.substituteFlightDocumentSceneTokens(scene, resolution);
#elseif (js && flight_esm)
	return flight._js._fn.Tokens.substituteFlightDocumentSceneTokens(scene, resolution);
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFlightDocumentTokenResolverRegistry(ptr:FlightDocumentTokenResolverRegistry):Void {
	flight._js._fn.Tokens.freeFlightDocumentTokenResolverRegistry(ptr);
}
#else
extern inline function freeFlightDocumentTokenResolverRegistry(ptr:FlightDocumentTokenResolverRegistry):Void {
#if hl
	flight._hl._fn.Tokens.freeFlightDocumentTokenResolverRegistry(ptr);
#elseif cpp
	flight._cpp._fn.Tokens.freeFlightDocumentTokenResolverRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tokens.freeFlightDocumentTokenResolverRegistry(ptr);
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFlightDocumentRefusalExplanation(ptr:FlightDocumentRefusalExplanation):Void {
	flight._js._fn.Tokens.freeFlightDocumentRefusalExplanation(ptr);
}
#else
extern inline function freeFlightDocumentRefusalExplanation(ptr:FlightDocumentRefusalExplanation):Void {
#if hl
	flight._hl._fn.Tokens.freeFlightDocumentRefusalExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Tokens.freeFlightDocumentRefusalExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tokens.freeFlightDocumentRefusalExplanation(ptr);
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFlightDocumentTokenResolution(ptr:FlightDocumentTokenResolution):Void {
	flight._js._fn.Tokens.freeFlightDocumentTokenResolution(ptr);
}
#else
extern inline function freeFlightDocumentTokenResolution(ptr:FlightDocumentTokenResolution):Void {
#if hl
	flight._hl._fn.Tokens.freeFlightDocumentTokenResolution(ptr);
#elseif cpp
	flight._cpp._fn.Tokens.freeFlightDocumentTokenResolution(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tokens.freeFlightDocumentTokenResolution(ptr);
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFlightDocumentScene(ptr:FlightDocumentScene):Void {
	flight._js._fn.Tokens.freeFlightDocumentScene(ptr);
}
#else
extern inline function freeFlightDocumentScene(ptr:FlightDocumentScene):Void {
#if hl
	flight._hl._fn.Tokens.freeFlightDocumentScene(ptr);
#elseif cpp
	flight._cpp._fn.Tokens.freeFlightDocumentScene(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tokens.freeFlightDocumentScene(ptr);
#else
	#error "flight.Tokens: no backend for this target."
#end
}
#end
