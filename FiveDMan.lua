-- http://ruffo.ddns.net:8080/Github/ToTheCore/WebAPI/5DMAN/
-- ToTheCore/Utils/#14
--os.loadAPI("/Utils/Utils") -- Load all Utils

------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------       Config       ------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
--TODO: Write config manager
--TODO: create issue for this.
function LoadConfig()
  settingsFilePath = "/Utils/FiveDManConfig"

  -- There is no settings file? -> create one.
  if (not fs.exists(settingsFilePath)) then
    Console.WriteLine(Console.Type.Warn, 'There is no "' .. settingsFilePath .. '" file.')
    Console.WriteLine(Console.Type.Hint, 'Creating new "'.. settingsFilePath .. '" with default settings..')

    -- Write settings.
    local file = io.open(filePath, "w")
    file:write('host = "http://ruffo.ddns.net:8080/Github/ToTheCore/WebAPI/5DMan.php" -- PHP file \n')
    file:close()

    Console.WriteLine(Console.Type.Hint, "done.")
  end

  -- Load settings file
  Console.WriteLine(Console.Type.Init, 'Loading config "' .. settingsFilePath .. '".')
  os.loadAPI(settingsFilePath)
end
LoadConfig()

------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------       Code       --------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
--?command=send&sourceId=2&TargetLabel=WebDebug2&Value=Console.WriteLine(Console.Type.Debug,"DebuggingShit")
--?command=fetch&sourceId=3
--?command=register&Label=WebDebug

myId = nil
-- Register computer, get id.
loadstring(CodingUtils.http_string(FiveDManConfig.host .. "?command=register&Label=" .. os.getComputerLabel()))()
Console.WriteLine(Console.Type.Info, "FiveDManId: " .. myId)

--- Returns all new messages in the following table format:
--- {
---   {source="sourceLabel", value="Value", isScript=false},
---   {source="sourceLabel", value="Value", isScript=true}
--- }
function Fetch()
  loadstring(CodingUtils.http_string(FiveDManConfig.host .. "?command=fetch&sourceId=" .. myId))()
  return result
end

function SendScript(targetLabel, scriptString)
  CodingUtils.http_string(
    FiveDManConfig.host ..
      "?command=sendScript&sourceId=" .. myId .. "&TargetLabel=" .. targetLabel .. "&Value=" .. scriptString
  )
end

function Send(targetLabel, valueString)
  CodingUtils.http_string(
    FiveDManConfig.host ..
      "?command=sendScript&sourceId=" .. myId .. "&TargetLabel=" .. targetLabel .. "&Value=" .. valueString
  )
end

---5DMan.register(string "name", number x, number y, number z): string // returns session id.
---5DMan.send(target, commands string[]) // throiws error, if register don't run successfully.
