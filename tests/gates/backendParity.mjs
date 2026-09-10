// Backend-parity gate (STUB). Once the bindings backend (tools/backend-hx) emits
// generated/{hx,cpp,js}, this must structurally diff the public surfaces of the
// _cpp / _js / _hx backings — same type names, field shapes, and function
// signatures — and fail on any drift, or flight.* diverges silently per target.
// Fails loud until implemented so it is never a false green.
process.stderr.write('backend-parity gate: not implemented yet (blocked on tools/backend-hx emitting generated bindings).\n');
process.exit(1);
