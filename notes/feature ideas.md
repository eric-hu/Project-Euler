Feature Ideas
==========

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
