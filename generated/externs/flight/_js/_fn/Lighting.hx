package flight._js._fn;

@:jsRequire("flight")
extern class Lighting {
	@:native("flight_create_ambient_light")
	public static function createAmbientLight():flight._js.AmbientLight;
	@:native("flight_clone_ambient_light")
	public static function cloneAmbientLight(source:flight._js.AmbientLight):flight._js.AmbientLight;
	@:native("flight_create_area_light")
	public static function createAreaLight():flight._js.AreaLight;
	@:native("flight_clone_area_light")
	public static function cloneAreaLight(source:flight._js.AreaLight):flight._js.AreaLight;
	@:native("flight_set_area_light_orientation")
	public static function setAreaLightOrientation(out:flight._js.AreaLight, direction:flight._js.Vector3, right:flight._js.Vector3, up:flight._js.Vector3):Void;
	@:native("flight_create_directional_light")
	public static function createDirectionalLight(options:flight._js.DirectionalLightOptions):flight._js.DirectionalLight;
	@:native("flight_clone_directional_light")
	public static function cloneDirectionalLight(source:flight._js.DirectionalLight):flight._js.DirectionalLight;
	@:native("flight_set_directional_light_direction")
	public static function setDirectionalLightDirection(out:flight._js.DirectionalLight, x:Float, y:Float, z:Float):Void;
	@:native("flight_set_directional_light_target")
	public static function setDirectionalLightTarget(out:flight._js.DirectionalLight, fromX:Float, fromY:Float, fromZ:Float, toX:Float, toY:Float, toZ:Float):Void;
	@:native("flight_create_environment")
	public static function createEnvironment():flight._js.Environment;
	@:native("flight_clone_environment")
	public static function cloneEnvironment(source:flight._js.Environment):flight._js.Environment;
	@:native("flight_create_hemisphere_light")
	public static function createHemisphereLight():flight._js.HemisphereLight;
	@:native("flight_clone_hemisphere_light")
	public static function cloneHemisphereLight(source:flight._js.HemisphereLight):flight._js.HemisphereLight;
	@:native("flight_get_light_contribution_at_bounding_sphere__point_light")
	public static function getLightContributionAtBoundingSpherePointLight(light:flight._js.PointLight, bounds:flight._js.BoundingSphere):Float;
	@:native("flight_get_light_contribution_at_bounding_sphere__spot_light")
	public static function getLightContributionAtBoundingSphereSpotLight(light:flight._js.SpotLight, bounds:flight._js.BoundingSphere):Float;
	@:native("flight_get_light_influence_bounds__ambient_light")
	public static function getLightInfluenceBoundsAmbientLight(out:flight._js.BoundingSphere, light:flight._js.AmbientLight):Void;
	@:native("flight_get_light_influence_bounds__directional_light")
	public static function getLightInfluenceBoundsDirectionalLight(out:flight._js.BoundingSphere, light:flight._js.DirectionalLight):Void;
	@:native("flight_get_light_influence_bounds__environment")
	public static function getLightInfluenceBoundsEnvironment(out:flight._js.BoundingSphere, light:flight._js.Environment):Void;
	@:native("flight_get_light_influence_bounds__hemisphere_light")
	public static function getLightInfluenceBoundsHemisphereLight(out:flight._js.BoundingSphere, light:flight._js.HemisphereLight):Void;
	@:native("flight_get_light_luminance__ambient_light")
	public static function getLightLuminanceAmbientLight(light:flight._js.AmbientLight):Float;
	@:native("flight_get_light_luminance__directional_light")
	public static function getLightLuminanceDirectionalLight(light:flight._js.DirectionalLight):Float;
	@:native("flight_get_light_luminance__environment")
	public static function getLightLuminanceEnvironment(light:flight._js.Environment):Float;
	@:native("flight_get_light_luminance__hemisphere_light")
	public static function getLightLuminanceHemisphereLight(light:flight._js.HemisphereLight):Float;
	@:native("flight_has_light_influence_on_bounds__ambient_light")
	public static function hasLightInfluenceOnBoundsAmbientLight(light:flight._js.AmbientLight, bounds:flight._js.BoundingSphere):Bool;
	@:native("flight_has_light_influence_on_bounds__directional_light")
	public static function hasLightInfluenceOnBoundsDirectionalLight(light:flight._js.DirectionalLight, bounds:flight._js.BoundingSphere):Bool;
	@:native("flight_has_light_influence_on_bounds__environment")
	public static function hasLightInfluenceOnBoundsEnvironment(light:flight._js.Environment, bounds:flight._js.BoundingSphere):Bool;
	@:native("flight_has_light_influence_on_bounds__hemisphere_light")
	public static function hasLightInfluenceOnBoundsHemisphereLight(light:flight._js.HemisphereLight, bounds:flight._js.BoundingSphere):Bool;
	@:native("flight_is_light_casting_shadow__ambient_light")
	public static function isLightCastingShadowAmbientLight(light:flight._js.AmbientLight):Bool;
	@:native("flight_is_light_casting_shadow__directional_light")
	public static function isLightCastingShadowDirectionalLight(light:flight._js.DirectionalLight):Bool;
	@:native("flight_is_light_casting_shadow__environment")
	public static function isLightCastingShadowEnvironment(light:flight._js.Environment):Bool;
	@:native("flight_is_light_casting_shadow__hemisphere_light")
	public static function isLightCastingShadowHemisphereLight(light:flight._js.HemisphereLight):Bool;
	@:native("flight_apply_light_exposure")
	public static function applyLightExposure(intensity:Float, ev:Float):Float;
	@:native("flight_convert_light_intensity")
	public static function convertLightIntensity(fromUnit:Int, toUnit:Int, value:Float):Float;
	@:native("flight_get_light_linear_intensity")
	public static function getLightLinearIntensity(unit:Int, value:Float):Float;
	@:native("flight_get_light_photometric_intensity__ambient_light")
	public static function getLightPhotometricIntensityAmbientLight(light:flight._js.AmbientLight):Float;
	@:native("flight_get_light_photometric_intensity__directional_light")
	public static function getLightPhotometricIntensityDirectionalLight(light:flight._js.DirectionalLight):Float;
	@:native("flight_get_light_photometric_intensity__hemisphere_light")
	public static function getLightPhotometricIntensityHemisphereLight(light:flight._js.HemisphereLight):Float;
	@:native("flight_set_light_photometric_intensity__ambient_light")
	public static function setLightPhotometricIntensityAmbientLight(out:flight._js.AmbientLight, value:Float):Void;
	@:native("flight_set_light_photometric_intensity__directional_light")
	public static function setLightPhotometricIntensityDirectionalLight(out:flight._js.DirectionalLight, value:Float):Void;
	@:native("flight_set_light_photometric_intensity__hemisphere_light")
	public static function setLightPhotometricIntensityHemisphereLight(out:flight._js.HemisphereLight, value:Float):Void;
	@:native("flight_create_light_probe")
	public static function createLightProbe(position:flight._js.Vector3, shCoefficients:Dynamic, shCoefficientsLen:Int):flight._js.LightProbe;
	@:native("flight_evaluate_light_probe_sh")
	public static function evaluateLightProbeSh(out:Dynamic, outLen:Int, normal:flight._js.Vector3, shCoefficients:Dynamic, shCoefficientsLen:Int):Void;
	@:native("flight_sample_light_probe_grid")
	public static function sampleLightProbeGrid(out:Dynamic, outLen:Int, position:flight._js.Vector3, grid:flight._js.LightProbeGrid):Bool;
	@:native("flight_set_light_probe_sh_from_colors")
	public static function setLightProbeShFromColors(target:flight._js.LightProbe, colors:Dynamic, colorsLen:Int, directions:Dynamic, directionsLen:Int):Void;
	@:native("flight_create_point_light")
	public static function createPointLight():flight._js.PointLight;
	@:native("flight_clone_point_light")
	public static function clonePointLight(source:flight._js.PointLight):flight._js.PointLight;
	@:native("flight_select_scene_3d_forward_lights")
	public static function selectScene3dForwardLights(out:flight._js.Scene3DForwardLightSelection, lights:flight._js.Scene3DLights, bounds:flight._js.BoundingSphere, receiverLayerMask:Int):Void;
	@:native("flight_create_scene_3d_lights")
	public static function createScene3dLights():flight._js.Scene3DLights;
	@:native("flight_create_spot_light")
	public static function createSpotLight(options:flight._js.SpotLightOptions):flight._js.SpotLight;
	@:native("flight_clone_spot_light")
	public static function cloneSpotLight(source:flight._js.SpotLight):flight._js.SpotLight;
	@:native("flight_get_spot_light_cone_degrees")
	public static function getSpotLightConeDegrees(out:flight._js.SpotLightConeAngles, source:flight._js.SpotLight):Void;
	@:native("flight_set_spot_light_blend")
	public static function setSpotLightBlend(out:flight._js.SpotLight, blend:Float):Void;
	@:native("flight_set_spot_light_cone")
	public static function setSpotLightCone(out:flight._js.SpotLight, innerDegrees:Float, outerDegrees:Float):Void;
	@:native("flight_set_spot_light_direction")
	public static function setSpotLightDirection(out:flight._js.SpotLight, x:Float, y:Float, z:Float):Void;
	@:native("flight_set_spot_light_target")
	public static function setSpotLightTarget(out:flight._js.SpotLight, targetX:Float, targetY:Float, targetZ:Float):Void;
	@:native("flight_free_ambient_light")
	public static function freeAmbientLight(ptr:flight._js.AmbientLight):Void;
	@:native("flight_free_area_light")
	public static function freeAreaLight(ptr:flight._js.AreaLight):Void;
	@:native("flight_free_directional_light")
	public static function freeDirectionalLight(ptr:flight._js.DirectionalLight):Void;
	@:native("flight_free_environment")
	public static function freeEnvironment(ptr:flight._js.Environment):Void;
	@:native("flight_free_hemisphere_light")
	public static function freeHemisphereLight(ptr:flight._js.HemisphereLight):Void;
	@:native("flight_free_light_probe")
	public static function freeLightProbe(ptr:flight._js.LightProbe):Void;
	@:native("flight_free_point_light")
	public static function freePointLight(ptr:flight._js.PointLight):Void;
	@:native("flight_free_scene3_dlights")
	public static function freeScene3Dlights(ptr:flight._js.Scene3DLights):Void;
	@:native("flight_free_spot_light")
	public static function freeSpotLight(ptr:flight._js.SpotLight):Void;
}
