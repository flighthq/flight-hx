package;

import flighthq._internal.WebGl2RenderingContext;

class WebGl2BindingSmoke {
  static function main():Void {
    #if js
    final context:Dynamic = js.Syntax.code('globalThis.__flightWebGl2');
    #else
    final context:Dynamic = null;
    #end
    WebGl2RenderingContext.call(
      context,
      'clear',
      cast [WebGl2RenderingContext.field(context, 'COLOR_BUFFER_BIT')]
    );
  }
}
