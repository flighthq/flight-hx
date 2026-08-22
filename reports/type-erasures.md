# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 26320 |
| Modules with erasure | 1183 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 618 |
| `source-any` | 955 |
| `source-never` | 120 |
| `source-null` | 86 |
| `source-undefined` | 267 |
| `source-unknown` | 3874 |
| `standard-toolkit-boundary` | 19980 |
| `unclassified` | 420 |
