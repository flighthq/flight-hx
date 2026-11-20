package flight._cpp._fn;

extern class Assets {
	@:native("flight_explain_asset_load")
	public static function explainAssetLoad(library:cpp.Star<cpp.Void>, id:cpp.ConstCharStar):flight._cpp.AssetLoadExplanation;
	@:native("flight_free_asset_load_explanation")
	public static function freeAssetLoadExplanation(ptr:flight._cpp.AssetLoadExplanation):Void;
}
