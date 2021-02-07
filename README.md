
# Jsonifier class

Minimalistic library for encoding JSON directly to strict bytestring.

This library is built on top of Jsonifier and provides type classes that
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
1kB/jsonifier                            mean 2.054 μs  ( +- 30.83 ns  )
1kB/aeson                                mean 6.456 μs  ( +- 126.7 ns  )
1kB/lazy-aeson                           mean 6.338 μs  ( +- 169.1 ns  )
1kB/lazy-aeson-untrimmed-32k             mean 6.905 μs  ( +- 280.2 ns  )
1kB/buffer-builder                       mean 5.550 μs  ( +- 113.2 ns  )

6kB/jsonifier                            mean 12.80 μs  ( +- 196.9 ns  )
6kB/aeson                                mean 31.28 μs  ( +- 733.2 ns  )
6kB/lazy-aeson                           mean 30.30 μs  ( +- 229.5 ns  )
6kB/lazy-aeson-untrimmed-32k             mean 29.17 μs  ( +- 371.3 ns  )
6kB/buffer-builder                       mean 30.39 μs  ( +- 387.2 ns  )

60kB/jsonifier                           mean 122.9 μs  ( +- 1.492 μs  )
60kB/aeson                               mean 258.4 μs  ( +- 1.000 μs  )
60kB/lazy-aeson                          mean 259.4 μs  ( +- 4.494 μs  )
60kB/lazy-aeson-untrimmed-32k            mean 255.7 μs  ( +- 3.239 μs  )
60kB/buffer-builder                      mean 309.0 μs  ( +- 3.907 μs  )

600kB/jsonifier                          mean 1.299 ms  ( +- 16.44 μs  )
600kB/aeson                              mean 3.389 ms  ( +- 106.8 μs  )
600kB/lazy-aeson                         mean 2.520 ms  ( +- 45.51 μs  )
600kB/lazy-aeson-untrimmed-32k           mean 2.509 ms  ( +- 30.76 μs  )
600kB/buffer-builder                     mean 3.012 ms  ( +- 85.22 μs  )

6MB/jsonifier                            mean 20.91 ms  ( +- 821.7 μs  )
6MB/aeson                                mean 30.74 ms  ( +- 509.4 μs  )
6MB/lazy-aeson                           mean 24.83 ms  ( +- 184.3 μs  )
6MB/lazy-aeson-untrimmed-32k             mean 24.93 ms  ( +- 383.2 μs  )
6MB/buffer-builder                       mean 32.98 ms  ( +- 700.1 μs  )

60MB/jsonifier                           mean 194.8 ms  ( +- 13.93 ms  )
60MB/aeson                               mean 276.0 ms  ( +- 5.194 ms  )
60MB/lazy-aeson                          mean 246.9 ms  ( +- 3.122 ms  )
60MB/lazy-aeson-untrimmed-32k            mean 245.1 ms  ( +- 1.050 ms  )
60MB/buffer-builder                      mean 312.0 ms  ( +- 4.896 ms  )
```

The benchmark suite is bundled with the package.
