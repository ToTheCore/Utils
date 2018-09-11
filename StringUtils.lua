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