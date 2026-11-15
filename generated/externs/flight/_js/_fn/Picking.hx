package flight._js._fn;

@:jsRequire("flight")
extern class Picking {
	@:native("flight_create_scene3d_hit")
	public static function createScene3dHit():flight._js.Scene3DHit;
	@:native("flight_pick_scene3d")
	public static function pickScene3d(out:flight._js.Scene3DHit, scene:Dynamic, camera:flight._js.Camera3D, screenX:Float, screenY:Float, options:flight._js.Scene3DPickOptions):Bool;
	@:native("flight_pick_scene3d_all")
	public static function pickScene3dAll(outArray:Dynamic, scene:Dynamic, camera:flight._js.Camera3D, screenX:Float, screenY:Float, options:flight._js.Scene3DPickOptions):Void;
	@:native("flight_pick_scene3d_all_with_ray3d")
	public static function pickScene3dAllWithRay3d(outArray:Dynamic, scene:Dynamic, ray:flight._js.Ray3D, options:flight._js.Scene3DPickOptions):Void;
	@:native("flight_pick_scene3d_with_ray3d")
	public static function pickScene3dWithRay3d(out:flight._js.Scene3DHit, scene:Dynamic, ray:flight._js.Ray3D, options:flight._js.Scene3DPickOptions):Bool;
	@:native("flight_get_scene3d_hit_material")
	public static function getScene3dHitMaterial(hit:flight._js.Scene3DHit):Dynamic;
	@:native("flight_get_scene3d_hit_subset_index")
	public static function getScene3dHitSubsetIndex(hit:flight._js.Scene3DHit):Int;
	@:native("flight_get_scene3d_hit_uv0")
	public static function getScene3dHitUv0(out:flight._js.Vector2, hit:flight._js.Scene3DHit):Bool;
	@:native("flight_get_scene3d_hit_vertex_normal")
	public static function getScene3dHitVertexNormal(out:flight._js.Vector3, hit:flight._js.Scene3DHit):Bool;
	@:native("flight_get_scene3d_hit_vertex_tangent")
	public static function getScene3dHitVertexTangent(out:flight._js.Vector4, hit:flight._js.Scene3DHit):Bool;
	@:native("flight_is_scene3d_hit_front_facing")
	public static function isScene3dHitFrontFacing(hit:flight._js.Scene3DHit, ray:flight._js.Ray3D):Bool;
	@:native("flight_free_scene3_dhit")
	public static function freeScene3Dhit(ptr:flight._js.Scene3DHit):Void;
}
