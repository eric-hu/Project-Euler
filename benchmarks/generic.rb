# Generic benchmark template to compare 2 implementations

require 'benchmark'
#n = 100
#Benchmark.bm do |x|

  #x.report 'implementation 1' do
    #n.times do
    #end
  #end

  #x.report 'implementation 2' do
    #n.times do
    #end
  #end
#end

# ========================  Array as a list vs a Hash =========================
n = 10
Benchmark.bm do |x|

  x.report 'array as list' do
    n.times do
      a = []
      1_000_000.times do
        a.push rand(10)
      end
    end
  end

  x.report 'hash as list' do
    n.times do
      a = {}
      1_000_000.times do |c|
        a[c] = rand(10)
      end
    end
  end
end
