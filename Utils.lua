
-- Use: os.loadAPI("/Utils/Utils") -- Load all Utils

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

-- include other utils.
CodingUtils.include("/Utils/StringUtils")
CodingUtils.include("/Utils/Console")
CodingUtils.include("/Utils/Ui")
CodingUtils.include("/Utils/FiveDMan")
CodingUtils.include("/Utils/Table")

