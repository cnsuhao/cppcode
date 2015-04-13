function JoinPairs(AList, BList)
  local function Iter()
    local Pos = 1
    local A, B = AList[Pos], BList[Pos]
    while A ~= nil and B ~= nil do
      coroutine.yield(A, B)
      Pos = Pos + 1
      A, B = AList[Pos], BList[Pos]
    end
  end
  return coroutine.wrap(Iter)
end

local x = {1,3,5,7,9}
local y = {2,4,6,8,10}
for a,b in JoinPairs(x, y) do
  print(a,b)
end