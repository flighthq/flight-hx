// Maintained public alias for the port's two-way union carrier. Generated
// Flight signatures that lower a TypeScript union (for example an effect list
// of `RenderEffect | Adjustment`) use `flighthq._internal._Union2`; consumer
// code that must name such a type should import this alias instead of
// reaching into the underscore namespace.
package flighthq;

typedef Union2<A, B> = flighthq._internal._Union2<A, B>;
