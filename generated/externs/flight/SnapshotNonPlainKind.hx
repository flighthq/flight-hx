package flight;

abstract SnapshotNonPlainKind(Int) from Int to Int {
	public static inline var ArrayBuffer:SnapshotNonPlainKind = 0;
	public static inline var Date:SnapshotNonPlainKind = 1;
	public static inline var Map:SnapshotNonPlainKind = 2;
	public static inline var RegExp:SnapshotNonPlainKind = 3;
	public static inline var Set:SnapshotNonPlainKind = 4;
	public static inline var TypedArray:SnapshotNonPlainKind = 5;
}
