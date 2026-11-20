package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/lighting")
extern class Lighting {
  public static function applyLightExposure(intensity:Float, ev:Float):Float;
  public static function cloneAmbientLight(source:flight.esm.types.lighting_contract.Types.AmbientLight):flight.esm.types.lighting_contract.Types.AmbientLight;
  public static function cloneAreaLight(source:flight.esm.types.lighting_contract.Types.AreaLight):flight.esm.types.lighting_contract.Types.AreaLight;
  public static function cloneDirectionalLight(source:flight.esm.types.lighting_contract.Types.DirectionalLight):flight.esm.types.lighting_contract.Types.DirectionalLight;
  public static function cloneEnvironment(source:flight.esm.types.lighting_contract.Types.Environment):flight.esm.types.lighting_contract.Types.Environment;
  public static function cloneHemisphereLight(source:flight.esm.types.lighting_contract.Types.HemisphereLight):flight.esm.types.lighting_contract.Types.HemisphereLight;
  public static function clonePointLight(source:flight.esm.types.lighting_contract.Types.PointLight):flight.esm.types.lighting_contract.Types.PointLight;
  public static function cloneSpotLight(source:flight.esm.types.lighting_contract.Types.SpotLight):flight.esm.types.lighting_contract.Types.SpotLight;
  public static function convertLightIntensity(fromUnit:flight.esm.types.lighting_contract.Types.LightUnit, toUnit:flight.esm.types.lighting_contract.Types.LightUnit, value:Float):Float;
  public static function createAmbientLight(?options:Null<flight.esm.types.lighting_contract.Types.AmbientLightOptions>):flight.esm.types.lighting_contract.Types.AmbientLight;
  public static function createAreaLight(?options:Null<flight.esm.types.lighting_contract.Types.AreaLightOptions>):flight.esm.types.lighting_contract.Types.AreaLight;
  public static function createDirectionalLight(?options:Null<flight.esm.types.lighting_contract.Types.DirectionalLightOptions>):flight.esm.types.lighting_contract.Types.DirectionalLight;
  public static function createEnvironment(?options:Null<flight.esm.types.lighting_contract.Types.EnvironmentOptions>):flight.esm.types.lighting_contract.Types.Environment;
  public static function createHemisphereLight(?options:Null<flight.esm.types.lighting_contract.Types.HemisphereLightOptions>):flight.esm.types.lighting_contract.Types.HemisphereLight;
  public static function createLightProbe(position:flight.esm.types.geometry.Types.Vector3Like, ?shCoefficients:Null<js.lib.Float32Array>):flight.esm.types.lighting_contract.Types.LightProbe;
  public static function createLightProbeGrid(probes:Array<flight.esm.types.lighting_contract.Types.LightProbe>, bounds:flight.esm.types.geometry.Types.AabbLike, resolution:flight.esm.types.geometry.Types.Vector3Like):flight.esm.types.lighting_contract.Types.LightProbeGrid;
  public static function createPointLight(?options:Null<flight.esm.types.lighting_contract.Types.PointLightOptions>):flight.esm.types.lighting_contract.Types.PointLight;
  public static function createScene3DLights(?options:Dynamic):flight.esm.types.lighting_contract.Types.Scene3DLights;
  public static function createSpotLight(?options:Null<flight.esm.types.lighting_contract.Types.SpotLightOptions>):flight.esm.types.lighting_contract.Types.SpotLight;
  public static function evaluateLightProbeSh(out:js.lib.Float32Array, normal:flight.esm.types.geometry.Types.Vector3Like, shCoefficients:js.lib.Float32Array):Void;
  public static function getLightContributionAtBoundingSphere(light:Dynamic, bounds:flight.esm.types.geometry.Types.BoundingSphereLike):Float;
  public static function getLightInfluenceBounds(out:flight.esm.types.geometry.Types.BoundingSphereLike, light:flight.esm.types.lighting_contract.Types.Light):Void;
  public static function getLightLinearIntensity(unit:flight.esm.types.lighting_contract.Types.LightUnit, value:Float):Float;
  public static function getLightLuminance(light:flight.esm.types.lighting_contract.Types.Light):Float;
  public static function getLightPhotometricIntensity(light:flight.esm.types.lighting_contract.Types.PhotometricLightLike):Float;
  public static function getSpotLightConeDegrees(out:flight.esm.types.lighting_contract.Types.SpotLightConeAngles, source:flight.esm.types.lighting_contract.Types.SpotLight):Void;
  public static function hasLightInfluenceOnBounds(light:flight.esm.types.lighting_contract.Types.Light, bounds:flight.esm.types.geometry.Types.BoundingSphereLike):Bool;
  public static function isLightCastingShadow(light:flight.esm.types.lighting_contract.Types.Light):Bool;
  public static function sampleLightProbeGrid(out:js.lib.Float32Array, position:flight.esm.types.geometry.Types.Vector3Like, grid:flight.esm.types.lighting_contract.Types.LightProbeGrid):Bool;
  public static function selectScene3DForwardLights(out:flight.esm.types.lighting_contract.Types.Scene3DForwardLightSelection, lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike, bounds:flight.esm.types.geometry.Types.BoundingSphereLike, ?receiverLayerMask:Float):Void;
  public static function setAreaLightOrientation(out:flight.esm.types.lighting_contract.Types.AreaLight, direction:flight.esm.types.geometry.Types.Vector3Like, right:flight.esm.types.geometry.Types.Vector3Like, up:flight.esm.types.geometry.Types.Vector3Like):Void;
  public static function setDirectionalLightDirection(out:flight.esm.types.lighting_contract.Types.DirectionalLight, x:Float, y:Float, z:Float):Void;
  public static function setDirectionalLightTarget(out:flight.esm.types.lighting_contract.Types.DirectionalLight, fromX:Float, fromY:Float, fromZ:Float, toX:Float, toY:Float, toZ:Float):Void;
  public static function setLightPhotometricIntensity(out:flight.esm.types.lighting_contract.Types.PhotometricLightLike, value:Float):Void;
  public static function setLightProbeShFromColors(target:flight.esm.types.lighting_contract.Types.LightProbe, colors:js.lib.Float32Array, directions:js.lib.Float32Array):Void;
  public static function setSpotLightBlend(out:flight.esm.types.lighting_contract.Types.SpotLight, blend:Float):Void;
  public static function setSpotLightCone(out:flight.esm.types.lighting_contract.Types.SpotLight, innerDegrees:Float, outerDegrees:Float):Void;
  public static function setSpotLightDirection(out:flight.esm.types.lighting_contract.Types.SpotLight, x:Float, y:Float, z:Float):Void;
  public static function setSpotLightTarget(out:flight.esm.types.lighting_contract.Types.SpotLight, targetX:Float, targetY:Float, targetZ:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
