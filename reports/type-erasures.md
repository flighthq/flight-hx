# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 26930 |
| Modules with erasure | 1308 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 618 |
| `source-any` | 975 |
| `source-never` | 120 |
| `source-null` | 89 |
| `source-undefined` | 267 |
| `source-unknown` | 3927 |
| `standard-toolkit-boundary` | 20501 |
| `unclassified` | 433 |
