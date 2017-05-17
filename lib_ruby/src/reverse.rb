def u_reverse(arr)

  i = 1
  n = arr.length + 1
  ans = Array.new
  while i < n
    ans.push(arr[-i])
    i += 1
  end

  return ans
end

p u_reverse([3,1,4,1,5,9])
