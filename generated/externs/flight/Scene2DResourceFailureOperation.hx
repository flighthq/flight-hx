package flight;

abstract Scene2DResourceFailureOperation(Int) from Int to Int {
	public static inline var CreateScene2DDocumentFromBytes:Scene2DResourceFailureOperation = 0;
	public static inline var LoadScene2DAudioResources:Scene2DResourceFailureOperation = 1;
	public static inline var LoadScene2DDocumentFromUrl:Scene2DResourceFailureOperation = 2;
	public static inline var LoadScene2DImageResources:Scene2DResourceFailureOperation = 3;
	public static inline var ResolveScene2DResources:Scene2DResourceFailureOperation = 4;
}
