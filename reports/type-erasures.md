# Type Erasure Audit

This report counts explicit `IrType.dynamic` nodes after module construction, including expression type metadata.

| Metric | Count |
| --- | ---: |
| Total erasures | 30540 |
| Modules with erasure | 1493 |
| Checker-known unrepresentable erasures | 0 |

## Reasons

| Reason | Count |
| --- | ---: |
| `external-toolkit-boundary` | 609 |
| `source-any` | 1294 |
| `source-never` | 194 |
| `source-null` | 277 |
| `source-undefined` | 551 |
| `source-unknown` | 4743 |
| `standard-toolkit-boundary` | 22029 |
| `unclassified` | 843 |
