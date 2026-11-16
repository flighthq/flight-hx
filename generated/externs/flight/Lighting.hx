package flight;

#if (js && flight_esm)
extern inline function createAmbientLight():AmbientLight {
	return flight._js._fn.Lighting.createAmbientLight();
}
#else
extern inline function createAmbientLight():AmbientLight {
#if hl
	return flight._hl._fn.Lighting.createAmbientLight();
#elseif cpp
	return flight._cpp._fn.Lighting.createAmbientLight();
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createAmbientLight();
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneAmbientLight(source:AmbientLight):AmbientLight {
	return flight._js._fn.Lighting.cloneAmbientLight(source);
}
#else
extern inline function cloneAmbientLight(source:AmbientLight):AmbientLight {
#if hl
	return flight._hl._fn.Lighting.cloneAmbientLight(source);
#elseif cpp
	return flight._cpp._fn.Lighting.cloneAmbientLight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.cloneAmbientLight(source);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createAreaLight():AreaLight {
	return flight._js._fn.Lighting.createAreaLight();
}
#else
extern inline function createAreaLight():AreaLight {
#if hl
	return flight._hl._fn.Lighting.createAreaLight();
#elseif cpp
	return flight._cpp._fn.Lighting.createAreaLight();
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createAreaLight();
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneAreaLight(source:AreaLight):AreaLight {
	return flight._js._fn.Lighting.cloneAreaLight(source);
}
#else
extern inline function cloneAreaLight(source:AreaLight):AreaLight {
#if hl
	return flight._hl._fn.Lighting.cloneAreaLight(source);
#elseif cpp
	return flight._cpp._fn.Lighting.cloneAreaLight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.cloneAreaLight(source);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setAreaLightOrientation(out:AreaLight, direction:Vector3, right:Vector3, up:Vector3):Void {
	flight._js._fn.Lighting.setAreaLightOrientation(out, direction, right, up);
}
#else
extern inline function setAreaLightOrientation(out:AreaLight, direction:Vector3, right:Vector3, up:Vector3):Void {
#if hl
	flight._hl._fn.Lighting.setAreaLightOrientation(out, direction, right, up);
#elseif cpp
	flight._cpp._fn.Lighting.setAreaLightOrientation(out, direction, right, up);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setAreaLightOrientation(out, direction, right, up);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createDirectionalLight(options:Null<DirectionalLightOptions>):DirectionalLight {
	return flight._js._fn.Lighting.createDirectionalLight(options);
}
#else
extern inline function createDirectionalLight(options:DirectionalLightOptions):DirectionalLight {
#if hl
	return flight._hl._fn.Lighting.createDirectionalLight(options);
#elseif cpp
	return flight._cpp._fn.Lighting.createDirectionalLight(options);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createDirectionalLight(options);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneDirectionalLight(source:DirectionalLight):DirectionalLight {
	return flight._js._fn.Lighting.cloneDirectionalLight(source);
}
#else
extern inline function cloneDirectionalLight(source:DirectionalLight):DirectionalLight {
#if hl
	return flight._hl._fn.Lighting.cloneDirectionalLight(source);
#elseif cpp
	return flight._cpp._fn.Lighting.cloneDirectionalLight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.cloneDirectionalLight(source);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setDirectionalLightDirection(out:DirectionalLight, x:Float, y:Float, z:Float):Void {
	flight._js._fn.Lighting.setDirectionalLightDirection(out, x, y, z);
}
#else
extern inline function setDirectionalLightDirection(out:DirectionalLight, x:Float, y:Float, z:Float):Void {
#if hl
	flight._hl._fn.Lighting.setDirectionalLightDirection(out, x, y, z);
#elseif cpp
	flight._cpp._fn.Lighting.setDirectionalLightDirection(out, x, y, z);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setDirectionalLightDirection(out, x, y, z);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setDirectionalLightTarget(out:DirectionalLight, fromX:Float, fromY:Float, fromZ:Float, toX:Float, toY:Float, toZ:Float):Void {
	flight._js._fn.Lighting.setDirectionalLightTarget(out, fromX, fromY, fromZ, toX, toY, toZ);
}
#else
extern inline function setDirectionalLightTarget(out:DirectionalLight, fromX:Float, fromY:Float, fromZ:Float, toX:Float, toY:Float, toZ:Float):Void {
#if hl
	flight._hl._fn.Lighting.setDirectionalLightTarget(out, fromX, fromY, fromZ, toX, toY, toZ);
#elseif cpp
	flight._cpp._fn.Lighting.setDirectionalLightTarget(out, fromX, fromY, fromZ, toX, toY, toZ);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setDirectionalLightTarget(out, fromX, fromY, fromZ, toX, toY, toZ);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createEnvironment():Environment {
	return flight._js._fn.Lighting.createEnvironment();
}
#else
extern inline function createEnvironment():Environment {
#if hl
	return flight._hl._fn.Lighting.createEnvironment();
#elseif cpp
	return flight._cpp._fn.Lighting.createEnvironment();
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createEnvironment();
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneEnvironment(source:Environment):Environment {
	return flight._js._fn.Lighting.cloneEnvironment(source);
}
#else
extern inline function cloneEnvironment(source:Environment):Environment {
#if hl
	return flight._hl._fn.Lighting.cloneEnvironment(source);
#elseif cpp
	return flight._cpp._fn.Lighting.cloneEnvironment(source);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.cloneEnvironment(source);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createHemisphereLight():HemisphereLight {
	return flight._js._fn.Lighting.createHemisphereLight();
}
#else
extern inline function createHemisphereLight():HemisphereLight {
#if hl
	return flight._hl._fn.Lighting.createHemisphereLight();
#elseif cpp
	return flight._cpp._fn.Lighting.createHemisphereLight();
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createHemisphereLight();
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneHemisphereLight(source:HemisphereLight):HemisphereLight {
	return flight._js._fn.Lighting.cloneHemisphereLight(source);
}
#else
extern inline function cloneHemisphereLight(source:HemisphereLight):HemisphereLight {
#if hl
	return flight._hl._fn.Lighting.cloneHemisphereLight(source);
#elseif cpp
	return flight._cpp._fn.Lighting.cloneHemisphereLight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.cloneHemisphereLight(source);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightContributionAtBoundingSpherePointLight(light:PointLight, bounds:BoundingSphere):Float {
	return flight._js._fn.Lighting.getLightContributionAtBoundingSpherePointLight(light, bounds);
}
#else
extern inline function getLightContributionAtBoundingSpherePointLight(light:PointLight, bounds:BoundingSphere):Float {
#if hl
	return flight._hl._fn.Lighting.getLightContributionAtBoundingSpherePointLight(light, bounds);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightContributionAtBoundingSpherePointLight(light, bounds);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightContributionAtBoundingSpherePointLight(light, bounds);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightContributionAtBoundingSphereSpotLight(light:SpotLight, bounds:BoundingSphere):Float {
	return flight._js._fn.Lighting.getLightContributionAtBoundingSphereSpotLight(light, bounds);
}
#else
extern inline function getLightContributionAtBoundingSphereSpotLight(light:SpotLight, bounds:BoundingSphere):Float {
#if hl
	return flight._hl._fn.Lighting.getLightContributionAtBoundingSphereSpotLight(light, bounds);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightContributionAtBoundingSphereSpotLight(light, bounds);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightContributionAtBoundingSphereSpotLight(light, bounds);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightInfluenceBoundsAmbientLight(out:BoundingSphere, light:AmbientLight):Void {
	flight._js._fn.Lighting.getLightInfluenceBoundsAmbientLight(out, light);
}
#else
extern inline function getLightInfluenceBoundsAmbientLight(out:BoundingSphere, light:AmbientLight):Void {
#if hl
	flight._hl._fn.Lighting.getLightInfluenceBoundsAmbientLight(out, light);
#elseif cpp
	flight._cpp._fn.Lighting.getLightInfluenceBoundsAmbientLight(out, light);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.getLightInfluenceBoundsAmbientLight(out, light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightInfluenceBoundsDirectionalLight(out:BoundingSphere, light:DirectionalLight):Void {
	flight._js._fn.Lighting.getLightInfluenceBoundsDirectionalLight(out, light);
}
#else
extern inline function getLightInfluenceBoundsDirectionalLight(out:BoundingSphere, light:DirectionalLight):Void {
#if hl
	flight._hl._fn.Lighting.getLightInfluenceBoundsDirectionalLight(out, light);
#elseif cpp
	flight._cpp._fn.Lighting.getLightInfluenceBoundsDirectionalLight(out, light);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.getLightInfluenceBoundsDirectionalLight(out, light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightInfluenceBoundsEnvironment(out:BoundingSphere, light:Environment):Void {
	flight._js._fn.Lighting.getLightInfluenceBoundsEnvironment(out, light);
}
#else
extern inline function getLightInfluenceBoundsEnvironment(out:BoundingSphere, light:Environment):Void {
#if hl
	flight._hl._fn.Lighting.getLightInfluenceBoundsEnvironment(out, light);
#elseif cpp
	flight._cpp._fn.Lighting.getLightInfluenceBoundsEnvironment(out, light);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.getLightInfluenceBoundsEnvironment(out, light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightInfluenceBoundsHemisphereLight(out:BoundingSphere, light:HemisphereLight):Void {
	flight._js._fn.Lighting.getLightInfluenceBoundsHemisphereLight(out, light);
}
#else
extern inline function getLightInfluenceBoundsHemisphereLight(out:BoundingSphere, light:HemisphereLight):Void {
#if hl
	flight._hl._fn.Lighting.getLightInfluenceBoundsHemisphereLight(out, light);
#elseif cpp
	flight._cpp._fn.Lighting.getLightInfluenceBoundsHemisphereLight(out, light);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.getLightInfluenceBoundsHemisphereLight(out, light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightLuminanceAmbientLight(light:AmbientLight):Float {
	return flight._js._fn.Lighting.getLightLuminanceAmbientLight(light);
}
#else
extern inline function getLightLuminanceAmbientLight(light:AmbientLight):Float {
#if hl
	return flight._hl._fn.Lighting.getLightLuminanceAmbientLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightLuminanceAmbientLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightLuminanceAmbientLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightLuminanceDirectionalLight(light:DirectionalLight):Float {
	return flight._js._fn.Lighting.getLightLuminanceDirectionalLight(light);
}
#else
extern inline function getLightLuminanceDirectionalLight(light:DirectionalLight):Float {
#if hl
	return flight._hl._fn.Lighting.getLightLuminanceDirectionalLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightLuminanceDirectionalLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightLuminanceDirectionalLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightLuminanceEnvironment(light:Environment):Float {
	return flight._js._fn.Lighting.getLightLuminanceEnvironment(light);
}
#else
extern inline function getLightLuminanceEnvironment(light:Environment):Float {
#if hl
	return flight._hl._fn.Lighting.getLightLuminanceEnvironment(light);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightLuminanceEnvironment(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightLuminanceEnvironment(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightLuminanceHemisphereLight(light:HemisphereLight):Float {
	return flight._js._fn.Lighting.getLightLuminanceHemisphereLight(light);
}
#else
extern inline function getLightLuminanceHemisphereLight(light:HemisphereLight):Float {
#if hl
	return flight._hl._fn.Lighting.getLightLuminanceHemisphereLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightLuminanceHemisphereLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightLuminanceHemisphereLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasLightInfluenceOnBoundsAmbientLight(light:AmbientLight, bounds:BoundingSphere):Bool {
	return flight._js._fn.Lighting.hasLightInfluenceOnBoundsAmbientLight(light, bounds);
}
#else
extern inline function hasLightInfluenceOnBoundsAmbientLight(light:AmbientLight, bounds:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Lighting.hasLightInfluenceOnBoundsAmbientLight(light, bounds);
#elseif cpp
	return flight._cpp._fn.Lighting.hasLightInfluenceOnBoundsAmbientLight(light, bounds);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.hasLightInfluenceOnBoundsAmbientLight(light, bounds);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasLightInfluenceOnBoundsDirectionalLight(light:DirectionalLight, bounds:BoundingSphere):Bool {
	return flight._js._fn.Lighting.hasLightInfluenceOnBoundsDirectionalLight(light, bounds);
}
#else
extern inline function hasLightInfluenceOnBoundsDirectionalLight(light:DirectionalLight, bounds:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Lighting.hasLightInfluenceOnBoundsDirectionalLight(light, bounds);
#elseif cpp
	return flight._cpp._fn.Lighting.hasLightInfluenceOnBoundsDirectionalLight(light, bounds);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.hasLightInfluenceOnBoundsDirectionalLight(light, bounds);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasLightInfluenceOnBoundsEnvironment(light:Environment, bounds:BoundingSphere):Bool {
	return flight._js._fn.Lighting.hasLightInfluenceOnBoundsEnvironment(light, bounds);
}
#else
extern inline function hasLightInfluenceOnBoundsEnvironment(light:Environment, bounds:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Lighting.hasLightInfluenceOnBoundsEnvironment(light, bounds);
#elseif cpp
	return flight._cpp._fn.Lighting.hasLightInfluenceOnBoundsEnvironment(light, bounds);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.hasLightInfluenceOnBoundsEnvironment(light, bounds);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasLightInfluenceOnBoundsHemisphereLight(light:HemisphereLight, bounds:BoundingSphere):Bool {
	return flight._js._fn.Lighting.hasLightInfluenceOnBoundsHemisphereLight(light, bounds);
}
#else
extern inline function hasLightInfluenceOnBoundsHemisphereLight(light:HemisphereLight, bounds:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Lighting.hasLightInfluenceOnBoundsHemisphereLight(light, bounds);
#elseif cpp
	return flight._cpp._fn.Lighting.hasLightInfluenceOnBoundsHemisphereLight(light, bounds);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.hasLightInfluenceOnBoundsHemisphereLight(light, bounds);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isLightCastingShadowAmbientLight(light:AmbientLight):Bool {
	return flight._js._fn.Lighting.isLightCastingShadowAmbientLight(light);
}
#else
extern inline function isLightCastingShadowAmbientLight(light:AmbientLight):Bool {
#if hl
	return flight._hl._fn.Lighting.isLightCastingShadowAmbientLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.isLightCastingShadowAmbientLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.isLightCastingShadowAmbientLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isLightCastingShadowDirectionalLight(light:DirectionalLight):Bool {
	return flight._js._fn.Lighting.isLightCastingShadowDirectionalLight(light);
}
#else
extern inline function isLightCastingShadowDirectionalLight(light:DirectionalLight):Bool {
#if hl
	return flight._hl._fn.Lighting.isLightCastingShadowDirectionalLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.isLightCastingShadowDirectionalLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.isLightCastingShadowDirectionalLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isLightCastingShadowEnvironment(light:Environment):Bool {
	return flight._js._fn.Lighting.isLightCastingShadowEnvironment(light);
}
#else
extern inline function isLightCastingShadowEnvironment(light:Environment):Bool {
#if hl
	return flight._hl._fn.Lighting.isLightCastingShadowEnvironment(light);
#elseif cpp
	return flight._cpp._fn.Lighting.isLightCastingShadowEnvironment(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.isLightCastingShadowEnvironment(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isLightCastingShadowHemisphereLight(light:HemisphereLight):Bool {
	return flight._js._fn.Lighting.isLightCastingShadowHemisphereLight(light);
}
#else
extern inline function isLightCastingShadowHemisphereLight(light:HemisphereLight):Bool {
#if hl
	return flight._hl._fn.Lighting.isLightCastingShadowHemisphereLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.isLightCastingShadowHemisphereLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.isLightCastingShadowHemisphereLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyLightExposure(intensity:Float, ev:Float):Float {
	return flight._js._fn.Lighting.applyLightExposure(intensity, ev);
}
#else
extern inline function applyLightExposure(intensity:Float, ev:Float):Float {
#if hl
	return flight._hl._fn.Lighting.applyLightExposure(intensity, ev);
#elseif cpp
	return flight._cpp._fn.Lighting.applyLightExposure(intensity, ev);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.applyLightExposure(intensity, ev);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function convertLightIntensity(fromUnit:Dynamic, toUnit:Dynamic, value:Float):Float {
	return flight._js._fn.Lighting.convertLightIntensity(fromUnit, toUnit, value);
}
#else
extern inline function convertLightIntensity(fromUnit:flight.LightUnit, toUnit:flight.LightUnit, value:Float):Float {
#if hl
	return flight._hl._fn.Lighting.convertLightIntensity(fromUnit, toUnit, value);
#elseif cpp
	return flight._cpp._fn.Lighting.convertLightIntensity(fromUnit, toUnit, value);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.convertLightIntensity(fromUnit, toUnit, value);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightLinearIntensity(unit:Dynamic, value:Float):Float {
	return flight._js._fn.Lighting.getLightLinearIntensity(unit, value);
}
#else
extern inline function getLightLinearIntensity(unit:flight.LightUnit, value:Float):Float {
#if hl
	return flight._hl._fn.Lighting.getLightLinearIntensity(unit, value);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightLinearIntensity(unit, value);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightLinearIntensity(unit, value);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightPhotometricIntensityAmbientLight(light:AmbientLight):Float {
	return flight._js._fn.Lighting.getLightPhotometricIntensityAmbientLight(light);
}
#else
extern inline function getLightPhotometricIntensityAmbientLight(light:AmbientLight):Float {
#if hl
	return flight._hl._fn.Lighting.getLightPhotometricIntensityAmbientLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightPhotometricIntensityAmbientLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightPhotometricIntensityAmbientLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightPhotometricIntensityDirectionalLight(light:DirectionalLight):Float {
	return flight._js._fn.Lighting.getLightPhotometricIntensityDirectionalLight(light);
}
#else
extern inline function getLightPhotometricIntensityDirectionalLight(light:DirectionalLight):Float {
#if hl
	return flight._hl._fn.Lighting.getLightPhotometricIntensityDirectionalLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightPhotometricIntensityDirectionalLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightPhotometricIntensityDirectionalLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLightPhotometricIntensityHemisphereLight(light:HemisphereLight):Float {
	return flight._js._fn.Lighting.getLightPhotometricIntensityHemisphereLight(light);
}
#else
extern inline function getLightPhotometricIntensityHemisphereLight(light:HemisphereLight):Float {
#if hl
	return flight._hl._fn.Lighting.getLightPhotometricIntensityHemisphereLight(light);
#elseif cpp
	return flight._cpp._fn.Lighting.getLightPhotometricIntensityHemisphereLight(light);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.getLightPhotometricIntensityHemisphereLight(light);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setLightPhotometricIntensityAmbientLight(out:AmbientLight, value:Float):Void {
	flight._js._fn.Lighting.setLightPhotometricIntensityAmbientLight(out, value);
}
#else
extern inline function setLightPhotometricIntensityAmbientLight(out:AmbientLight, value:Float):Void {
#if hl
	flight._hl._fn.Lighting.setLightPhotometricIntensityAmbientLight(out, value);
#elseif cpp
	flight._cpp._fn.Lighting.setLightPhotometricIntensityAmbientLight(out, value);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setLightPhotometricIntensityAmbientLight(out, value);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setLightPhotometricIntensityDirectionalLight(out:DirectionalLight, value:Float):Void {
	flight._js._fn.Lighting.setLightPhotometricIntensityDirectionalLight(out, value);
}
#else
extern inline function setLightPhotometricIntensityDirectionalLight(out:DirectionalLight, value:Float):Void {
#if hl
	flight._hl._fn.Lighting.setLightPhotometricIntensityDirectionalLight(out, value);
#elseif cpp
	flight._cpp._fn.Lighting.setLightPhotometricIntensityDirectionalLight(out, value);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setLightPhotometricIntensityDirectionalLight(out, value);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setLightPhotometricIntensityHemisphereLight(out:HemisphereLight, value:Float):Void {
	flight._js._fn.Lighting.setLightPhotometricIntensityHemisphereLight(out, value);
}
#else
extern inline function setLightPhotometricIntensityHemisphereLight(out:HemisphereLight, value:Float):Void {
#if hl
	flight._hl._fn.Lighting.setLightPhotometricIntensityHemisphereLight(out, value);
#elseif cpp
	flight._cpp._fn.Lighting.setLightPhotometricIntensityHemisphereLight(out, value);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setLightPhotometricIntensityHemisphereLight(out, value);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createLightProbe(position:Vector3, shCoefficients:Null<Dynamic>):LightProbe {
	return flight._js._fn.Lighting.createLightProbe(position, shCoefficients);
}
#else
extern inline function createLightProbe(position:Vector3, shCoefficients:Dynamic, shCoefficientsLen:Int):LightProbe {
#if hl
	return flight._hl._fn.Lighting.createLightProbe(position, shCoefficients, shCoefficientsLen);
#elseif cpp
	return flight._cpp._fn.Lighting.createLightProbe(position, shCoefficients, shCoefficientsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createLightProbe(position, shCoefficients, shCoefficientsLen);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function evaluateLightProbeSh(out:Dynamic, normal:Vector3, shCoefficients:Dynamic):Void {
	flight._js._fn.Lighting.evaluateLightProbeSh(out, normal, shCoefficients);
}
#else
extern inline function evaluateLightProbeSh(out:Dynamic, outLen:Int, normal:Vector3, shCoefficients:Dynamic, shCoefficientsLen:Int):Void {
#if hl
	flight._hl._fn.Lighting.evaluateLightProbeSh(out, outLen, normal, shCoefficients, shCoefficientsLen);
#elseif cpp
	flight._cpp._fn.Lighting.evaluateLightProbeSh(out, outLen, normal, shCoefficients, shCoefficientsLen);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.evaluateLightProbeSh(out, outLen, normal, shCoefficients, shCoefficientsLen);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function sampleLightProbeGrid(out:Dynamic, position:Vector3, grid:LightProbeGrid):Bool {
	return flight._js._fn.Lighting.sampleLightProbeGrid(out, position, grid);
}
#else
extern inline function sampleLightProbeGrid(out:Dynamic, outLen:Int, position:Vector3, grid:LightProbeGrid):Bool {
#if hl
	return flight._hl._fn.Lighting.sampleLightProbeGrid(out, outLen, position, grid);
#elseif cpp
	return flight._cpp._fn.Lighting.sampleLightProbeGrid(out, outLen, position, grid);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.sampleLightProbeGrid(out, outLen, position, grid);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setLightProbeShFromColors(target:LightProbe, colors:Dynamic, directions:Dynamic):Void {
	flight._js._fn.Lighting.setLightProbeShFromColors(target, colors, directions);
}
#else
extern inline function setLightProbeShFromColors(target:LightProbe, colors:Dynamic, colorsLen:Int, directions:Dynamic, directionsLen:Int):Void {
#if hl
	flight._hl._fn.Lighting.setLightProbeShFromColors(target, colors, colorsLen, directions, directionsLen);
#elseif cpp
	flight._cpp._fn.Lighting.setLightProbeShFromColors(target, colors, colorsLen, directions, directionsLen);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setLightProbeShFromColors(target, colors, colorsLen, directions, directionsLen);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPointLight():PointLight {
	return flight._js._fn.Lighting.createPointLight();
}
#else
extern inline function createPointLight():PointLight {
#if hl
	return flight._hl._fn.Lighting.createPointLight();
#elseif cpp
	return flight._cpp._fn.Lighting.createPointLight();
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createPointLight();
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clonePointLight(source:PointLight):PointLight {
	return flight._js._fn.Lighting.clonePointLight(source);
}
#else
extern inline function clonePointLight(source:PointLight):PointLight {
#if hl
	return flight._hl._fn.Lighting.clonePointLight(source);
#elseif cpp
	return flight._cpp._fn.Lighting.clonePointLight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.clonePointLight(source);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function selectScene3dForwardLights(out:Scene3DForwardLightSelection, lights:Scene3DLights, bounds:BoundingSphere, receiverLayerMask:Null<Int>):Void {
	flight._js._fn.Lighting.selectScene3dForwardLights(out, lights, bounds, receiverLayerMask);
}
#else
extern inline function selectScene3dForwardLights(out:Scene3DForwardLightSelection, lights:Scene3DLights, bounds:BoundingSphere, receiverLayerMask:Int):Void {
#if hl
	flight._hl._fn.Lighting.selectScene3dForwardLights(out, lights, bounds, receiverLayerMask);
#elseif cpp
	flight._cpp._fn.Lighting.selectScene3dForwardLights(out, lights, bounds, receiverLayerMask);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.selectScene3dForwardLights(out, lights, bounds, receiverLayerMask);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene3dLights():Scene3DLights {
	return flight._js._fn.Lighting.createScene3dLights();
}
#else
extern inline function createScene3dLights():Scene3DLights {
#if hl
	return flight._hl._fn.Lighting.createScene3dLights();
#elseif cpp
	return flight._cpp._fn.Lighting.createScene3dLights();
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createScene3dLights();
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpotLight(options:Null<SpotLightOptions>):SpotLight {
	return flight._js._fn.Lighting.createSpotLight(options);
}
#else
extern inline function createSpotLight(options:SpotLightOptions):SpotLight {
#if hl
	return flight._hl._fn.Lighting.createSpotLight(options);
#elseif cpp
	return flight._cpp._fn.Lighting.createSpotLight(options);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.createSpotLight(options);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneSpotLight(source:SpotLight):SpotLight {
	return flight._js._fn.Lighting.cloneSpotLight(source);
}
#else
extern inline function cloneSpotLight(source:SpotLight):SpotLight {
#if hl
	return flight._hl._fn.Lighting.cloneSpotLight(source);
#elseif cpp
	return flight._cpp._fn.Lighting.cloneSpotLight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Lighting.cloneSpotLight(source);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSpotLightConeDegrees(out:SpotLightConeAngles, source:SpotLight):Void {
	flight._js._fn.Lighting.getSpotLightConeDegrees(out, source);
}
#else
extern inline function getSpotLightConeDegrees(out:SpotLightConeAngles, source:SpotLight):Void {
#if hl
	flight._hl._fn.Lighting.getSpotLightConeDegrees(out, source);
#elseif cpp
	flight._cpp._fn.Lighting.getSpotLightConeDegrees(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.getSpotLightConeDegrees(out, source);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setSpotLightBlend(out:SpotLight, blend:Float):Void {
	flight._js._fn.Lighting.setSpotLightBlend(out, blend);
}
#else
extern inline function setSpotLightBlend(out:SpotLight, blend:Float):Void {
#if hl
	flight._hl._fn.Lighting.setSpotLightBlend(out, blend);
#elseif cpp
	flight._cpp._fn.Lighting.setSpotLightBlend(out, blend);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setSpotLightBlend(out, blend);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setSpotLightCone(out:SpotLight, innerDegrees:Float, outerDegrees:Float):Void {
	flight._js._fn.Lighting.setSpotLightCone(out, innerDegrees, outerDegrees);
}
#else
extern inline function setSpotLightCone(out:SpotLight, innerDegrees:Float, outerDegrees:Float):Void {
#if hl
	flight._hl._fn.Lighting.setSpotLightCone(out, innerDegrees, outerDegrees);
#elseif cpp
	flight._cpp._fn.Lighting.setSpotLightCone(out, innerDegrees, outerDegrees);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setSpotLightCone(out, innerDegrees, outerDegrees);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setSpotLightDirection(out:SpotLight, x:Float, y:Float, z:Float):Void {
	flight._js._fn.Lighting.setSpotLightDirection(out, x, y, z);
}
#else
extern inline function setSpotLightDirection(out:SpotLight, x:Float, y:Float, z:Float):Void {
#if hl
	flight._hl._fn.Lighting.setSpotLightDirection(out, x, y, z);
#elseif cpp
	flight._cpp._fn.Lighting.setSpotLightDirection(out, x, y, z);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setSpotLightDirection(out, x, y, z);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setSpotLightTarget(out:SpotLight, targetX:Float, targetY:Float, targetZ:Float):Void {
	flight._js._fn.Lighting.setSpotLightTarget(out, targetX, targetY, targetZ);
}
#else
extern inline function setSpotLightTarget(out:SpotLight, targetX:Float, targetY:Float, targetZ:Float):Void {
#if hl
	flight._hl._fn.Lighting.setSpotLightTarget(out, targetX, targetY, targetZ);
#elseif cpp
	flight._cpp._fn.Lighting.setSpotLightTarget(out, targetX, targetY, targetZ);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.setSpotLightTarget(out, targetX, targetY, targetZ);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAmbientLight(ptr:AmbientLight):Void {
	flight._js._fn.Lighting.freeAmbientLight(ptr);
}
#else
extern inline function freeAmbientLight(ptr:AmbientLight):Void {
#if hl
	flight._hl._fn.Lighting.freeAmbientLight(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freeAmbientLight(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freeAmbientLight(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAreaLight(ptr:AreaLight):Void {
	flight._js._fn.Lighting.freeAreaLight(ptr);
}
#else
extern inline function freeAreaLight(ptr:AreaLight):Void {
#if hl
	flight._hl._fn.Lighting.freeAreaLight(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freeAreaLight(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freeAreaLight(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDirectionalLight(ptr:DirectionalLight):Void {
	flight._js._fn.Lighting.freeDirectionalLight(ptr);
}
#else
extern inline function freeDirectionalLight(ptr:DirectionalLight):Void {
#if hl
	flight._hl._fn.Lighting.freeDirectionalLight(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freeDirectionalLight(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freeDirectionalLight(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeEnvironment(ptr:Environment):Void {
	flight._js._fn.Lighting.freeEnvironment(ptr);
}
#else
extern inline function freeEnvironment(ptr:Environment):Void {
#if hl
	flight._hl._fn.Lighting.freeEnvironment(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freeEnvironment(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freeEnvironment(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeHemisphereLight(ptr:HemisphereLight):Void {
	flight._js._fn.Lighting.freeHemisphereLight(ptr);
}
#else
extern inline function freeHemisphereLight(ptr:HemisphereLight):Void {
#if hl
	flight._hl._fn.Lighting.freeHemisphereLight(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freeHemisphereLight(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freeHemisphereLight(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLightProbe(ptr:LightProbe):Void {
	flight._js._fn.Lighting.freeLightProbe(ptr);
}
#else
extern inline function freeLightProbe(ptr:LightProbe):Void {
#if hl
	flight._hl._fn.Lighting.freeLightProbe(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freeLightProbe(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freeLightProbe(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePointLight(ptr:PointLight):Void {
	flight._js._fn.Lighting.freePointLight(ptr);
}
#else
extern inline function freePointLight(ptr:PointLight):Void {
#if hl
	flight._hl._fn.Lighting.freePointLight(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freePointLight(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freePointLight(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene3Dlights(ptr:Scene3DLights):Void {
	flight._js._fn.Lighting.freeScene3Dlights(ptr);
}
#else
extern inline function freeScene3Dlights(ptr:Scene3DLights):Void {
#if hl
	flight._hl._fn.Lighting.freeScene3Dlights(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freeScene3Dlights(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freeScene3Dlights(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpotLight(ptr:SpotLight):Void {
	flight._js._fn.Lighting.freeSpotLight(ptr);
}
#else
extern inline function freeSpotLight(ptr:SpotLight):Void {
#if hl
	flight._hl._fn.Lighting.freeSpotLight(ptr);
#elseif cpp
	flight._cpp._fn.Lighting.freeSpotLight(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Lighting.freeSpotLight(ptr);
#else
	#error "flight.Lighting: no backend for this target."
#end
}
#end
