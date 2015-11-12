LUA_PATH = "?;?.lua;../?;../?.lua"


require "sqlite3"


db = sqlite3.open_memory()

db:exec([[
  CREATE TABLE test (
    id		INTEGER PRIMARY KEY,
    content	VARCHAR
  );
  
  INSERT INTO test VALUES (NULL, 'Hello World');
  INSERT INTO test VALUES (NULL, 'Hello Lua');
  INSERT INTO test VALUES (NULL, 'Hello Sqlite3')
]])


for row in db:rows("SELECT * FROM test") do
  print(row.id, row.content)
end



