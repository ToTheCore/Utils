--- This libary contains utils for a clean coding.

--- This function checks if the wanted file exist, and trys to load the wanted file.
function include(path)
  -- path not found -> error.
  if (not fs.exists(path)) then
    error('[FATAL ERROR] Can\'t find libary "' .. path .. '".')
  end
  -- path not loadable -> error.
  if (not os.loadAPI(path)) then
    error('[FATAL ERROR] Can\'t load libary "' .. path .. '".')
  end
end

--- Creating a readonly table.
--
function makeReadOnly(tbl)
  return setmetatable(
    {},
    {
      __index = tbl,
      __newindex = function(t, key, value)
        error("attempting to change constant " .. tostring(key) .. " to " .. tostring(value), 2)
      end
    }
  )
end

--- Gets the content from the given url.
function http_string(url)
  resultStr = ""
  local timer = os.startTimer(120)
  http.request(url)
  while true do
    local event, id, data = os.pullEvent()

    -- Timeout --> error.
    if (event == "timer" and timer == id) then
      error("Timeout: Download timed out. (over 120sec)")
    end

    -- Download failed -> error.
    if (event == "http_failure") then
      error("Download: Faild to download file. Url: " .. url)
    end

    if event == "http_success" then
      resultStr = data.readAll()
      data:close()
      return resultStr
    end
  end
end
