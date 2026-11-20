package flight._js._fn;

@:jsRequire("@flighthq/assets")
extern class Assets {
	@:native("explainAssetLoad")
	public static function explainAssetLoad(library:Dynamic, id:String):flight._js.AssetLoadExplanation;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAssetLoadExplanation(ptr:flight._js.AssetLoadExplanation):Void {}
}
