package flight._js;

abstract ColladaDeferredCameraBinding(Dynamic) {
	public var cameraId(get, set):String;
	inline function get_cameraId():String return untyped this.cameraId;
	inline function set_cameraId(value:String):String return untyped this.cameraId = value;
	public var nodeIndex(get, set):Int;
	inline function get_nodeIndex():Int return untyped this.nodeIndex;
	inline function set_nodeIndex(value:Int):Int return untyped this.nodeIndex = value;
}
