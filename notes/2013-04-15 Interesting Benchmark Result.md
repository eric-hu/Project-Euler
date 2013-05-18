An Interesting Benchmark Result (Pending further explanation)
====================

2013-04-15
----------
Looks like a demonstration of the O-notation constant factor overhead.
For finding the number of divisors of a number, prime factorization has better
asymptotic behavior than brute force counting.  However, the results below show
brute force is faster for an input of around 1 million

> $ ruby benchmarks/primes_benchmark.rb
> Benchmarking divisor_count_of
> Finding divisor count for:
> 1048577
> Rehearsal -------------------------------------------------------
> prime factorization   2.260000   0.010000   2.270000 (  2.268582)
> brute force           0.180000   0.000000   0.180000 (  0.176105)
> ---------------------------------------------- total: 2.450000sec
>
>                           user     system      total        real
> prime factorization   2.140000   0.000000   2.140000 (  2.142908)
> brute force           0.170000   0.000000   0.170000 (  0.178108)
> prime factorization result: 4
> brute force result: 4
> results equal?
> true
> Finding divisor count for:
> 33554433
> Rehearsal -------------------------------------------------------
> prime factorization   0.060000   0.000000   0.060000 (  0.052127)
> brute force           5.630000   0.000000   5.630000 (  5.643294)
> ---------------------------------------------- total: 5.690000sec
>
>                           user     system      total        real
> prime factorization   0.050000   0.000000   0.050000 (  0.056392)
> brute force           5.760000   0.010000   5.770000 (  5.776573)
> prime factorization result: 16
> brute force result: 16
> results equal?
> true
