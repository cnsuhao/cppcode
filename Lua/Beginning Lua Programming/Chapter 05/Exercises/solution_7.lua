-- Turns $XYZ into the value of the global variable XYZ (XYZ
-- is any identifier):
function Interpolate(Str)
  return (string.gsub(Str, "%$([%a_][%w_]*)",
    function(Ident)
      return tostring(getfenv()[Ident])
    end))
end
Where, Who, What ="in xanadu", "kubla khan", "a stately pleasure-dome"
print(Interpolate("$Where did $Who\n$What decree"))