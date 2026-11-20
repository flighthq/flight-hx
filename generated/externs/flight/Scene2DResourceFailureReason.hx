package flight;

abstract Scene2DResourceFailureReason(Int) from Int to Int {
	public static inline var AudioResourcesUnresolved:Scene2DResourceFailureReason = 0;
	public static inline var DocumentFetchFailed:Scene2DResourceFailureReason = 1;
	public static inline var DocumentImportFailed:Scene2DResourceFailureReason = 2;
	public static inline var DocumentImporterMissing:Scene2DResourceFailureReason = 3;
	public static inline var ImageResourcesUnresolved:Scene2DResourceFailureReason = 4;
	public static inline var RequiredSlotsUnresolved:Scene2DResourceFailureReason = 5;
}
