Project-Euler
=============

My solutions to Project Euler exercises.

For now, the coding philosophy of this repo is to use as few libraries as
possible.  While this goes against a DRY philosophy, I'm choosing this path
first to explore how basic libraries work.

In the future, I may build a branch or fork of this repo to try refactoring out
my code to use existing libraries.  This will be a good exercise in discovering
and employing existing libraries.



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
