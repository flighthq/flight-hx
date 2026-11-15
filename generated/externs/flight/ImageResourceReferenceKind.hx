package flight;

abstract ImageResourceReferenceKind(Int) from Int to Int {
	public static inline var Embedded:ImageResourceReferenceKind = 0;
	public static inline var External:ImageResourceReferenceKind = 1;
}
