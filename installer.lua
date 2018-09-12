--- Script for installing Interface2Inventory.
--- Don't remove this script, or change anything in here.

local thisRepoName = "Utils"

-- Try removing the old Interface2Inventory installer.
term.setTextColor(colors.green)
print("Try removing old installer")
term.setTextColor(colors.gray)
shell.run("delete", "installer")

-- Download Utils files.
term.setTextColor(colors.green)
print("Downloading \"" .. thisRepoName .. "\" files..")
term.setTextColor(colors.gray)
shell.run("/wget", "https://raw.githubusercontent.com/ToTheCore/" .. thisRepoName .. "/master/Console.lua","/" .. thisRepoName .. "/Console", "-silent")
shell.run("/wget", "https://raw.githubusercontent.com/ToTheCore/" .. thisRepoName .. "/master/StringUtils.lua","/" .. thisRepoName .. "/StringUtils", "-silent")
shell.run("/wget", "https://raw.githubusercontent.com/ToTheCore/" .. thisRepoName .. "/master/CodingUtils.lua","/" .. thisRepoName .. "/CodingUtils", "-silent")
shell.run("/wget", "https://raw.githubusercontent.com/ToTheCore/" .. thisRepoName .. "/master/Utils.lua","/" .. thisRepoName .. "/Utils", "-silent")
shell.run("/wget", "https://raw.githubusercontent.com/ToTheCore/" .. thisRepoName .. "/master/Ui.lua","/" .. thisRepoName .. "/Ui", "-silent")

-- Downloading installer/updater
shell.run("/wget", "https://raw.githubusercontent.com/ToTheCore/" .. thisRepoName .. "/master/updater.lua","/" .. thisRepoName .. "/updater", "-silent")
shell.run("/wget", "https://raw.githubusercontent.com/ToTheCore/" .. thisRepoName .. "/master/installer.lua","/" .. thisRepoName .. "/installer", "-silent")

