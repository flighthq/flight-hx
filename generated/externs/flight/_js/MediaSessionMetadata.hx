package flight._js;

abstract MediaSessionMetadata(Dynamic) {
	public var title(get, set):String;
	inline function get_title():String return untyped this.title;
	inline function set_title(value:String):String return untyped this.title = value;
	public var artist(get, set):String;
	inline function get_artist():String return untyped this.artist;
	inline function set_artist(value:String):String return untyped this.artist = value;
	public var album(get, set):String;
	inline function get_album():String return untyped this.album;
	inline function set_album(value:String):String return untyped this.album = value;
}
