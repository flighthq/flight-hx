package flight._cpp._fn;

extern class Picking {
	@:native("flight_create_scene3d_hit")
	public static function createScene3dHit():flight._cpp.Scene3DHit;
	@:native("flight_pick_scene3d")
	public static function pickScene3d(out:flight._cpp.Scene3DHit, scene:flight._cpp.FlightNode, camera:flight._cpp.Camera3D, screenX:Float, screenY:Float, options:flight._cpp.Scene3DPickOptions):Bool;
	@:native("flight_pick_scene3d_all")
	public static function pickScene3dAll(outArray:cpp.Star<cpp.Void>, scene:flight._cpp.FlightNode, camera:flight._cpp.Camera3D, screenX:Float, screenY:Float, options:flight._cpp.Scene3DPickOptions):Void;
	@:native("flight_pick_scene3d_all_with_ray3d")
	public static function pickScene3dAllWithRay3d(outArray:cpp.Star<cpp.Void>, scene:flight._cpp.FlightNode, ray:flight._cpp.Ray3D, options:flight._cpp.Scene3DPickOptions):Void;
	@:native("flight_pick_scene3d_with_ray3d")
	public static function pickScene3dWithRay3d(out:flight._cpp.Scene3DHit, scene:flight._cpp.FlightNode, ray:flight._cpp.Ray3D, options:flight._cpp.Scene3DPickOptions):Bool;
	@:native("flight_get_scene3d_hit_material")
	public static function getScene3dHitMaterial(hit:flight._cpp.Scene3DHit):cpp.Star<cpp.Void>;
	@:native("flight_get_scene3d_hit_subset_index")
	public static function getScene3dHitSubsetIndex(hit:flight._cpp.Scene3DHit):Int;
	@:native("flight_get_scene3d_hit_uv0")
	public static function getScene3dHitUv0(out:flight._cpp.Vector2, hit:flight._cpp.Scene3DHit):Bool;
	@:native("flight_get_scene3d_hit_vertex_normal")
	public static function getScene3dHitVertexNormal(out:flight._cpp.Vector3, hit:flight._cpp.Scene3DHit):Bool;
	@:native("flight_get_scene3d_hit_vertex_tangent")
	public static function getScene3dHitVertexTangent(out:flight._cpp.Vector4, hit:flight._cpp.Scene3DHit):Bool;
	@:native("flight_is_scene3d_hit_front_facing")
	public static function isScene3dHitFrontFacing(hit:flight._cpp.Scene3DHit, ray:flight._cpp.Ray3D):Bool;
	@:native("flight_free_scene3_dhit")
	public static function freeScene3Dhit(ptr:flight._cpp.Scene3DHit):Void;
}
