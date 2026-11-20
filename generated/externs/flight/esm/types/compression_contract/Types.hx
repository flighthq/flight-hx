package flight.esm.types.compression_contract;

#if (js && flight_esm)
typedef Compression = flight.esm.types.compression.Types.Compression;

typedef CompressionFraming = flight.esm.types.compression.Types.CompressionFraming;

typedef Decompressor = flight.esm.types.compression.Types.Decompressor;

typedef HostCompressDeflateCapability = flight.esm.types.compression.Types.HostCompressDeflateCapability;

typedef HostCompressLzmaCapability = flight.esm.types.compression.Types.HostCompressLzmaCapability;

typedef HostDecompressBrotliCapability = flight.esm.types.compression.Types.HostDecompressBrotliCapability;

typedef HostDecompressDeflateCapability = flight.esm.types.compression.Types.HostDecompressDeflateCapability;

typedef HostDecompressLzmaCapability = flight.esm.types.compression.Types.HostDecompressLzmaCapability;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
