package flight._hl._fn;

extern class Lighting {
	@:hlNative("flight", "flight_create_ambient_light")
	public static function createAmbientLight():flight._hl.AmbientLight;
	@:hlNative("flight", "flight_clone_ambient_light")
	public static function cloneAmbientLight(source:flight._hl.AmbientLight):flight._hl.AmbientLight;
	@:hlNative("flight", "flight_create_area_light")
	public static function createAreaLight():flight._hl.AreaLight;
	@:hlNative("flight", "flight_clone_area_light")
	public static function cloneAreaLight(source:flight._hl.AreaLight):flight._hl.AreaLight;
	@:hlNative("flight", "flight_set_area_light_orientation")
	public static function setAreaLightOrientation(out:flight._hl.AreaLight, direction:flight._hl.Vector3, right:flight._hl.Vector3, up:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_create_directional_light")
	public static function createDirectionalLight(options:flight._hl.DirectionalLightOptions):flight._hl.DirectionalLight;
	@:hlNative("flight", "flight_clone_directional_light")
	public static function cloneDirectionalLight(source:flight._hl.DirectionalLight):flight._hl.DirectionalLight;
	@:hlNative("flight", "flight_set_directional_light_direction")
	public static function setDirectionalLightDirection(out:flight._hl.DirectionalLight, x:Float, y:Float, z:Float):Void;
	@:hlNative("flight", "flight_set_directional_light_target")
	public static function setDirectionalLightTarget(out:flight._hl.DirectionalLight, fromX:Float, fromY:Float, fromZ:Float, toX:Float, toY:Float, toZ:Float):Void;
	@:hlNative("flight", "flight_create_environment")
	public static function createEnvironment():flight._hl.Environment;
	@:hlNative("flight", "flight_clone_environment")
	public static function cloneEnvironment(source:flight._hl.Environment):flight._hl.Environment;
	@:hlNative("flight", "flight_create_hemisphere_light")
	public static function createHemisphereLight():flight._hl.HemisphereLight;
	@:hlNative("flight", "flight_clone_hemisphere_light")
	public static function cloneHemisphereLight(source:flight._hl.HemisphereLight):flight._hl.HemisphereLight;
	@:hlNative("flight", "flight_get_light_contribution_at_bounding_sphere__point_light")
	public static function getLightContributionAtBoundingSpherePointLight(light:flight._hl.PointLight, bounds:flight._hl.BoundingSphere):Float;
	@:hlNative("flight", "flight_get_light_contribution_at_bounding_sphere__spot_light")
	public static function getLightContributionAtBoundingSphereSpotLight(light:flight._hl.SpotLight, bounds:flight._hl.BoundingSphere):Float;
	@:hlNative("flight", "flight_get_light_influence_bounds__ambient_light")
	public static function getLightInfluenceBoundsAmbientLight(out:flight._hl.BoundingSphere, light:flight._hl.AmbientLight):Void;
	@:hlNative("flight", "flight_get_light_influence_bounds__directional_light")
	public static function getLightInfluenceBoundsDirectionalLight(out:flight._hl.BoundingSphere, light:flight._hl.DirectionalLight):Void;
	@:hlNative("flight", "flight_get_light_influence_bounds__environment")
	public static function getLightInfluenceBoundsEnvironment(out:flight._hl.BoundingSphere, light:flight._hl.Environment):Void;
	@:hlNative("flight", "flight_get_light_influence_bounds__hemisphere_light")
	public static function getLightInfluenceBoundsHemisphereLight(out:flight._hl.BoundingSphere, light:flight._hl.HemisphereLight):Void;
	@:hlNative("flight", "flight_get_light_luminance__ambient_light")
	public static function getLightLuminanceAmbientLight(light:flight._hl.AmbientLight):Float;
	@:hlNative("flight", "flight_get_light_luminance__directional_light")
	public static function getLightLuminanceDirectionalLight(light:flight._hl.DirectionalLight):Float;
	@:hlNative("flight", "flight_get_light_luminance__environment")
	public static function getLightLuminanceEnvironment(light:flight._hl.Environment):Float;
	@:hlNative("flight", "flight_get_light_luminance__hemisphere_light")
	public static function getLightLuminanceHemisphereLight(light:flight._hl.HemisphereLight):Float;
	@:hlNative("flight", "flight_has_light_influence_on_bounds__ambient_light")
	public static function hasLightInfluenceOnBoundsAmbientLight(light:flight._hl.AmbientLight, bounds:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_has_light_influence_on_bounds__directional_light")
	public static function hasLightInfluenceOnBoundsDirectionalLight(light:flight._hl.DirectionalLight, bounds:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_has_light_influence_on_bounds__environment")
	public static function hasLightInfluenceOnBoundsEnvironment(light:flight._hl.Environment, bounds:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_has_light_influence_on_bounds__hemisphere_light")
	public static function hasLightInfluenceOnBoundsHemisphereLight(light:flight._hl.HemisphereLight, bounds:flight._hl.BoundingSphere):Bool;
	@:hlNative("flight", "flight_is_light_casting_shadow__ambient_light")
	public static function isLightCastingShadowAmbientLight(light:flight._hl.AmbientLight):Bool;
	@:hlNative("flight", "flight_is_light_casting_shadow__directional_light")
	public static function isLightCastingShadowDirectionalLight(light:flight._hl.DirectionalLight):Bool;
	@:hlNative("flight", "flight_is_light_casting_shadow__environment")
	public static function isLightCastingShadowEnvironment(light:flight._hl.Environment):Bool;
	@:hlNative("flight", "flight_is_light_casting_shadow__hemisphere_light")
	public static function isLightCastingShadowHemisphereLight(light:flight._hl.HemisphereLight):Bool;
	@:hlNative("flight", "flight_apply_light_exposure")
	public static function applyLightExposure(intensity:Float, ev:Float):Float;
	@:hlNative("flight", "flight_convert_light_intensity")
	public static function convertLightIntensity(fromUnit:Int, toUnit:Int, value:Float):Float;
	@:hlNative("flight", "flight_get_light_linear_intensity")
	public static function getLightLinearIntensity(unit:Int, value:Float):Float;
	@:hlNative("flight", "flight_get_light_photometric_intensity__ambient_light")
	public static function getLightPhotometricIntensityAmbientLight(light:flight._hl.AmbientLight):Float;
	@:hlNative("flight", "flight_get_light_photometric_intensity__directional_light")
	public static function getLightPhotometricIntensityDirectionalLight(light:flight._hl.DirectionalLight):Float;
	@:hlNative("flight", "flight_get_light_photometric_intensity__hemisphere_light")
	public static function getLightPhotometricIntensityHemisphereLight(light:flight._hl.HemisphereLight):Float;
	@:hlNative("flight", "flight_set_light_photometric_intensity__ambient_light")
	public static function setLightPhotometricIntensityAmbientLight(out:flight._hl.AmbientLight, value:Float):Void;
	@:hlNative("flight", "flight_set_light_photometric_intensity__directional_light")
	public static function setLightPhotometricIntensityDirectionalLight(out:flight._hl.DirectionalLight, value:Float):Void;
	@:hlNative("flight", "flight_set_light_photometric_intensity__hemisphere_light")
	public static function setLightPhotometricIntensityHemisphereLight(out:flight._hl.HemisphereLight, value:Float):Void;
	@:hlNative("flight", "flight_create_light_probe")
	public static function createLightProbe(position:flight._hl.Vector3, shCoefficients:hl.Bytes, shCoefficientsLen:Int):flight._hl.LightProbe;
	@:hlNative("flight", "flight_evaluate_light_probe_sh")
	public static function evaluateLightProbeSh(out:hl.Bytes, outLen:Int, normal:flight._hl.Vector3, shCoefficients:hl.Bytes, shCoefficientsLen:Int):Void;
	@:hlNative("flight", "flight_sample_light_probe_grid")
	public static function sampleLightProbeGrid(out:hl.Bytes, outLen:Int, position:flight._hl.Vector3, grid:flight._hl.LightProbeGrid):Bool;
	@:hlNative("flight", "flight_set_light_probe_sh_from_colors")
	public static function setLightProbeShFromColors(target:flight._hl.LightProbe, colors:hl.Bytes, colorsLen:Int, directions:hl.Bytes, directionsLen:Int):Void;
	@:hlNative("flight", "flight_create_point_light")
	public static function createPointLight():flight._hl.PointLight;
	@:hlNative("flight", "flight_clone_point_light")
	public static function clonePointLight(source:flight._hl.PointLight):flight._hl.PointLight;
	@:hlNative("flight", "flight_select_scene_3d_forward_lights")
	public static function selectScene3dForwardLights(out:flight._hl.Scene3DForwardLightSelection, lights:flight._hl.Scene3DLights, bounds:flight._hl.BoundingSphere, receiverLayerMask:Int):Void;
	@:hlNative("flight", "flight_create_scene_3d_lights")
	public static function createScene3dLights():flight._hl.Scene3DLights;
	@:hlNative("flight", "flight_create_spot_light")
	public static function createSpotLight(options:flight._hl.SpotLightOptions):flight._hl.SpotLight;
	@:hlNative("flight", "flight_clone_spot_light")
	public static function cloneSpotLight(source:flight._hl.SpotLight):flight._hl.SpotLight;
	@:hlNative("flight", "flight_get_spot_light_cone_degrees")
	public static function getSpotLightConeDegrees(out:flight._hl.SpotLightConeAngles, source:flight._hl.SpotLight):Void;
	@:hlNative("flight", "flight_set_spot_light_blend")
	public static function setSpotLightBlend(out:flight._hl.SpotLight, blend:Float):Void;
	@:hlNative("flight", "flight_set_spot_light_cone")
	public static function setSpotLightCone(out:flight._hl.SpotLight, innerDegrees:Float, outerDegrees:Float):Void;
	@:hlNative("flight", "flight_set_spot_light_direction")
	public static function setSpotLightDirection(out:flight._hl.SpotLight, x:Float, y:Float, z:Float):Void;
	@:hlNative("flight", "flight_set_spot_light_target")
	public static function setSpotLightTarget(out:flight._hl.SpotLight, targetX:Float, targetY:Float, targetZ:Float):Void;
	@:hlNative("flight", "flight_free_ambient_light")
	public static function freeAmbientLight(ptr:flight._hl.AmbientLight):Void;
	@:hlNative("flight", "flight_free_area_light")
	public static function freeAreaLight(ptr:flight._hl.AreaLight):Void;
	@:hlNative("flight", "flight_free_directional_light")
	public static function freeDirectionalLight(ptr:flight._hl.DirectionalLight):Void;
	@:hlNative("flight", "flight_free_environment")
	public static function freeEnvironment(ptr:flight._hl.Environment):Void;
	@:hlNative("flight", "flight_free_hemisphere_light")
	public static function freeHemisphereLight(ptr:flight._hl.HemisphereLight):Void;
	@:hlNative("flight", "flight_free_light_probe")
	public static function freeLightProbe(ptr:flight._hl.LightProbe):Void;
	@:hlNative("flight", "flight_free_point_light")
	public static function freePointLight(ptr:flight._hl.PointLight):Void;
	@:hlNative("flight", "flight_free_scene3_dlights")
	public static function freeScene3Dlights(ptr:flight._hl.Scene3DLights):Void;
	@:hlNative("flight", "flight_free_spot_light")
	public static function freeSpotLight(ptr:flight._hl.SpotLight):Void;
}
