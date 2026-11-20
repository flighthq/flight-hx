package flight._hl._fn;

extern class Assets {
	@:hlNative("flight", "flight_explain_asset_load")
	public static function explainAssetLoad(library:hl.Bytes, id:hl.Bytes):flight._hl.AssetLoadExplanation;
	@:hlNative("flight", "flight_free_asset_load_explanation")
	public static function freeAssetLoadExplanation(ptr:flight._hl.AssetLoadExplanation):Void;
}
