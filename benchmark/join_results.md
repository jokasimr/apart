# DuckDB two-key equality-join benchmark

Measured on 2026-09-03 with DuckDB v1.5.4 on an Intel Xeon W-2265. Each query probes the lookup table with
10,000,000 event rows using two `INTEGER` equality keys. The composite lookup key is unique and every event has
exactly one match. DuckDB used a hash join with the lookup table as its build side. Execution was single-threaded.

Results are medians over 21 measured rounds after two warmups; MAD is the median absolute deviation. The measurement
includes both building the hash table and probing it, followed by a checksum aggregate over the joined payload.

| Lookup rows | Median (ms) | MAD (ms) | ns/event row | M event rows/s |
|---:|---:|---:|---:|---:|
| 10,000 | 160.00 | 2.00 | 16.00 | 62.50 |
| 30,000 | 221.00 | 1.00 | 22.10 | 45.25 |
