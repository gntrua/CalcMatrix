# -*- coding: utf-8 -*-
require './times.rb'
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
      while x < n and flag == 1
        if mt[d2][x] != 0
          flag = 0
           t = 0
          while t < m
            mt[t][x],mt[t][d1]=mt[t][d1],mt[t][x]
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


mt = input()
output(kanyaku(mt))

