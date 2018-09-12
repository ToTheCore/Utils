--- Fills up the given string with spaces or the given char up to the wanted length.
-- @param str The string wich should be filled up.
-- @param length The wanted length
-- [opt=" "] chr The char wich shpuld be used to fill the string up.
-- @returns string Upfilled string.
function PadRight(str, length, chr)
  chr = chr or " "
  str = "" .. str

  if(length >= #str) then
    str = str .. string.rep(chr, length - #str)
  end
  
  return str
end

-- Formats big numbers, e.g. 1234567 to 1.234.567 for better reading
function numformat(number)
    if string.len(number) < 4 then
    elseif string.len(number) < 7 then
      number = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1.%2')
    elseif string.len(number) < 10 then
      number = string.gsub(number, "^(-?%d+)(%d%d%d)(%d%d%d)", '%1.%2.%3')
    elseif string.len(number) < 13 then
      number = string.gsub(number, "^(-?%d+)(%d%d%d)(%d%d%d)(%d%d%d)", '%1.%2.%3.%4')
    elseif string.len(number) > 13 then
      number = string.gsub(number, "^(-?%d+)(%d%d%d)(%d%d%d)(%d%d%d)(%d%d%d)", '%1.%2.%3.%4.%5')
    end
  return number
end

-- Formats big numbers, e.g. 1234 to 1,2k and 1234567 to 1,2m
function numformatk(number)
    if string.len(number) < 4 then
    elseif string.len(number) < 7 then
      number = string.gsub(number, "^(-?%d+)(%d)(%d)(%d)", '%1,%2'.." k")
    elseif string.len(number) < 10 then
      number = string.gsub(number, "^(-?%d+)(%d)(%d)(%d)(%d%d%d)", '%1,%2'.." m")
    else 
      number = string.gsub(number, "^(-?%d+)(%d%d%d)(%d%d%d)(%d%d%d)(%d%d%d)", '%1.%2'.." m")
    end
  return number
end