package flight._cpp._fn;

extern class Lighting {
	@:native("flight_create_ambient_light")
	public static function createAmbientLight():flight._cpp.AmbientLight;
	@:native("flight_clone_ambient_light")
	public static function cloneAmbientLight(source:flight._cpp.AmbientLight):flight._cpp.AmbientLight;
	@:native("flight_create_area_light")
	public static function createAreaLight():flight._cpp.AreaLight;
	@:native("flight_clone_area_light")
	public static function cloneAreaLight(source:flight._cpp.AreaLight):flight._cpp.AreaLight;
	@:native("flight_set_area_light_orientation")
	public static function setAreaLightOrientation(out:flight._cpp.AreaLight, direction:flight._cpp.Vector3, right:flight._cpp.Vector3, up:flight._cpp.Vector3):Void;
	@:native("flight_create_directional_light")
	public static function createDirectionalLight(options:flight._cpp.DirectionalLightOptions):flight._cpp.DirectionalLight;
	@:native("flight_clone_directional_light")
	public static function cloneDirectionalLight(source:flight._cpp.DirectionalLight):flight._cpp.DirectionalLight;
	@:native("flight_set_directional_light_direction")
	public static function setDirectionalLightDirection(out:flight._cpp.DirectionalLight, x:Float, y:Float, z:Float):Void;
	@:native("flight_set_directional_light_target")
	public static function setDirectionalLightTarget(out:flight._cpp.DirectionalLight, fromX:Float, fromY:Float, fromZ:Float, toX:Float, toY:Float, toZ:Float):Void;
	@:native("flight_create_environment")
	public static function createEnvironment():flight._cpp.Environment;
	@:native("flight_clone_environment")
	public static function cloneEnvironment(source:flight._cpp.Environment):flight._cpp.Environment;
	@:native("flight_create_hemisphere_light")
	public static function createHemisphereLight():flight._cpp.HemisphereLight;
	@:native("flight_clone_hemisphere_light")
	public static function cloneHemisphereLight(source:flight._cpp.HemisphereLight):flight._cpp.HemisphereLight;
	@:native("flight_get_light_contribution_at_bounding_sphere__point_light")
	public static function getLightContributionAtBoundingSpherePointLight(light:flight._cpp.PointLight, bounds:flight._cpp.BoundingSphere):Float;
	@:native("flight_get_light_contribution_at_bounding_sphere__spot_light")
	public static function getLightContributionAtBoundingSphereSpotLight(light:flight._cpp.SpotLight, bounds:flight._cpp.BoundingSphere):Float;
	@:native("flight_get_light_influence_bounds__ambient_light")
	public static function getLightInfluenceBoundsAmbientLight(out:flight._cpp.BoundingSphere, light:flight._cpp.AmbientLight):Void;
	@:native("flight_get_light_influence_bounds__directional_light")
	public static function getLightInfluenceBoundsDirectionalLight(out:flight._cpp.BoundingSphere, light:flight._cpp.DirectionalLight):Void;
	@:native("flight_get_light_influence_bounds__environment")
	public static function getLightInfluenceBoundsEnvironment(out:flight._cpp.BoundingSphere, light:flight._cpp.Environment):Void;
	@:native("flight_get_light_influence_bounds__hemisphere_light")
	public static function getLightInfluenceBoundsHemisphereLight(out:flight._cpp.BoundingSphere, light:flight._cpp.HemisphereLight):Void;
	@:native("flight_get_light_luminance__ambient_light")
	public static function getLightLuminanceAmbientLight(light:flight._cpp.AmbientLight):Float;
	@:native("flight_get_light_luminance__directional_light")
	public static function getLightLuminanceDirectionalLight(light:flight._cpp.DirectionalLight):Float;
	@:native("flight_get_light_luminance__environment")
	public static function getLightLuminanceEnvironment(light:flight._cpp.Environment):Float;
	@:native("flight_get_light_luminance__hemisphere_light")
	public static function getLightLuminanceHemisphereLight(light:flight._cpp.HemisphereLight):Float;
	@:native("flight_has_light_influence_on_bounds__ambient_light")
	public static function hasLightInfluenceOnBoundsAmbientLight(light:flight._cpp.AmbientLight, bounds:flight._cpp.BoundingSphere):Bool;
	@:native("flight_has_light_influence_on_bounds__directional_light")
	public static function hasLightInfluenceOnBoundsDirectionalLight(light:flight._cpp.DirectionalLight, bounds:flight._cpp.BoundingSphere):Bool;
	@:native("flight_has_light_influence_on_bounds__environment")
	public static function hasLightInfluenceOnBoundsEnvironment(light:flight._cpp.Environment, bounds:flight._cpp.BoundingSphere):Bool;
	@:native("flight_has_light_influence_on_bounds__hemisphere_light")
	public static function hasLightInfluenceOnBoundsHemisphereLight(light:flight._cpp.HemisphereLight, bounds:flight._cpp.BoundingSphere):Bool;
	@:native("flight_is_light_casting_shadow__ambient_light")
	public static function isLightCastingShadowAmbientLight(light:flight._cpp.AmbientLight):Bool;
	@:native("flight_is_light_casting_shadow__directional_light")
	public static function isLightCastingShadowDirectionalLight(light:flight._cpp.DirectionalLight):Bool;
	@:native("flight_is_light_casting_shadow__environment")
	public static function isLightCastingShadowEnvironment(light:flight._cpp.Environment):Bool;
	@:native("flight_is_light_casting_shadow__hemisphere_light")
	public static function isLightCastingShadowHemisphereLight(light:flight._cpp.HemisphereLight):Bool;
	@:native("flight_apply_light_exposure")
	public static function applyLightExposure(intensity:Float, ev:Float):Float;
	@:native("flight_convert_light_intensity")
	public static function convertLightIntensity(fromUnit:Int, toUnit:Int, value:Float):Float;
	@:native("flight_get_light_linear_intensity")
	public static function getLightLinearIntensity(unit:Int, value:Float):Float;
	@:native("flight_get_light_photometric_intensity__ambient_light")
	public static function getLightPhotometricIntensityAmbientLight(light:flight._cpp.AmbientLight):Float;
	@:native("flight_get_light_photometric_intensity__directional_light")
	public static function getLightPhotometricIntensityDirectionalLight(light:flight._cpp.DirectionalLight):Float;
	@:native("flight_get_light_photometric_intensity__hemisphere_light")
	public static function getLightPhotometricIntensityHemisphereLight(light:flight._cpp.HemisphereLight):Float;
	@:native("flight_set_light_photometric_intensity__ambient_light")
	public static function setLightPhotometricIntensityAmbientLight(out:flight._cpp.AmbientLight, value:Float):Void;
	@:native("flight_set_light_photometric_intensity__directional_light")
	public static function setLightPhotometricIntensityDirectionalLight(out:flight._cpp.DirectionalLight, value:Float):Void;
	@:native("flight_set_light_photometric_intensity__hemisphere_light")
	public static function setLightPhotometricIntensityHemisphereLight(out:flight._cpp.HemisphereLight, value:Float):Void;
	@:native("flight_create_light_probe")
	public static function createLightProbe(position:flight._cpp.Vector3, shCoefficients:cpp.Star<cpp.Void>, shCoefficientsLen:Int):flight._cpp.LightProbe;
	@:native("flight_evaluate_light_probe_sh")
	public static function evaluateLightProbeSh(out:cpp.Star<cpp.Void>, outLen:Int, normal:flight._cpp.Vector3, shCoefficients:cpp.Star<cpp.Void>, shCoefficientsLen:Int):Void;
	@:native("flight_sample_light_probe_grid")
	public static function sampleLightProbeGrid(out:cpp.Star<cpp.Void>, outLen:Int, position:flight._cpp.Vector3, grid:flight._cpp.LightProbeGrid):Bool;
	@:native("flight_set_light_probe_sh_from_colors")
	public static function setLightProbeShFromColors(target:flight._cpp.LightProbe, colors:cpp.Star<cpp.Void>, colorsLen:Int, directions:cpp.Star<cpp.Void>, directionsLen:Int):Void;
	@:native("flight_create_point_light")
	public static function createPointLight():flight._cpp.PointLight;
	@:native("flight_clone_point_light")
	public static function clonePointLight(source:flight._cpp.PointLight):flight._cpp.PointLight;
	@:native("flight_select_scene_3d_forward_lights")
	public static function selectScene3dForwardLights(out:flight._cpp.Scene3DForwardLightSelection, lights:flight._cpp.Scene3DLights, bounds:flight._cpp.BoundingSphere, receiverLayerMask:Int):Void;
	@:native("flight_create_scene_3d_lights")
	public static function createScene3dLights():flight._cpp.Scene3DLights;
	@:native("flight_create_spot_light")
	public static function createSpotLight(options:flight._cpp.SpotLightOptions):flight._cpp.SpotLight;
	@:native("flight_clone_spot_light")
	public static function cloneSpotLight(source:flight._cpp.SpotLight):flight._cpp.SpotLight;
	@:native("flight_get_spot_light_cone_degrees")
	public static function getSpotLightConeDegrees(out:flight._cpp.SpotLightConeAngles, source:flight._cpp.SpotLight):Void;
	@:native("flight_set_spot_light_blend")
	public static function setSpotLightBlend(out:flight._cpp.SpotLight, blend:Float):Void;
	@:native("flight_set_spot_light_cone")
	public static function setSpotLightCone(out:flight._cpp.SpotLight, innerDegrees:Float, outerDegrees:Float):Void;
	@:native("flight_set_spot_light_direction")
	public static function setSpotLightDirection(out:flight._cpp.SpotLight, x:Float, y:Float, z:Float):Void;
	@:native("flight_set_spot_light_target")
	public static function setSpotLightTarget(out:flight._cpp.SpotLight, targetX:Float, targetY:Float, targetZ:Float):Void;
	@:native("flight_free_ambient_light")
	public static function freeAmbientLight(ptr:flight._cpp.AmbientLight):Void;
	@:native("flight_free_area_light")
	public static function freeAreaLight(ptr:flight._cpp.AreaLight):Void;
	@:native("flight_free_directional_light")
	public static function freeDirectionalLight(ptr:flight._cpp.DirectionalLight):Void;
	@:native("flight_free_environment")
	public static function freeEnvironment(ptr:flight._cpp.Environment):Void;
	@:native("flight_free_hemisphere_light")
	public static function freeHemisphereLight(ptr:flight._cpp.HemisphereLight):Void;
	@:native("flight_free_light_probe")
	public static function freeLightProbe(ptr:flight._cpp.LightProbe):Void;
	@:native("flight_free_point_light")
	public static function freePointLight(ptr:flight._cpp.PointLight):Void;
	@:native("flight_free_scene3_dlights")
	public static function freeScene3Dlights(ptr:flight._cpp.Scene3DLights):Void;
	@:native("flight_free_spot_light")
	public static function freeSpotLight(ptr:flight._cpp.SpotLight):Void;
}
