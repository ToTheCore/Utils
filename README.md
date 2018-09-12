# Utils
Utils for the ToTheCore repository.

# Installation
You can install the "Utils" libary with two methods.

## Method 1 - ToTheCore full install
To install the "Utils" with the full core read the readme from the downloader repo.
https://github.com/ToTheCore/Downloader

## Method 2 - Single install
To install the "Utils" libary only, run the following commands in your ComputerCraft computer.
### Step 1 - Move to root, download wget.
```shell
cd /
pastebin get QwrHQaZK wget
```
### Step 2 - Download the Utils installer, run the installer.
```shell
wget https://raw.githubusercontent.com/ToTheCore/Utils/master/installer.lua /Utils/installer
/Utils/installer
```

# Use the "Utils" libary in your programms.
Just add the following line to the beginning of your script.
```lua
os.loadAPI("/Utils/Utils") -- Load all Utils
```
That's all.

# Documentation.
# Console
The Console class contains the following functions:
```lua
--- Function just flooded the console with empty prints.
-- @param[opt=term] monitor Monitor wich should be cleaned.
Console.ClearScreen(monitor)

--- Initalize the console api.
--- Gets then length of the longest type text.
Console.Init()

--- Sets the cursor to the next line
-- @param[opt=term] monitor Monitor on wich the cursor should be setten.
Console.CursorToNextLine(monitor) 

--- Checks if the given message type is a existing Type.
-- @error Throws error if message type is not a valid Type.
Console.SetDefaultForTerm(monitor)

--- Returns the color for the given type.
-- @params msgType Wanted type.
-- @returns {string} Matching color for the given type.
-- @error Throws error if there is no matching ColorType for the given Type.
Console.IsValidType(msgType)

--- Sets the console text color to the given colorStr.
-- @param[opt=term] monitor Monitor that color should be changed.
Console.GetColorForType(msgType)

--- Sets the console text color to the given colorStr.
-- @param[opt=term] monitor Monitor that color should be changed.
Console.SetTextColor(colorStr, monitor)

--- Returns the message day and time head part.
--- "[XX:XX|XX]"
-- @returns Color free string with this format: "[XX:XX|XX]".
Console.getHeadDayTime()

--TODO: Rewrite this with function "cleanDurtyString(coloredString)".. [CleanerCode]
--- Returns the string length for the message head. 
--- "[12, XX:XX][TYPE]   "
--- Without color codes.
-- @returns The length of the full message head without colors.
Console.getMessageHeadLength(msgType)

--- Prints a line with length perfect length to cut the console. 
-- @param[opt="-"] printChr Char for the printed line.
-- @param[opt=term] monitor Outputmonitor for the message.
Console.PrintLine(printChr, monitor)

--- Writes a new line to the console output. Formated with the Type and time.
-- @param msgType {Console.Type} The type of the message.
-- @param message {string} The output string.
-- @param[opt=term] monitor Outputmonitor for the message.
Console.WriteLine(msgType, message, monitor)
```

The following msgType can be used for the Console.WriteLine() function.
```lua
  -- Prepare monitor.
  local m = peripheral.wrap("top")
  m.clear()
  m.setTextScale(0.5)
  
  -- Write messages.
  Console.WriteLine(Console.Type.Info, "Message with the type Info", m)
  Console.WriteLine(Console.Type.Warn, "Message with the type Warn ", m)
  Console.WriteLine(Console.Type.Error, "Message with the type Error ", m)
  Console.WriteLine(Console.Type.Init, "Message with the type Init ", m)
  Console.WriteLine(Console.Type.Debug, "Message with the type Debug ", m)
  Console.WriteLine(Console.Type.Line, "Message with the type Line ", m)
  Console.WriteLine(Console.Type.Config, "Message with the type Config ", m)
  Console.WriteLine(Console.Type.Hint, "Message with the type Hint ", m)
  Console.WriteLine(Console.Type.Export, "Message with the type Export", m)
```

![Console Types](https://github.com/ToTheCore/Documentation/blob/master/Screenshots/Utils_ConsoleTypes.png?raw=true)


