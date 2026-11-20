package flight.esm.intl;

#if (js && flight_esm)
@:jsRequire("@flighthq/intl/contract")
extern class Contract {
  public static function compareStrings(a:String, b:String, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):Float;
  public static function formatCompactNumber(value:Float, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatCurrency(value:Float, currency:String, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatDate(date:Dynamic, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatDateTime(date:Dynamic, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatList(items:Array<String>, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatNumber(value:Float, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatPercent(value:Float, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatRelativeTime(value:Float, unit:String, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatTime(date:Dynamic, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function formatUnit(value:Float, unit:String, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function getCacheKey(kind:String, locale:flight.esm.types.intl.Types.LocaleInput, options:Dynamic):String;
  public static function getCached<T>(key:String, build:(() -> T)):T;
  public static function selectOrdinalCategory(value:Float, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function selectPluralCategory(value:Float, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):String;
  public static function sortStrings(items:Array<String>, locale:flight.esm.types.intl.Types.LocaleInput, ?options:Dynamic):Array<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
