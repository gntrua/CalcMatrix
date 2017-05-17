# -*- coding: utf-8 -*-
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
    temp.push(b[x].to_r)
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

def times(arr1,arr2)
  x = 0
  y = 0
  a = 0
  b = 0
  i = 0
  k = 0
  if arr1.length == arr2[0].length
    n = arr1[0].length
    m = arr2.length
    ans = Array.new(m).collect{Array.new(n)}
    while i < n
      while k < m
        y = i
        a = k
        c = 0
        num = 0
        while num < arr1.length
          c += arr1[num][y] * arr2[a][num]
          num += 1
        end
        ans[k][i] = c
        k += 1
      end
      k = 0
      i += 1
    end  
    return ans
  else
    return 0
  end
end

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

def kanyaku(mt) 

  n = mt[0].length
  m = mt.length
  output(mt)
  d = 0
  x = 0
  y = 0
  a = 0
  while d < n and d < m
    if mt[d][d] != 0
      a = 1 / mt[d][d]
      x = d
      while x < m
        mt[d][x] *= a
        x += 1
      end
      y = 0
      x = d
      while y < n
        if y != d then
          a = mt[d][y]
          while x < m
            mt[x][y] -= mt[x][d]*a
            x += 1
          end
        end
        x = d
        y += 1
        
      end
    end
    d += 1
  end

  return mt
end
