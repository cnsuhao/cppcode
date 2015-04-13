debug._traceback = debug.traceback

debug.traceback = function(Str)
  return debug._traceback('Programmer error: ' .. Str)
end


function B()
  print(debug.traceback("B"))
end

function A()
  print(debug.traceback("A 1"))
  B()
  print(debug.traceback("A 2"))
end

A()
