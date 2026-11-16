package flight;

#if (js && flight_esm)
extern inline function createScene3dHit():Scene3DHit {
	return flight._js._fn.Picking.createScene3dHit();
}
#else
extern inline function createScene3dHit():Scene3DHit {
#if hl
	return flight._hl._fn.Picking.createScene3dHit();
#elseif cpp
	return flight._cpp._fn.Picking.createScene3dHit();
#elseif (js && flight_esm)
	return flight._js._fn.Picking.createScene3dHit();
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pickScene3d(out:Scene3DHit, scene:Dynamic, camera:Camera3D, screenX:Float, screenY:Float, options:Null<Scene3DPickOptions>):Bool {
	return flight._js._fn.Picking.pickScene3d(out, scene, camera, screenX, screenY, options);
}
#else
extern inline function pickScene3d(out:Scene3DHit, scene:Dynamic, camera:Camera3D, screenX:Float, screenY:Float, options:Scene3DPickOptions):Bool {
#if hl
	return flight._hl._fn.Picking.pickScene3d(out, scene, camera, screenX, screenY, options);
#elseif cpp
	return flight._cpp._fn.Picking.pickScene3d(out, scene, camera, screenX, screenY, options);
#elseif (js && flight_esm)
	return flight._js._fn.Picking.pickScene3d(out, scene, camera, screenX, screenY, options);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pickScene3dAll(outArray:Dynamic, scene:Dynamic, camera:Camera3D, screenX:Float, screenY:Float, options:Null<Scene3DPickOptions>):Void {
	flight._js._fn.Picking.pickScene3dAll(outArray, scene, camera, screenX, screenY, options);
}
#else
extern inline function pickScene3dAll(outArray:Dynamic, scene:Dynamic, camera:Camera3D, screenX:Float, screenY:Float, options:Scene3DPickOptions):Void {
#if hl
	flight._hl._fn.Picking.pickScene3dAll(outArray, scene, camera, screenX, screenY, options);
#elseif cpp
	flight._cpp._fn.Picking.pickScene3dAll(outArray, scene, camera, screenX, screenY, options);
#elseif (js && flight_esm)
	flight._js._fn.Picking.pickScene3dAll(outArray, scene, camera, screenX, screenY, options);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pickScene3dAllWithRay3d(outArray:Dynamic, scene:Dynamic, ray:Ray3D, options:Null<Scene3DPickOptions>):Void {
	flight._js._fn.Picking.pickScene3dAllWithRay3d(outArray, scene, ray, options);
}
#else
extern inline function pickScene3dAllWithRay3d(outArray:Dynamic, scene:Dynamic, ray:Ray3D, options:Scene3DPickOptions):Void {
#if hl
	flight._hl._fn.Picking.pickScene3dAllWithRay3d(outArray, scene, ray, options);
#elseif cpp
	flight._cpp._fn.Picking.pickScene3dAllWithRay3d(outArray, scene, ray, options);
#elseif (js && flight_esm)
	flight._js._fn.Picking.pickScene3dAllWithRay3d(outArray, scene, ray, options);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pickScene3dWithRay3d(out:Scene3DHit, scene:Dynamic, ray:Ray3D, options:Null<Scene3DPickOptions>):Bool {
	return flight._js._fn.Picking.pickScene3dWithRay3d(out, scene, ray, options);
}
#else
extern inline function pickScene3dWithRay3d(out:Scene3DHit, scene:Dynamic, ray:Ray3D, options:Scene3DPickOptions):Bool {
#if hl
	return flight._hl._fn.Picking.pickScene3dWithRay3d(out, scene, ray, options);
#elseif cpp
	return flight._cpp._fn.Picking.pickScene3dWithRay3d(out, scene, ray, options);
#elseif (js && flight_esm)
	return flight._js._fn.Picking.pickScene3dWithRay3d(out, scene, ray, options);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene3dHitMaterial(hit:Scene3DHit):Null<Dynamic> {
	return flight._js._fn.Picking.getScene3dHitMaterial(hit);
}
#else
extern inline function getScene3dHitMaterial(hit:Scene3DHit):Dynamic {
#if hl
	return flight._hl._fn.Picking.getScene3dHitMaterial(hit);
#elseif cpp
	return flight._cpp._fn.Picking.getScene3dHitMaterial(hit);
#elseif (js && flight_esm)
	return flight._js._fn.Picking.getScene3dHitMaterial(hit);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene3dHitSubsetIndex(hit:Scene3DHit):Int {
	return flight._js._fn.Picking.getScene3dHitSubsetIndex(hit);
}
#else
extern inline function getScene3dHitSubsetIndex(hit:Scene3DHit):Int {
#if hl
	return flight._hl._fn.Picking.getScene3dHitSubsetIndex(hit);
#elseif cpp
	return flight._cpp._fn.Picking.getScene3dHitSubsetIndex(hit);
#elseif (js && flight_esm)
	return flight._js._fn.Picking.getScene3dHitSubsetIndex(hit);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene3dHitUv0(out:Vector2, hit:Scene3DHit):Bool {
	return flight._js._fn.Picking.getScene3dHitUv0(out, hit);
}
#else
extern inline function getScene3dHitUv0(out:Vector2, hit:Scene3DHit):Bool {
#if hl
	return flight._hl._fn.Picking.getScene3dHitUv0(out, hit);
#elseif cpp
	return flight._cpp._fn.Picking.getScene3dHitUv0(out, hit);
#elseif (js && flight_esm)
	return flight._js._fn.Picking.getScene3dHitUv0(out, hit);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene3dHitVertexNormal(out:Vector3, hit:Scene3DHit):Bool {
	return flight._js._fn.Picking.getScene3dHitVertexNormal(out, hit);
}
#else
extern inline function getScene3dHitVertexNormal(out:Vector3, hit:Scene3DHit):Bool {
#if hl
	return flight._hl._fn.Picking.getScene3dHitVertexNormal(out, hit);
#elseif cpp
	return flight._cpp._fn.Picking.getScene3dHitVertexNormal(out, hit);
#elseif (js && flight_esm)
	return flight._js._fn.Picking.getScene3dHitVertexNormal(out, hit);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene3dHitVertexTangent(out:Vector4, hit:Scene3DHit):Bool {
	return flight._js._fn.Picking.getScene3dHitVertexTangent(out, hit);
}
#else
extern inline function getScene3dHitVertexTangent(out:Vector4, hit:Scene3DHit):Bool {
#if hl
	return flight._hl._fn.Picking.getScene3dHitVertexTangent(out, hit);
#elseif cpp
	return flight._cpp._fn.Picking.getScene3dHitVertexTangent(out, hit);
#elseif (js && flight_esm)
	return flight._js._fn.Picking.getScene3dHitVertexTangent(out, hit);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isScene3dHitFrontFacing(hit:Scene3DHit, ray:Ray3D):Bool {
	return flight._js._fn.Picking.isScene3dHitFrontFacing(hit, ray);
}
#else
extern inline function isScene3dHitFrontFacing(hit:Scene3DHit, ray:Ray3D):Bool {
#if hl
	return flight._hl._fn.Picking.isScene3dHitFrontFacing(hit, ray);
#elseif cpp
	return flight._cpp._fn.Picking.isScene3dHitFrontFacing(hit, ray);
#elseif (js && flight_esm)
	return flight._js._fn.Picking.isScene3dHitFrontFacing(hit, ray);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene3Dhit(ptr:Scene3DHit):Void {
	flight._js._fn.Picking.freeScene3Dhit(ptr);
}
#else
extern inline function freeScene3Dhit(ptr:Scene3DHit):Void {
#if hl
	flight._hl._fn.Picking.freeScene3Dhit(ptr);
#elseif cpp
	flight._cpp._fn.Picking.freeScene3Dhit(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Picking.freeScene3Dhit(ptr);
#else
	#error "flight.Picking: no backend for this target."
#end
}
#end
