package flight._js;

abstract Scene3DRenderList(Dynamic) {
	public var instancedMeshCount(get, set):Int;
	inline function get_instancedMeshCount():Int return untyped this.instancedMeshCount;
	inline function set_instancedMeshCount(value:Int):Int return untyped this.instancedMeshCount = value;
	public var meshCount(get, set):Int;
	inline function get_meshCount():Int return untyped this.meshCount;
	inline function set_meshCount(value:Int):Int return untyped this.meshCount = value;
}
