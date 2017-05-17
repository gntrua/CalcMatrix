require './mt.rb'
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
