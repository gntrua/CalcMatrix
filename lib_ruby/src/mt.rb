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
  d1 = 0
  d2 = 0
  x = 0
  y = 0
  while d1 < n and d2 < m
    if mt[d2][d1] != 0
      y = d2
      a = mt[d2][d1]

      while y < m
        mt[y][d1]=mt[y][d1]/a
        y += 1
      end

      a = 1
      y = d2
      x = 0

      while x < n
        if x != d1 then
          a = mt[d2][x]
          while y < m
            mt[y][x]-=mt[y][d1]*a
            y += 1  
          end
        end
        x += 1
        y = d2 
      end

      d1+=1
      d2+=1

    else
      flag = 1
      x = d1
      while x < m and flag == 1
        if mt[d2][x] != 0
          flag = 0
          t = 0
          while t < m
            temp = mt[t][x]
            mt[t][x] = mt[t][d1]
            mt[t][d1] = temp
            t += 1
          end
        end
        x+=1
      end

      if flag == 1
        d2+=1
      end

    end
    
  end

  x =0
  y=0
  while x<n
    while y<m
      if mt[y][x].denominator == 1 then
        mt[y][x]=mt[y][x].to_f
      end
      y += 1
    end
    y=0
    x+=1
  end

  return mt
end


def join(a,b)
  n1 = a[0].length
  m1 = a.length
  n2 = b[0].length
  m2 = b.length

  if n1 == n2 then
    x = 0
    while x < m2
      a.push(b[x])
      x += 1
    end
  end
  return a
end

def rank(arr)
  a = kanyaku(arr)
  n = a[0].length
  d1 = 0
  d2 = 0
  c = 0

  while d1 < n and d2 < m
    if a[d2][d1] == 1
      c += 1
      d1+=1
      d2+=1
    else
      d2+=1
    end
  end 
end

