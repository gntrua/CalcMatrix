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
