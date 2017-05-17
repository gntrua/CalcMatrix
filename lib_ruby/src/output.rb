def output(arr)
  n = arr[0].length
  m = arr.length
  l = 0
  x = 0
  char = ""
  i = 0
  while l < n
    i = 0
    while i < m
      char += arr[i][l].to_s + " "
      i += 1
    end
    print "[ #{char}]\n"
    char = ""
    l += 1
  end
  puts
end
