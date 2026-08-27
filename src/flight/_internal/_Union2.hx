// Maintained type support for generated Flight Haxe.
package flight._internal;

/**
 * A preserved TypeScript union in the typed intermediate.
 *
 * The Haxe runtime representation is transparent because upstream values are
 * not tagged. Backends such as Rust consume the two alternatives from the
 * generated type instead of rediscovering them from `Dynamic`.
 */
typedef _Union2<A, B> = haxe.extern.EitherType<A, B>;
