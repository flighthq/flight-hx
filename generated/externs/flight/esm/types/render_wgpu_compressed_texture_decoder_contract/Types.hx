package flight.esm.types.render_wgpu_compressed_texture_decoder_contract;

#if (js && flight_esm)
typedef WgpuCompressedTextureDecoder = ((format:flight.esm.types.texture_formats.Types.TextureContainerFormat, width:Float, height:Float, data:js.lib.Uint8Array) -> Null<js.lib.Uint8Array>);

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
