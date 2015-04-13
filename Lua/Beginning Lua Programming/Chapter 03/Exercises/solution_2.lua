function SumProd(A, B)
  return A + B, A * B
end

function Test()
    return (SumProd(1, 2))
end
print(Test())