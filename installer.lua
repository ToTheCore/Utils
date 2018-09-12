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
shell.run("/wget", "https://raw.githubusercontent.com/" .. thisRepoName .. "/master/Console.lua","/" .. thisRepoName .. "/Console")
shell.run("/wget", "https://raw.githubusercontent.com/" .. thisRepoName .. "/master/StringUtils.lua","/" .. thisRepoName .. "/StringUtils")
shell.run("/wget", "https://raw.githubusercontent.com/" .. thisRepoName .. "/master/CodingUtils.lua","/" .. thisRepoName .. "/CodingUtils")
shell.run("/wget", "https://raw.githubusercontent.com/" .. thisRepoName .. "/master/Utils.lua","/" .. thisRepoName .. "/Utils")
shell.run("/wget", "https://raw.githubusercontent.com/" .. thisRepoName .. "/master/Ui.lua","/" .. thisRepoName .. "/Ui")

-- Downloading installer/updater
shell.run("/wget", "https://raw.githubusercontent.com/" .. thisRepoName .. "/master/updater.lua","/" .. thisRepoName .. "/updater")
shell.run("/wget", "https://raw.githubusercontent.com/" .. thisRepoName .. "/master/installer.lua","/" .. thisRepoName .. "/installer")

