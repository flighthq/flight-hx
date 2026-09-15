package flight._internal;

#if js
@:native("Intl.Segmenter")
extern class _IntlSegmenter {
  function new(?locales:Dynamic, ?options:_IntlSegmenterOptions);
  function segment(value:String):Dynamic;
  function resolvedOptions():Dynamic;
  static function supportedLocalesOf(locales:Dynamic, ?options:Dynamic):Array<String>;
}
#else
#error "Intl.Segmenter-backed transpiled modules require a target runtime implementation."
#end
