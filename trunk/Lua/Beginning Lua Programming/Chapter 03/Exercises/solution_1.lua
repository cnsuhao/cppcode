function TypedToString(Val)
  return type(Val) .. ": " .. tostring(Val)
end

print(TypedToString(1))
print(TypedToString(false))
print(TypedToString("hehe"))
print(TypedToString({}))