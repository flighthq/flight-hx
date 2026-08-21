# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 25718 |
| Modules with erasure | 1178 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 618 |
| `source-any` | 935 |
| `source-never` | 120 |
| `source-null` | 83 |
| `source-undefined` | 267 |
| `source-unknown` | 3874 |
| `standard-toolkit-boundary` | 19412 |
| `unclassified` | 409 |
