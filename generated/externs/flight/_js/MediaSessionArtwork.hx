package flight._js;

abstract MediaSessionArtwork(Dynamic) {
	public var src(get, set):String;
	inline function get_src():String return untyped this.src;
	inline function set_src(value:String):String return untyped this.src = value;
}
