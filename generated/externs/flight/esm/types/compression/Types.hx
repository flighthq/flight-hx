package flight.esm.types.compression;

#if (js && flight_esm)
typedef Compression = String;

typedef CompressionFraming = String;

typedef Decompressor = ((compressed:js.lib.Uint8Array, uncompressedLength:Float, framing:flight.esm.types.compression.Types.CompressionFraming) -> Null<js.lib.Uint8Array>);

typedef HostCompressDeflateCapability = { compress:((bytes:js.lib.Uint8Array, framing:flight.esm.types.compression.Types.CompressionFraming) -> js.lib.Uint8Array) };

typedef HostCompressLzmaCapability = { compress:((bytes:js.lib.Uint8Array, framing:flight.esm.types.compression.Types.CompressionFraming) -> js.lib.Uint8Array) };

typedef HostDecompressBrotliCapability = { decompress:flight.esm.types.compression.Types.Decompressor };

typedef HostDecompressDeflateCapability = { decompress:flight.esm.types.compression.Types.Decompressor };

typedef HostDecompressLzmaCapability = { decompress:flight.esm.types.compression.Types.Decompressor };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
