def input()
  a=Array.new
  while line=gets
    a.push(line.split.map(&:to_r))
  end
  puts
  
  return a
end

def output(arr)
  arr.each do |arry|
    p arry.map{|num|if num.denominator==1 then num=num.to_f else num end}
  end
end

def product(arr1,arr2)
  i=0
  j=0
  num=0
  n=arr1.length
  m=arr2[0].length
  nm=arr1[0].length
  ans =Array.new(n){Array.new(m,0)}

  while i<n
    while j<m
      while num < nm
        ans[i][j]+=arr1[i][num]*arr2[num][j]
        num+=1
      end
      num=0
      j+=1
    end
    j=0
    i+=1
  end

  return ans
end

def kanyaku(arr)
  mt=Marshal.load(Marshal.dump(arr))
  n = mt.length
  m = mt[0].length
  d1=0
  d2=0
  x=0
  y=0
  while d1<n and d2<m
    if mt[d1][d2]!=0
      y=d2
      a=mt[d1][d2]

      while y<m
        mt[d1][y]=mt[d1][y]/a
        y+=1
      end
      a=1
      y=d2
      x=0
      while x<n
        if x!=d1 then
          a=mt[x][d2]
          while y<m
            mt[x][y]-=mt[d1][y]*a
            y+=1
          end
        end
        x+=1
        y=d2
      end
      d1+=1
      d2+=1
    else
      flag=1
      x=d1
      while x<n and flag==1
        if mt[x][d2]!=0 then
          flag=0
          t=0
          while t<m
            mt[x][t],mt[d1][t]=mt[d1][t],mt[x][t]
            t+=1
          end
        end
        x+=1
      end

      if flag==1
        d2+=1
      end
    end
  end
  
  x=0
  y=0
  while x<n
    while y<m
      if mt[x][y].denominator==1 then
        mt[x][y]=mt[x][y].to_f
      end
      y+=1
    end
    y=0
    x+=1
  end

  return mt
end

def rank(arr)
  arr=kanyaku(arr)
  n=arr.length
  m=arr[0].length
  d1=0
  d2=0
  c=0

  while d1<n and d2<m
    if arr[d1][d2]==1
      c+=1
      d1+=1
      d2+=1
    else
      d2+=1
    end
  end
  return c
end

def join(arr1,arr2)
  if arr1.length==arr2.length then
    r = 0
    while r<arr1.length
      arr1[r]+=arr2[r]
      r+=1
    end
  end
  return arr1
end

def u_reverse(arr)
  i=1
  n=arr.length+1
  ans=Array.new

  while i<n
    ans.push(arr[-i])
    i+=1
  end

  return ans
end

def R_break(arr)
  n=arr.length
  m=arr[0].length
  ans=Array.new(m){Array.new}
  i=0
  j=0

  while i<n
    while j<m
      ans[j].push(arr[i][j])
      j+=1
    end
    j=0
    i+=1
  end
  return ans
end

def trans(arr)
  n=arr.length
  m=arr[0].length
  ans=Array.new(m){Array.new}
  i=0
  j=0

  while i<n
    while j<m
      ans[j].push(arr[i][j])
      j+=1
    end
    j=0
    i+=1
  end
  return ans
end

def div(arr,num,flag)
  arr=R_break(arr)
  arr1=R_break(arr[0..num])
  arr2=R_break(arr[num+1..-1])
  if flag == 1
    return arr1
  else
    return arr2
  end
end

def inverse(arr)
  if rank(arr)==arr.length and arr.length == arr[0].length then
    return div(kanyaku(join(arr,iden(arr.length))),arr.length-1,0)
  end
end

def iden(n)
  arr=Array.new(n){Array.new(n,0)}
  i=0
  while i<n
    arr[i][i]=1
    i+=1
  end
  return arr
end

def i_pro(vec1,vec2)

  n=vec1.length
  i=0
  sum=0
  while i<n
    sum+=vec1[i]*vec2[i]
    i+=1
  end
  return sum
end

def o_pro(vec1,vec2)
  if vec1.length==3 and vec2.length==3

    vec3=[vec1[1]*vec2[2]-vec1[2]*vec2[1],vec1[2]*vec2[0]-vec1[0]*vec2[2],vec1[0]*vec2[1]-vec1[1]*vec2[0]]
    
    return vec3
  else
    return 0
  end
end

def det(arr)

  if arr.length > 2
    i=0
    j=0
    sum=0
    while j<arr.length
      num = Marshal.load(Marshal.dump(arr))
      num.delete_at(0)
      x=0
      while x<num.length
        num[x].delete_at(j)
        x+=1
      end
      p num
      p arr[0][j]*det(num)
      sum+=arr[0][j]*det(num)*((-1)**(j))
      j+=1
    end
    return sum
  else
    return (arr[0][0]*arr[1][1]-arr[0][1]*arr[1][0])
  end

end


