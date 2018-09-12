--- Contains a few UI tools.
-- TODO: Remove
local testMonitor = peripheral.wrap("left")
Console.WriteLine(Console.Type.Info, "Message with the type Info", testMonitor)
Console.WriteLine(Console.Type.Warn, "Message with the type Warn ", testMonitor)
Console.WriteLine(Console.Type.Error, "Message with the type Error ", testMonitor)
Console.WriteLine(Console.Type.Init, "Message with the type Init ", testMonitor)
Console.WriteLine(Console.Type.Debug, "Message with the type Debug ", testMonitor)
Console.WriteLine(Console.Type.Line, "Message with the type Line ", testMonitor)
Console.WriteLine(Console.Type.Config, "Message with the type Config ", testMonitor)
Console.WriteLine(Console.Type.Hint, "Message with the type Hint ", testMonitor)
Console.WriteLine(Console.Type.Export, "Message with the type Export", testMonitor)