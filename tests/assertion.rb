# Homebrewed assertion code, inspired by
#   http://stackoverflow.com/a/3264330/640517
#
# TODO: Add custom message support
class AssertionError < RuntimeError
end

def assert &block
  raise AssertionError unless yield
end
