# Homebrewed assertion code, inspired by
#   http://stackoverflow.com/a/3264330/640517
#
# TODO: Add custom message support
class AssertionError < RuntimeError
end

def assert &block
  raise AssertionError unless yield
end

# class Object
#   # example:
#   #   foo.should(eq(20))
#   # "foo should equal 20, but was 10" on failure
#   def should
#
#   end
# end
