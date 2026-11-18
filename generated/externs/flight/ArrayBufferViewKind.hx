package flight;

abstract ArrayBufferViewKind(Int) from Int to Int {
	public static inline var Uint8Array:ArrayBufferViewKind = 0;
	public static inline var Uint8ClampedArray:ArrayBufferViewKind = 1;
	public static inline var Int8Array:ArrayBufferViewKind = 2;
	public static inline var Uint16Array:ArrayBufferViewKind = 3;
	public static inline var Int16Array:ArrayBufferViewKind = 4;
	public static inline var Uint32Array:ArrayBufferViewKind = 5;
	public static inline var Int32Array:ArrayBufferViewKind = 6;
	public static inline var Float32Array:ArrayBufferViewKind = 7;
	public static inline var Float64Array:ArrayBufferViewKind = 8;
	public static inline var DataView:ArrayBufferViewKind = 9;
}
