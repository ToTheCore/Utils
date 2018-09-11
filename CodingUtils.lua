--- This libary contains utils for a clean coding.

--- This function checks if the wanted file exist, and trys to load the wanted file.
function Include(path)
  -- path not found -> error.
  if (not fs.exists(path)) then
    error("[FATAL ERROR] Can't find libary \"" .. path .. "\".")
  end
  -- path not loadable -> error.
  if(not os.loadAPI(path)) then
    error("[FATAL ERROR] Can't load libary \"" .. path .. "\".")
  end
end