-- Try loading CodingUtils file.
local codingUtilsPath = "/Utils/CodingUtils"
-- path not found -> error.
if (not fs.exists(codingUtilsPath)) then
  error("[FATAL ERROR] Can't find libary \"" .. codingUtilsPath .. "\".")
end
-- path not loadable -> error.
if(not os.loadAPI(codingUtilsPath)) then
  error("[FATAL ERROR] Can't load libary \"" .. codingUtilsPath .. "\".")
end

-- Include other utils.
CodingUtils.Include("/Utils/StringUtils")
CodingUtils.Include("/Utils/Console")
CodingUtils.Include("/Utils/Ui")