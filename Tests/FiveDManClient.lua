os.loadAPI("/Utils/Utils") -- Load all Utils

local TestServerLabel = "TEST_SERVER1"

function writeActions()
  Console.WriteLine(Console.Type.Hint, "Possible modes: ")
  Console.WriteLine(Console.Type.Hint, "[0] Script, [0e] Example script")
  Console.WriteLine(Console.Type.Hint, "[1] Content, [1e] Example content")
end

Console.ClearScreen()

while(true) do
  writeActions()
  -- Read and check user input.
  local input = read()

  if(input == "0") then
    Console.WriteLine(Console.Type.Info, "Write the script:")
    script = read()

    FiveDMan.SendScript(TestServerLabel, script)
  elseif(input == "1") then
    Console.WriteLine(Console.Type.Info, "Write the content:")
    content = read()

    FiveDMan.Send(TestServerLabel, content)
  elseif(input == "0e") then
    local example = "myLabel = os.getComputerLabel() Console.WriteLine(Console.Type.Warn, \"Hello warn from \" .. myLabel .. \")"

    Console.WriteLine(Console.Type.Info, "Example script:")
    Console.WriteLine(Console.Type.Hint, example)

    FiveDMan.SendScript(TestServerLabel, example)
  elseif(input == "1e") then
    local example = "Hello world yay!"

    Console.WriteLine(Console.Type.Info, "Example content:")
    Console.WriteLine(Console.Type.Hint, example)

    FiveDMan.SendScript(TestServerLabel, example)
  end

  Console.ClearScreen()
  Console.WriteLine(Console.Type.Hint, "Done.. Check server if successfull.")

end

 