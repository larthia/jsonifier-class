
# Jsonifier class

Minimalistic library for encoding JSON directly to strict bytestring.

Jsonifier Class is built on top of Jsonifier library and provides type classes that
implement the compatibility layer for Aeson library.

# Performance

## Benchmarks

Following are the benchmark results comparing the performance
of encoding typical documents using this library, "aeson" and "buffer-builder".
Every approach is measured on Twitter API data of sizes ranging from roughly 1kB to 60MB.
"aeson" stands for "aeson" producing a strict bytestring,
"lazy-aeson" - lazy bytestring,
"lazy-aeson-untrimmed-32k" - lazy bytestring using an untrimmed builder strategy with allocation of 32k.
"buffer-builder" is another library providing an alternative JSON encoder.

```
stack bench --benchmark-arguments="-s"
...
1kB/jsonifier                            mean 1.863 μs  ( +- 74.00 ns  )
1kB/jsonifier-class                      mean 1.830 μs  ( +- 29.53 ns  )
1kB/aeson                                mean 6.641 μs  ( +- 189.7 ns  )
1kB/lazy-aeson                           mean 6.796 μs  ( +- 207.7 ns  )
1kB/lazy-aeson-untrimmed-32k             mean 8.871 μs  ( +- 1.060 μs  )
1kB/buffer-builder                       mean 5.705 μs  ( +- 159.3 ns  )

6kB/jsonifier                            mean 12.01 μs  ( +- 884.3 ns  )
6kB/jsonifier-class                      mean 11.79 μs  ( +- 322.1 ns  )
6kB/aeson                                mean 33.25 μs  ( +- 2.319 μs  )
6kB/lazy-aeson                           mean 32.77 μs  ( +- 1.452 μs  )
6kB/lazy-aeson-untrimmed-32k             mean 31.25 μs  ( +- 833.7 ns  )
6kB/buffer-builder                       mean 31.79 μs  ( +- 806.7 ns  )

60kB/jsonifier                           mean 112.7 μs  ( +- 4.018 μs  )
60kB/jsonifier-class                     mean 110.4 μs  ( +- 2.144 μs  )
60kB/aeson                               mean 280.5 μs  ( +- 5.876 μs  )
60kB/lazy-aeson                          mean 280.6 μs  ( +- 11.52 μs  )
60kB/lazy-aeson-untrimmed-32k            mean 276.3 μs  ( +- 3.931 μs  )
60kB/buffer-builder                      mean 316.6 μs  ( +- 8.433 μs  )

600kB/jsonifier                          mean 1.162 ms  ( +- 17.75 μs  )
600kB/jsonifier-class                    mean 1.162 ms  ( +- 20.24 μs  )
600kB/aeson                              mean 4.039 ms  ( +- 1.881 ms  )
600kB/lazy-aeson                         mean 2.756 ms  ( +- 158.1 μs  )
600kB/lazy-aeson-untrimmed-32k           mean 2.723 ms  ( +- 88.67 μs  )
600kB/buffer-builder                     mean 3.107 ms  ( +- 89.24 μs  )

6MB/jsonifier                            mean 19.29 ms  ( +- 1.195 ms  )
6MB/jsonifier-class                      mean 19.05 ms  ( +- 947.6 μs  )
6MB/aeson                                mean 32.99 ms  ( +- 670.5 μs  )
6MB/lazy-aeson                           mean 27.34 ms  ( +- 3.042 ms  )
6MB/lazy-aeson-untrimmed-32k             mean 26.72 ms  ( +- 395.9 μs  )
6MB/buffer-builder                       mean 33.87 ms  ( +- 417.4 μs  )

60MB/jsonifier                           mean 174.6 ms  ( +- 12.85 ms  )
60MB/jsonifier-class                     mean 172.4 ms  ( +- 9.261 ms  )
60MB/aeson                               mean 293.8 ms  ( +- 3.827 ms  )
60MB/lazy-aeson                          mean 266.3 ms  ( +- 1.678 ms  )
60MB/lazy-aeson-untrimmed-32k            mean 268.0 ms  ( +- 6.864 ms  )
60MB/buffer-builder                      mean 317.6 ms  ( +- 3.437 ms  )
```

The benchmark suite is bundled with the package.
