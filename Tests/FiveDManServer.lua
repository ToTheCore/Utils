os.loadAPI("/Utils/Utils") -- Load all Utils

-- Test server programm. 
local outMonitor = peripheral.wrap("top")
Console.SetDefaultForTerm(outMonitor or term)

local TestServerLabel = "TEST_SERVER1"
Console.WriteLine(Console.Type.Hint, "Setting label to " .. TestServerLabel)
shell.run("label", "set", TestServerLabel)

while(true) do
  Console.WriteLine(Console.Type.Hint, "Requesting server...")
  latestFetch = FiveDMan.Fetch()
  for num, fetch in pairs(latestFetch) do
    Console.WriteLine(Console.Type.Info, "sourcePC: " .. fetch.source .. " isScript: " .. fetch.isScript)
    if(fetch.isScript) then
      loadstring(fetch.value)
    else
      Console.WriteLine(Console.Type.Info, "Content: " .. fetch.value)
    end
  end
  -- Wait for 1 second.
  os.sleep(1)
end
