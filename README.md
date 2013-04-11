Project-Euler
=============

My solutions to Project Euler exercises.

For now, the coding philosophy of this repo is to use as few libraries as
possible.  While this goes against a DRY philosophy, I'm choosing this path
first to explore how basic libraries work.

In the future, I may build a branch or fork of this repo to try refactoring out
my code to use existing libraries.  This will be a good exercise in discovering
and employing existing libraries.


## Observations from Refactoring

The general lifecycle of methods I'm observing so far is:

1.  Problem-specific method
2.  Cross-problem method
3.  Optimized method

Tests are useful at transitions (refactors) to prevent certain blindspots.

Why test?

**Because changes to a method should be good changes.**

As obvious as that sounds, it's usually not obvious that a rewritten method
breaks some existing usage of it.  It's also not obvious when a speedup is
really a speedup instead of a fluke.

### 1 => 2 Refactor
Ideally, this refactor involves these 5 steps:

1. Write **tests** for the method as-is
2. **Genericize** a method to cover multiple use cases
3. **Verify** the method still passes existing tests (debug as necessary)
4. **Externalize** the method from its specific use into a **library**
5. **Rename** the method for consistency

**Tests**: For these project Euler problems, the problems themselves can be
non-trivial test cases.  Once a problem is successfully solved, an assertion
can be added to problems requiring the library to make it a test case.

**Rename**: Perform a read-through test to ensure that the post-refactor name
and function still match.  An example of this idea in practice is commit
820de49707a591c4 .

In this commit, `find_divisors` was renamed to `nontrivial_divisors_of`.  The
two methods are functionally the same, but `find_divisors` implies the results
include 1 and the number itself.  This inaccurately named method was
sufficient for the method's original purpose in problem 3, which is concerned
with prime factors of composite numbers.

An issue only arose when attempting to use the same method for problem 12,
which is concerned with the number of divisors of a given number.  This method
usage expected 1 and the number itself to be counted as divisors.  Chaos ensued
when this wasn't the case.

### 2 => 3 Refactor

1. Write **benchmarks** for the method as-is
2. **Optimize** the method
3. **Verify** the method still passes **tests** and improves on **benchmarks**

**Benchmarks**: Benchmarks serve as the metric on what to improve.  They let
the developer know when his job is done.  More importantly, they signal to the
developer *that he has a job*.  "Premature optimization", "yak-shaving", and
"YAGNI" are all terms used to describe the developers trying to improve
something that doesn't need improving (though yak-shaving has a positive
interpretation too).

**Optimization**: For this step, I'm still uncertain whether I prefer old
methods to be left in the codebase or relegated to Git's history.  For
production code, deletion of old code is the way to go.  For educational
projects like this one, having the "less-optimal" versions readily available
make testing and demonstration simpler.  I guess that settles it then.
