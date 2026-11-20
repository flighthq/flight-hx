package flight.esm.types.color;

#if (js && flight_esm)
@:jsRequire("@flighthq/color", "HslColor")
extern class HslColor {
  public function new(?raw:flight.esm.types.color_contract.Types.HslColorRaw);
  public final raw:flight.esm.types.color_contract.Types.HslColorRaw;
  public final h:Float;
  public final s:Float;
  public final l:Float;
  public function rgbToHsl(color:Float):Void;
  public static function create():flight.esm.types.color.Types.HslColor;
  public static function from(raw:flight.esm.types.color_contract.Types.HslColorRaw):flight.esm.types.color.Types.HslColor;
}

@:jsRequire("@flighthq/color", "HsvColor")
extern class HsvColor {
  public function new(?raw:flight.esm.types.color_contract.Types.HsvColorRaw);
  public final raw:flight.esm.types.color_contract.Types.HsvColorRaw;
  public final h:Float;
  public final s:Float;
  public final v:Float;
  public function rgbToHsv(color:Float):Void;
  public static function create():flight.esm.types.color.Types.HsvColor;
  public static function from(raw:flight.esm.types.color_contract.Types.HsvColorRaw):flight.esm.types.color.Types.HsvColor;
}

@:jsRequire("@flighthq/color", "LinearColor")
extern class LinearColor {
  public function new(?raw:flight.esm.types.color_contract.Types.LinearColorRaw);
  public final raw:flight.esm.types.color_contract.Types.LinearColorRaw;
  public final r:Float;
  public final g:Float;
  public final b:Float;
  public final a:Float;
  public function packToColor():Float;
  public function unpackColor(color:Float):Void;
  public function lerp(start:flight.esm.types.color.Types.LinearColor, end:flight.esm.types.color.Types.LinearColor, t:Float):Void;
  public static function create():flight.esm.types.color.Types.LinearColor;
  public static function from(raw:flight.esm.types.color_contract.Types.LinearColorRaw):flight.esm.types.color.Types.LinearColor;
}

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
