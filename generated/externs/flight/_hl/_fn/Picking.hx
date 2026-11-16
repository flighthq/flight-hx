package flight._hl._fn;

extern class Picking {
	@:hlNative("flight", "flight_create_scene3d_hit")
	public static function createScene3dHit():flight._hl.Scene3DHit;
	@:hlNative("flight", "flight_pick_scene3d")
	public static function pickScene3d(out:flight._hl.Scene3DHit, scene:hl.Bytes, camera:flight._hl.Camera3D, screenX:Single, screenY:Single, options:flight._hl.Scene3DPickOptions):Bool;
	@:hlNative("flight", "flight_pick_scene3d_all")
	public static function pickScene3dAll(outArray:hl.Bytes, scene:hl.Bytes, camera:flight._hl.Camera3D, screenX:Single, screenY:Single, options:flight._hl.Scene3DPickOptions):Void;
	@:hlNative("flight", "flight_pick_scene3d_all_with_ray3d")
	public static function pickScene3dAllWithRay3d(outArray:hl.Bytes, scene:hl.Bytes, ray:flight._hl.Ray3D, options:flight._hl.Scene3DPickOptions):Void;
	@:hlNative("flight", "flight_pick_scene3d_with_ray3d")
	public static function pickScene3dWithRay3d(out:flight._hl.Scene3DHit, scene:hl.Bytes, ray:flight._hl.Ray3D, options:flight._hl.Scene3DPickOptions):Bool;
	@:hlNative("flight", "flight_get_scene3d_hit_material")
	public static function getScene3dHitMaterial(hit:flight._hl.Scene3DHit):hl.Bytes;
	@:hlNative("flight", "flight_get_scene3d_hit_subset_index")
	public static function getScene3dHitSubsetIndex(hit:flight._hl.Scene3DHit):Int;
	@:hlNative("flight", "flight_get_scene3d_hit_uv0")
	public static function getScene3dHitUv0(out:flight._hl.Vector2, hit:flight._hl.Scene3DHit):Bool;
	@:hlNative("flight", "flight_get_scene3d_hit_vertex_normal")
	public static function getScene3dHitVertexNormal(out:flight._hl.Vector3, hit:flight._hl.Scene3DHit):Bool;
	@:hlNative("flight", "flight_get_scene3d_hit_vertex_tangent")
	public static function getScene3dHitVertexTangent(out:flight._hl.Vector4, hit:flight._hl.Scene3DHit):Bool;
	@:hlNative("flight", "flight_is_scene3d_hit_front_facing")
	public static function isScene3dHitFrontFacing(hit:flight._hl.Scene3DHit, ray:flight._hl.Ray3D):Bool;
	@:hlNative("flight", "flight_free_scene3_dhit")
	public static function freeScene3Dhit(ptr:flight._hl.Scene3DHit):Void;
}
