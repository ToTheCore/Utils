--- This libary contains utils for a clean coding.

--- This function checks if the wanted file exist, and trys to load the wanted file.
function include(path)
  -- path not found -> error.
  if (not fs.exists(path)) then
    error("[FATAL ERROR] Can't find libary \"" .. path .. "\".")
  end
  -- path not loadable -> error.
  if(not os.loadAPI(path)) then
    error("[FATAL ERROR] Can't load libary \"" .. path .. "\".")
  end
end

--- Creating a readonly table.
--
function makeReadOnly(tbl)
  return setmetatable({}, {
      __index = tbl,
      __newindex = function(t, key, value)
          error("attempting to change constant " ..
                 tostring(key) .. " to " .. tostring(value), 2)
      end
  })
end