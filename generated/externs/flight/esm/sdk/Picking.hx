package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/picking")
extern class Picking {
  public static function createScene3DHit():flight.esm.types.picking.Types.Scene3DHit;
  public static function getScene3DHitMaterial(hit:flight.esm.types.picking.Types.Scene3DHit):Null<flight.esm.types.materials_contract.Types.Material>;
  public static function getScene3DHitSubsetIndex(hit:flight.esm.types.picking.Types.Scene3DHit):Float;
  public static function getScene3DHitUv0(out:flight.esm.types.geometry.Types.Vector2Like, hit:flight.esm.types.picking.Types.Scene3DHit):Bool;
  public static function getScene3DHitVertexNormal(out:flight.esm.types.geometry.Types.Vector3Like, hit:flight.esm.types.picking.Types.Scene3DHit):Bool;
  public static function getScene3DHitVertexTangent(out:Dynamic, hit:flight.esm.types.picking.Types.Scene3DHit):Bool;
  public static function isScene3DHitFrontFacing(hit:flight.esm.types.picking.Types.Scene3DHit, ray:flight.esm.types.geometry.Types.Ray3D):Bool;
  public static function pickScene3D(scene:flight.esm.types.scene3d.Types.Node3D, camera:flight.esm.types.camera.Types.Camera3D, screenX:Float, screenY:Float, out:flight.esm.types.picking.Types.Scene3DHit, ?options:Null<flight.esm.types.picking.Types.Scene3DPickOptions>):Null<flight.esm.types.picking.Types.Scene3DHit>;
  public static function pickScene3DAll(scene:flight.esm.types.scene3d.Types.Node3D, camera:flight.esm.types.camera.Types.Camera3D, screenX:Float, screenY:Float, outArray:Array<flight.esm.types.picking.Types.Scene3DHit>, ?options:Null<flight.esm.types.picking.Types.Scene3DPickOptions>):Void;
  public static function pickScene3DAllWithRay3D(scene:flight.esm.types.scene3d.Types.Node3D, ray:flight.esm.types.geometry.Types.Ray3D, outArray:Array<flight.esm.types.picking.Types.Scene3DHit>, ?options:Null<flight.esm.types.picking.Types.Scene3DPickOptions>):Void;
  public static function pickScene3DWithRay3D(scene:flight.esm.types.scene3d.Types.Node3D, ray:flight.esm.types.geometry.Types.Ray3D, out:flight.esm.types.picking.Types.Scene3DHit, ?options:Null<flight.esm.types.picking.Types.Scene3DPickOptions>):Null<flight.esm.types.picking.Types.Scene3DHit>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
