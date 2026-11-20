package flight.esm.textshaper;

#if (js && flight_esm)
@:jsRequire("@flighthq/textshaper/contract")
extern class Contract {
  public static final TextDirectionLeftToRight:String;
  public static final TextDirectionRightToLeft:String;
  public static final TextDirectionTopToBottom:String;
  public static final TextFeatureCapitals:String;
  public static final TextFeatureContextualAlternates:String;
  public static final TextFeatureDiscretionaryLigatures:String;
  public static final TextFeatureFractions:String;
  public static final TextFeatureKerning:String;
  public static final TextFeatureLigatures:String;
  public static final TextFeatureOldStyleFigures:String;
  public static final TextFeatureSmallCaps:String;
  public static final TextFeatureStylisticAlternates:String;
  public static final TextFeatureSubscript:String;
  public static final TextFeatureSuperscript:String;
  public static final TextFeatureTabularFigures:String;
  public static function acquireShapedRun():flight.esm.types.textshaper.Types.ShapedRun;
  public static function clearShapedRun(run:flight.esm.types.textshaper.Types.ShapedRun):Void;
  public static function clearTextShaperCache(cache:flight.esm.types.textshaper.Types.TextShaperCache):Void;
  public static function createShapedRun():Dynamic;
  public static function createTextShaperCache():flight.esm.types.textshaper.Types.TextShaperCache;
  public static function disableTextShaperGuards():Void;
  public static function disposeTextShaperCache(cache:flight.esm.types.textshaper.Types.TextShaperCache):Void;
  public static function disposeTextShaperSignals():Void;
  public static function enableTextShaperGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function enableTextShaperSignals():flight.esm.types.textshaper.Types.TextShaperSignals;
  public static function explainTextShaperOperation(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, operation:String):Dynamic;
  public static function getCaretPositionsForRun(run:flight.esm.types.textshaper.Types.ShapedRun):Array<Float>;
  public static function getClusterForIndex(run:flight.esm.types.textshaper.Types.ShapedRun, stringIndex:Float):Float;
  public static function getCodePointForGlyph(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, glyphId:Float, _format:flight.esm.types.textformat.Types.TextFormat):Float;
  public static function getFontMetrics(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, format:flight.esm.types.textformat.Types.TextFormat):Null<flight.esm.types.textshaper.Types.FontMetrics>;
  public static function getFontMetricsInto(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, format:flight.esm.types.textformat.Types.TextFormat, out:flight.esm.types.textshaper.Types.FontMetrics):Bool;
  public static function getFontUnitScale(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, format:flight.esm.types.textformat.Types.TextFormat):Float;
  public static function getGlyphExtents(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, glyphId:Float, _format:flight.esm.types.textformat.Types.TextFormat):Null<flight.esm.types.textshaper.Types.GlyphExtents>;
  public static function getGlyphExtentsBatch(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, glyphIds:Array<Float>, _format:flight.esm.types.textformat.Types.TextFormat, out:Array<flight.esm.types.textshaper.Types.GlyphExtents>):Float;
  public static function getGlyphExtentsInto(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, glyphId:Float, _format:flight.esm.types.textformat.Types.TextFormat, out:flight.esm.types.textshaper.Types.GlyphExtents):Bool;
  public static function getGlyphIndexForCodePoint(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, codePoint:Float, _format:flight.esm.types.textformat.Types.TextFormat):Float;
  public static function getGlyphName(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, glyphId:Float, _format:flight.esm.types.textformat.Types.TextFormat):String;
  public static function getIndexRangeForCluster(run:flight.esm.types.textshaper.Types.ShapedRun, cluster:Float, ?stringLength:Null<Float>):Null<Array<Float>>;
  public static function getTextShaperSignals():Null<flight.esm.types.textshaper.Types.TextShaperSignals>;
  public static function hasTextShaperOperation(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, operation:String):Bool;
  public static function initializeShapedRun(out:flight.esm.types.entity_contract.Types.EntityConstruction<Dynamic>):Void;
  public static function initializeTextShaperCache(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.textshaper.Types.TextShaperCache>):Void;
  public static function initializeTextShaperSignals(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.textshaper.Types.TextShaperSignals>):Void;
  public static function itemizeText(text:String, _format:flight.esm.types.textformat.Types.TextFormat, ?options:Null<flight.esm.types.textshaper.Types.TextShaperOptions>):Array<flight.esm.types.textshaper.Types.TextItem>;
  public static function measureText(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, text:String, format:flight.esm.types.textformat.Types.TextFormat):Float;
  public static function releaseShapedRun(run:flight.esm.types.textshaper.Types.ShapedRun):Void;
  public static function setShapedRunReleaseGuard(guard:Null<((run:flight.esm.types.textshaper.Types.ShapedRun) -> Void)>):Void;
  public static function shapeTextRun(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, text:String, format:flight.esm.types.textformat.Types.TextFormat, ?options:Null<flight.esm.types.textshaper.Types.ShapeRunOptions>):Null<flight.esm.types.textshaper.Types.ShapedRun>;
  public static function shapeTextRunCached(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, cache:flight.esm.types.textshaper.Types.TextShaperCache, text:String, format:flight.esm.types.textformat.Types.TextFormat, ?options:Null<flight.esm.types.textshaper.Types.ShapeRunOptions>):Null<flight.esm.types.textshaper.Types.ShapedRun>;
  public static function shapeTextRunInto(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, text:String, format:flight.esm.types.textformat.Types.TextFormat, out:flight.esm.types.textshaper.Types.ShapedRun, ?options:Null<flight.esm.types.textshaper.Types.ShapeRunOptions>):Bool;
  public static function shapeTextRuns(hostTextShaper:flight.esm.types.textshaper.Types.HostTextShaperCapability, text:String, format:flight.esm.types.textformat.Types.TextFormat, ?options:Null<flight.esm.types.textshaper.Types.TextShaperOptions>):Array<flight.esm.types.textshaper.Types.ShapedRun>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
