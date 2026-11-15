package flight;

abstract FlightErrorKind(Int) from Int to Int {
	public static inline var Error:FlightErrorKind = 0;
	public static inline var NotReadableError:FlightErrorKind = 1;
	public static inline var NotSupportedError:FlightErrorKind = 2;
	public static inline var RangeError:FlightErrorKind = 3;
	public static inline var SyntaxError:FlightErrorKind = 4;
	public static inline var TypeError:FlightErrorKind = 5;
}
