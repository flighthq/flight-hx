package flight._js._fn;

@:jsRequire("@flighthq/picking")
extern class Picking {
	@:native("createScene3DHit")
	public static function createScene3dHit():flight._js.Scene3DHit;
	@:native("pickScene3D")
	public static function pickScene3d(out:flight._js.Scene3DHit, scene:Dynamic, camera:flight._js.Camera3D, screenX:Float, screenY:Float, options:Null<flight._js.Scene3DPickOptions>):Bool;
	@:native("pickScene3DAll")
	public static function pickScene3dAll(outArray:Dynamic, scene:Dynamic, camera:flight._js.Camera3D, screenX:Float, screenY:Float, options:Null<flight._js.Scene3DPickOptions>):Void;
	@:native("pickScene3DAllWithRay3D")
	public static function pickScene3dAllWithRay3d(outArray:Dynamic, scene:Dynamic, ray:flight._js.Ray3D, options:Null<flight._js.Scene3DPickOptions>):Void;
	@:native("pickScene3DWithRay3D")
	public static function pickScene3dWithRay3d(out:flight._js.Scene3DHit, scene:Dynamic, ray:flight._js.Ray3D, options:Null<flight._js.Scene3DPickOptions>):Bool;
	@:native("getScene3DHitMaterial")
	public static function getScene3dHitMaterial(hit:flight._js.Scene3DHit):Null<Dynamic>;
	@:native("getScene3DHitSubsetIndex")
	public static function getScene3dHitSubsetIndex(hit:flight._js.Scene3DHit):Int;
	@:native("getScene3DHitUv0")
	public static function getScene3dHitUv0(out:flight._js.Vector2, hit:flight._js.Scene3DHit):Bool;
	@:native("getScene3DHitVertexNormal")
	public static function getScene3dHitVertexNormal(out:flight._js.Vector3, hit:flight._js.Scene3DHit):Bool;
	@:native("getScene3DHitVertexTangent")
	public static function getScene3dHitVertexTangent(out:flight._js.Vector4, hit:flight._js.Scene3DHit):Bool;
	@:native("isScene3DHitFrontFacing")
	public static function isScene3dHitFrontFacing(hit:flight._js.Scene3DHit, ray:flight._js.Ray3D):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene3Dhit(ptr:flight._js.Scene3DHit):Void {}
}
