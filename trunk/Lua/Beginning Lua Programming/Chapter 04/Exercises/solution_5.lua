CompAll = function(A, B)
  if type(A) ~= type(B) then
    -- If they're of different types, sort them by type:
    A, B = type(A), type(B)
    print("compare type")
  elseif type(A) ~= "number" and type(A) ~= "string" then
    -- If they're something other than numbers or strings,
    -- sort them by their tostring representation:
    A, B = tostring(A), tostring(B)
  end
  return A < B
end

-- Like pairs, but iterates in order by key:
function SortedPairs(Tbl)
  local Sorted = {} -- A (soon to be) sorted array of Tbl's keys.
  for Key in pairs(Tbl) do
    Sorted[#Sorted + 1] = Key -- Same as table.insert.
  end
  table.sort(Sorted, CompAll)
  local I = 0

  -- The iterator itself:
  return function()
    I = I + 1
    local Key = Sorted[I]
    return Key, Tbl[Key]
  end
end

local hehe = {a=1, b=2, d=3,c=4}
for k,v in SortedPairs(hehe) do
  print(k,v)
end