require './mt.rb'
def position(base,ent)
  
  arr = join(base,ent)
  arr = kanyaku(arr)

  pos = arr[-1]

  return pos

end
