package flight._js._fn;

@:jsRequire("@flighthq/lighting")
extern class Lighting {
	@:native("createAmbientLight")
	public static function createAmbientLight():flight._js.AmbientLight;
	@:native("cloneAmbientLight")
	public static function cloneAmbientLight(source:flight._js.AmbientLight):flight._js.AmbientLight;
	@:native("createAreaLight")
	public static function createAreaLight():flight._js.AreaLight;
	@:native("cloneAreaLight")
	public static function cloneAreaLight(source:flight._js.AreaLight):flight._js.AreaLight;
	@:native("setAreaLightOrientation")
	public static function setAreaLightOrientation(out:flight._js.AreaLight, direction:flight._js.Vector3, right:flight._js.Vector3, up:flight._js.Vector3):Void;
	@:native("createDirectionalLight")
	public static function createDirectionalLight(options:Null<flight._js.DirectionalLightOptions>):flight._js.DirectionalLight;
	@:native("cloneDirectionalLight")
	public static function cloneDirectionalLight(source:flight._js.DirectionalLight):flight._js.DirectionalLight;
	@:native("setDirectionalLightDirection")
	public static function setDirectionalLightDirection(out:flight._js.DirectionalLight, x:Float, y:Float, z:Float):Void;
	@:native("setDirectionalLightTarget")
	public static function setDirectionalLightTarget(out:flight._js.DirectionalLight, fromX:Float, fromY:Float, fromZ:Float, toX:Float, toY:Float, toZ:Float):Void;
	@:native("createEnvironment")
	public static function createEnvironment():flight._js.Environment;
	@:native("cloneEnvironment")
	public static function cloneEnvironment(source:flight._js.Environment):flight._js.Environment;
	@:native("createHemisphereLight")
	public static function createHemisphereLight():flight._js.HemisphereLight;
	@:native("cloneHemisphereLight")
	public static function cloneHemisphereLight(source:flight._js.HemisphereLight):flight._js.HemisphereLight;
	@:native("getLightContributionAtBoundingSphere")
	public static function getLightContributionAtBoundingSpherePointLight(light:flight._js.PointLight, bounds:flight._js.BoundingSphere):Float;
	@:native("getLightContributionAtBoundingSphere")
	public static function getLightContributionAtBoundingSphereSpotLight(light:flight._js.SpotLight, bounds:flight._js.BoundingSphere):Float;
	@:native("getLightInfluenceBounds")
	public static function getLightInfluenceBoundsAmbientLight(out:flight._js.BoundingSphere, light:flight._js.AmbientLight):Void;
	@:native("getLightInfluenceBounds")
	public static function getLightInfluenceBoundsDirectionalLight(out:flight._js.BoundingSphere, light:flight._js.DirectionalLight):Void;
	@:native("getLightInfluenceBounds")
	public static function getLightInfluenceBoundsEnvironment(out:flight._js.BoundingSphere, light:flight._js.Environment):Void;
	@:native("getLightInfluenceBounds")
	public static function getLightInfluenceBoundsHemisphereLight(out:flight._js.BoundingSphere, light:flight._js.HemisphereLight):Void;
	@:native("getLightLuminance")
	public static function getLightLuminanceAmbientLight(light:flight._js.AmbientLight):Float;
	@:native("getLightLuminance")
	public static function getLightLuminanceDirectionalLight(light:flight._js.DirectionalLight):Float;
	@:native("getLightLuminance")
	public static function getLightLuminanceEnvironment(light:flight._js.Environment):Float;
	@:native("getLightLuminance")
	public static function getLightLuminanceHemisphereLight(light:flight._js.HemisphereLight):Float;
	@:native("hasLightInfluenceOnBounds")
	public static function hasLightInfluenceOnBoundsAmbientLight(light:flight._js.AmbientLight, bounds:flight._js.BoundingSphere):Bool;
	@:native("hasLightInfluenceOnBounds")
	public static function hasLightInfluenceOnBoundsDirectionalLight(light:flight._js.DirectionalLight, bounds:flight._js.BoundingSphere):Bool;
	@:native("hasLightInfluenceOnBounds")
	public static function hasLightInfluenceOnBoundsEnvironment(light:flight._js.Environment, bounds:flight._js.BoundingSphere):Bool;
	@:native("hasLightInfluenceOnBounds")
	public static function hasLightInfluenceOnBoundsHemisphereLight(light:flight._js.HemisphereLight, bounds:flight._js.BoundingSphere):Bool;
	@:native("isLightCastingShadow")
	public static function isLightCastingShadowAmbientLight(light:flight._js.AmbientLight):Bool;
	@:native("isLightCastingShadow")
	public static function isLightCastingShadowDirectionalLight(light:flight._js.DirectionalLight):Bool;
	@:native("isLightCastingShadow")
	public static function isLightCastingShadowEnvironment(light:flight._js.Environment):Bool;
	@:native("isLightCastingShadow")
	public static function isLightCastingShadowHemisphereLight(light:flight._js.HemisphereLight):Bool;
	@:native("applyLightExposure")
	public static function applyLightExposure(intensity:Float, ev:Float):Float;
	@:native("convertLightIntensity")
	public static function convertLightIntensity(fromUnit:Dynamic, toUnit:Dynamic, value:Float):Float;
	@:native("getLightLinearIntensity")
	public static function getLightLinearIntensity(unit:Dynamic, value:Float):Float;
	@:native("getLightPhotometricIntensity")
	public static function getLightPhotometricIntensityAmbientLight(light:flight._js.AmbientLight):Float;
	@:native("getLightPhotometricIntensity")
	public static function getLightPhotometricIntensityDirectionalLight(light:flight._js.DirectionalLight):Float;
	@:native("getLightPhotometricIntensity")
	public static function getLightPhotometricIntensityHemisphereLight(light:flight._js.HemisphereLight):Float;
	@:native("setLightPhotometricIntensity")
	public static function setLightPhotometricIntensityAmbientLight(out:flight._js.AmbientLight, value:Float):Void;
	@:native("setLightPhotometricIntensity")
	public static function setLightPhotometricIntensityDirectionalLight(out:flight._js.DirectionalLight, value:Float):Void;
	@:native("setLightPhotometricIntensity")
	public static function setLightPhotometricIntensityHemisphereLight(out:flight._js.HemisphereLight, value:Float):Void;
	@:native("createLightProbe")
	public static function createLightProbe(position:flight._js.Vector3, shCoefficients:Null<Dynamic>):flight._js.LightProbe;
	@:native("evaluateLightProbeSh")
	public static function evaluateLightProbeSh(out:Dynamic, normal:flight._js.Vector3, shCoefficients:Dynamic):Void;
	@:native("sampleLightProbeGrid")
	public static function sampleLightProbeGrid(out:Dynamic, position:flight._js.Vector3, grid:flight._js.LightProbeGrid):Bool;
	@:native("setLightProbeShFromColors")
	public static function setLightProbeShFromColors(target:flight._js.LightProbe, colors:Dynamic, directions:Dynamic):Void;
	@:native("createPointLight")
	public static function createPointLight():flight._js.PointLight;
	@:native("clonePointLight")
	public static function clonePointLight(source:flight._js.PointLight):flight._js.PointLight;
	@:native("selectScene3DForwardLights")
	public static function selectScene3dForwardLights(out:flight._js.Scene3DForwardLightSelection, lights:flight._js.Scene3DLights, bounds:flight._js.BoundingSphere, receiverLayerMask:Null<Int>):Void;
	@:native("createScene3DLights")
	public static function createScene3dLights():flight._js.Scene3DLights;
	@:native("createSpotLight")
	public static function createSpotLight(options:Null<flight._js.SpotLightOptions>):flight._js.SpotLight;
	@:native("cloneSpotLight")
	public static function cloneSpotLight(source:flight._js.SpotLight):flight._js.SpotLight;
	@:native("getSpotLightConeDegrees")
	public static function getSpotLightConeDegrees(out:flight._js.SpotLightConeAngles, source:flight._js.SpotLight):Void;
	@:native("setSpotLightBlend")
	public static function setSpotLightBlend(out:flight._js.SpotLight, blend:Float):Void;
	@:native("setSpotLightCone")
	public static function setSpotLightCone(out:flight._js.SpotLight, innerDegrees:Float, outerDegrees:Float):Void;
	@:native("setSpotLightDirection")
	public static function setSpotLightDirection(out:flight._js.SpotLight, x:Float, y:Float, z:Float):Void;
	@:native("setSpotLightTarget")
	public static function setSpotLightTarget(out:flight._js.SpotLight, targetX:Float, targetY:Float, targetZ:Float):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAmbientLight(ptr:flight._js.AmbientLight):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAreaLight(ptr:flight._js.AreaLight):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeDirectionalLight(ptr:flight._js.DirectionalLight):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeEnvironment(ptr:flight._js.Environment):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeHemisphereLight(ptr:flight._js.HemisphereLight):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLightProbe(ptr:flight._js.LightProbe):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePointLight(ptr:flight._js.PointLight):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene3Dlights(ptr:flight._js.Scene3DLights):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpotLight(ptr:flight._js.SpotLight):Void {}
}
