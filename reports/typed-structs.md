# Typed Struct Audit

Upstream commit: `5d24729f7360475e28a105ae0caeeaa2e1328260`

Direct typed-struct expression emission is enabled for every eligible schema.

| Metric | Count |
| --- | ---: |
| Candidates | 7 |
| Eligible | 6 |
| Ineligible | 1 |
| Declared fields | 23 |
| Bindable accesses | 2057 |
| Directly emitted accesses | 2057 |
| Reflective survivors | 0 |
| Dynamic escapes | 2 |

| Candidate | Purpose | Fields | Reads | Writes | Calls | Direct | Reflective survivors | Escapes | Eligible | Reasons |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | :---: | --- |
| `Vector2` | two-component numeric geometry leaf | 2 | 186 | 136 | 0 | 322 | 0 | 0 | yes | — |
| `Vector3` | three-component numeric geometry leaf | 3 | 735 | 405 | 0 | 1140 | 0 | 0 | yes | — |
| `Quaternion` | four-component rotation leaf | 4 | 84 | 132 | 0 | 216 | 0 | 0 | yes | — |
| `Matrix3` | 3x3 matrix holder | 1 | 49 | 0 | 0 | 49 | 0 | 0 | yes | — |
| `Matrix4` | 4x4 matrix holder | 1 | 115 | 0 | 0 | 115 | 0 | 0 | yes | — |
| `Rectangle` | four-component rectangle leaf | 4 | 422 | 214 | 0 | 0 | 0 | 2 | no | `presence-sensitive-use` |
| `ColorTransform` | render-hot RGBA multiplier and offset record | 8 | 159 | 56 | 0 | 215 | 0 | 0 | yes | — |
