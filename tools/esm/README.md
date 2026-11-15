# Static ESM output

`EsmGenerator.hx` is the custom Haxe JS generator used by this package. It maps
generated `@:jsRequire("flight")` externs to static namespace imports and uses
Haxe's expression codegen for the consumer body.

Compile with `-D flight_esm --macro EsmGenerator.use() -dce full`. The package
macro adds this generator's classpath. A bundler and a real ESM module exporting
the generated `flight_*` names are runtime requirements; the old `@flighthq/*`
workspace bundler is no longer part of this repository.

`npm run gate:package` checks static imports and rejects runtime `require()` in
the emitted smoke consumer. It does not pretend to execute an absent runtime.
