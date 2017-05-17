def input()

  a = gets.chomp
  size = a.length

  n = 0
  m = 0
  i = 2
  k = 0
  if a[1] == "["
    while i < a.length
      if a[i] == "]"
        break
      end
      i += 1
    end  
    n = a[2..(i-1)].split(",").length
  else
    n = 1
  end
  b = a[0..(a.length-1)].delete("/[|]/").split(",")
  m = b.length / n
  x = 0
  y = 0
  arr = []
  count = 0
  temp = []
  while x < b.length
    temp.push(b[x].to_f)
    count += 1
    if count == n
      count = 0
      arr.push(temp)
      temp = []
    end
    x += 1
  end
  return arr
end
