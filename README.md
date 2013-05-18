Project-Euler
=============

My solutions to Project Euler exercises.

For now, the coding philosophy of this repo is to use as few libraries as
possible.  While this goes against a DRY philosophy, I'm choosing this path
first to explore how basic libraries work.

In the future, I may build a branch or fork of this repo to try refactoring out
my code to use existing libraries.  This will be a good exercise in discovering
and employing existing libraries.


## An Interesting Benchmark Result (Pending further explanation)

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

## Feature Ideas

- Messages for assertions
- Move solutions out of comments into a solutions test file
- General purpose memoization
  - Pseudocode for a general-purpose memoize function

            def memoize function_name, arguments
              results ||= {}
              results[function_name] || = {} # {"prime_factorization_of" => {2 => 2}}
              unless results[function_name][arguments]
                results[function_name][arguments]= function_name.eval(arguments)
              end
              return results[function_name][arguments]
            end
    
  - This design removes memoization from function definitions, but doesn't
  allow for memoization of internal methods
