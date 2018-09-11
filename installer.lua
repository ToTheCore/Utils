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
shell.run("/openp/github", "get", "ToTheCore/" .. thisRepoName .. "/master/Console.lua","/" .. thisRepoName .. "/Console")
shell.run("/openp/github", "get", "ToTheCore/" .. thisRepoName .. "/master/StringUtils.lua","/" .. thisRepoName .. "/StringUtils")

-- Downloading installer/updater
shell.run("/openp/github", "get", "ToTheCore/" .. thisRepoName .. "/master/updater.lua","/" .. thisRepoName .. "/updater")
shell.run("/openp/github", "get", "ToTheCore/" .. thisRepoName .. "/master/installer.lua","/" .. thisRepoName .. "/installer")

