--[[ This file contains some of the functions defined in
Chapter 3.  They can be individually cut-and-pasted into an
interpreter session, or you can run the whole file and
access its functions from the interpreter by using (from the
shell):

  lua -i various.lua

or (from within the interpreter):

  dofile("various.lua")

Both these techniques are explained in Chapter 3. ]]

-- Prints a greeting:
function Greet(Name)
  print("Hello, " .. Name .. ".")
end

-- A different function that prints a greeting (this
-- overwrites the above Greet function):
function Greet(Name)
  if Name == "Joe" then
    MsgStr = "Whaddya know, Joe?"
  else
    MsgStr = "Hello, " .. Name .. "."
  end
  print(MsgStr)
end

print(Greet("Joe"))
