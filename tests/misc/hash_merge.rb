# Hash version of array_merge
all_followers = { }
loop_counter = 0
start_time = Time.now

while (all_followers.length < 2_000_000)
  # target size of one persons follower list
  follower_list = []

  rand(5000).times do
    # generate a follower id
    follower_id = rand(240000000) + 100000

    # add follower id to a follower list
    follower_list << follower_id

    # add follower id to 'all followers' list (big_array in foo.rb)
    all_followers[follower_id] = true
  end

  end_time = Time.now

  # every 100 iterations check where we are and how long each loop and combine takes.
  loop_counter += 1

  if (loop_counter % 100 == 0)
    elapsed_time = end_time - start_time
    average_time = elapsed_time.to_f/loop_counter.to_f
    puts "average time for loop is #{average_time}, total size of all_followers is #{all_followers.length}"
    start_time = Time.now
  end
end
