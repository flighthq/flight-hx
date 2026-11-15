package flight;

abstract AudioResourceReferenceKind(Int) from Int to Int {
	public static inline var Embedded:AudioResourceReferenceKind = 0;
	public static inline var External:AudioResourceReferenceKind = 1;
}
