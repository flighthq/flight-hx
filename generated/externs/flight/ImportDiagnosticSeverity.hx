package flight;

abstract ImportDiagnosticSeverity(Int) from Int to Int {
	public static inline var Drop:ImportDiagnosticSeverity = 0;
	public static inline var Recover:ImportDiagnosticSeverity = 1;
	public static inline var Reject:ImportDiagnosticSeverity = 2;
	public static inline var Skip:ImportDiagnosticSeverity = 3;
}
