# Array Merge Test for large arrays
#
# Originally taken from:
# http://stackoverflow.com/questions/7838093/big-array-manipulation-is-very-slow-in-ruby
#
# Total runtime on 2012 MBP w/16 GB ram: approx 20 minutes
#
# Sample output (results will differ each time)
#   average time for loop is 0.09577113000000001, total size of big_array is 260193
#   average time for loop is 0.18104516, total size of big_array is 512970
#   average time for loop is 0.22684273666666666, total size of big_array is 770129
#   average time for loop is 0.24441332, total size of big_array is 1039656
#   average time for loop is 0.27206628, total size of big_array is 1285838
#   average time for loop is 0.27098027333333335, total size of big_array is 1532865
#   average time for loop is 0.27777466142857143, total size of big_array is 1794527
big_array = []
loop_counter = 0
start_time = Time.now
# final target size of the big array
while big_array.length < 2_000_000
  loop_counter+=1
  # target size of one persons follower list
  random_size_of_followers = rand(5000)
  follower_list = []
  follower_counter = 0
  while follower_counter < random_size_of_followers
    follower_counter+=1
    # make ids very large so we get good spread and only some amt of dupes
    follower_id = rand(240000000) + 100000
    follower_list << follower_id
  end
  # combine the big list with this list
  big_array = big_array | follower_list
  end_time = Time.now

  # every 100 iterations check where we are and how long each loop and combine takes.
  if loop_counter % 100 == 0
    elapsed_time = end_time - start_time
    average_time = elapsed_time.to_f/loop_counter.to_f
    puts "average time for loop is #{average_time}, total size of big_array is #{big_array.length}"
    start_time = Time.now
    #loop_counter = 0
  end
end
