-- Console handler
-- User for console output.

os.loadAPI("/Utils/Utils") -- Load all Utils

--- Message types. Used for formatted console output.
--- IMPORTANT: Be sure, that there is a "ColorType" for each "Type".
--- IMPORTANT: Be sure, that there is no type with text length over 8. -- @Github issue #6
Type = {
  Info = "Info",
  Warn = "Warn",
  Error = "Error",
  Init = "Init",
  Debug = "Debug",
  Line = "------",
  Config = "Config",
  Hint = "Hint",
  Export = "Export"
}

ColorType = {
  Info = colors.green,
  Warn = colors.yellow,
  Error = colors.red,
  Init = colors.orange,
  Debug = colors.cyan,
  Line = colors.gray,
  Config = colors.lightBlue,
  Hint = colors.blue,
  Export = colors.lime
}

local longestTypeTextLength = 0

--- Function just flooded the console with empty prints.
--@param[opt=term] monitor Monitor wich should be cleaned.
function ClearScreen(monitor)
  monitor = monitor or term
  monitor.setCursorPos(1,1)
  monitor.clear()
end

--- Initalize the console api.
--- Gets then length of the longest type text.
function Init()
  for key, value in pairs(Type) do
    if (#value > longestTypeTextLength) then
      longestTypeTextLength = #value
    end
  end
  term.setCursorPos(1,1)
  term.setCursorBlink(true) -- debug
end

--- Sets the cursor to the next line
-- @param[opt=term] monitor Monitor on wich the cursor should be setten.
function CursorToNextLine(monitor) 
  monitor = monitor or term
  X, Y = monitor.getCursorPos()

  -- Scroll if monitor height max is reached.
  _, mHeight = monitor.getSize()
  if(Y >= mHeight) then
    monitor.scroll(1)
    monitor.setCursorPos(1, Y)
  else
    monitor.setCursorPos(1, Y+1)
  end
end

--- Sets the default output for the console.
-- @param[opt=tern] monitor Monitor wich should be the default.
function SetDefaultForTerm(monitor)
  monitor = monitor or term

  -- Monitor is not the terminal -> set textscale to 0.5. 
  if(monitor ~= term) then
    WriteLine(Type.Hint, "Redirecting output to a monitor.", term)
    ClearScreen(monitor)
    monitor.setTextScale(0.5)
    term.redirect(monitor)
  end

  Init()
end

--- Checks if the given message type is a existing Type.
-- @error Throws error if message type is not a valid Type.
function IsValidType(msgType)
  for k,v in pairs(Type) do
    if (v == msgType) then
      return
    end
  end
  -- There is no same Type -> error.
  error("[FATAL ERROR][CONSOLE] The type \"" .. msgType.. "\" is not a valid \"Console.Type\".")
end

--- Returns the color for the given type.
-- @params msgType Wanted type.
-- @returns {string} Matching color for the given type.
-- @error Throws error if there is no matching ColorType for the given Type.
function GetColorForType(msgType)
  -- Check msgType.
  IsValidType(msgType)

  for key1, value1 in pairs(Type) do
    if (value1 == msgType) then
      for key2, value2 in pairs(ColorType) do
        if (key1 == key2) then
          return value2
        end
      end
    end
  end

 -- There is no color for the given type -> error.
 error("[FATAL ERROR][CONSOLE] The type \"" .. msgType .. "\" has no \"Console.ColorType\".")
end

--- Sets the console text color to the given colorStr.
-- @param[opt=term] monitor Monitor that color should be changed.
function SetTextColor(colorStr, monitor)
  monitor = monitor or term
  monitor.setTextColor(colorStr)
end

--- Returns the message day and time head part.
--- "[XX:XX|XX]"
-- @returns Color free string with this format: "[XX:XX|XX]".
function getHeadDayTime()
  return StringUtils.PadRight(
          textutils.formatTime(os.time(), true)  -- Current time in 24H
          .. " " .. os.day()                     -- Minecraft world day.
          .. "|", 6 + #tostring(os.day()))
end

--TODO: Rewrite this with function "cleanDurtyString(coloredString)".. [CleanerCode]
--- Returns the string length for the message head. 
--- "[12, XX:XX][TYPE]   "
--- Without color codes.
-- @returns The length of the full message head without colors.
function getMessageHeadLength(msgType)
  -- Check msgType.
  IsValidType(msgType)

  -- Write message type with correct spacing for table like look and return length of it.
  local messageHeadLength = #getHeadDayTime()
  local typeTextSpacing = StringUtils.PadRight("", longestTypeTextLength - #msgType) .. "|"
  return messageHeadLength + #msgType + #typeTextSpacing
end

--- Writes a new line to the console output. Formated with the Type and time.
-- @param msgType {Console.Type} The type of the message.
-- @param message {string} The output string.
-- @param[opt=term] monitor Outputmonitor for the message.
function WriteLine(msgType, message, monitor)
  monitor = monitor or term
  
  -- Check msgType.
  IsValidType(msgType)

  mWidth, _ = monitor.getSize()

  -- TODO: Think about better solution.
  if(mWidth > 15) then  
    -- Write day, time in gray.
    SetTextColor(colors.lightGray, monitor)
    monitor.write(getHeadDayTime()) -- Correct padRight, added day length.

    -- Write message type with correct color code and correct spacing for table like look.
    local typeText = msgType
    local typeTextSpacing = StringUtils.PadRight("", longestTypeTextLength - #msgType)
    SetTextColor(GetColorForType(msgType), monitor)
    monitor.write(msgType)
    SetTextColor(colors.lightGray, monitor)
    monitor.write(typeTextSpacing)
    monitor.write("|")
  
    -- Message is line -> gray message color.
    if (msgType == Type.Line) then
      SetTextColor(colors.gray, monitor)
    elseif (msgType == Type.Warn) then -- Message is warn -> orange message color.
      SetTextColor(colors.orange, monitor)
    elseif (msgType == Type.Error) then -- Message is error -> red message color.
      SetTextColor(colors.red, monitor)
    else --> Other messages -> white message color.
      SetTextColor(colors.white, monitor)
    end
  end
  -- Write message with linefeed at the end.
  monitor.write(message)
  CursorToNextLine(monitor)
end

--- Prints a line with length perfect length to cut the console. 
-- @param[opt="-"] printChr Char for the printed line.
-- @param[opt=term] monitor Outputmonitor for the message.
function PrintLine(printChr, monitor)
  monitor = monitor or term
  printChr = printChr or "-"
  -- printChr is more than one char -> error.
  if(#printChr ~= 1) then
    error("[FATAL ERROR][CONSOLE]The parameter \"printChr\" must be a string with a length of exactly one.")
  end

  local consoleWidth, consoleHeight = monitor.getSize()
  WriteLine(Type.Line, StringUtils.PadRight("", consoleWidth - getMessageHeadLength(Type.Line), printChr), monitor)
end

-- Call of init function
Init()