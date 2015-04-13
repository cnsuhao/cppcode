module(..., package.seeall)

function Quote(Str)
  return string.format("%q", Str)
end

function hehe(table, key)
    return key .. "didn't exist in module" .. table._NAME
end
setmetatable(package.loaded[...], {__index=hehe})