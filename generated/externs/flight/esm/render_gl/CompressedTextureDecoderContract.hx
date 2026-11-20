package flight.esm.render_gl;

#if (js && flight_esm)
@:jsRequire("@flighthq/render-gl/compressed-texture-decoder-contract")
extern class CompressedTextureDecoderContract {
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
