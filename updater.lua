-- Delete old files.
term.setTextColor(colors.green)
print("Deleting files..")
term.setTextColor(colors.gray)
shell.run("delete", "/Utils/Console")
shell.run("delete", "/Utils/StringUtils")
shell.run("delete", "/Utils/updater")
shell.run("delete", "/Utils/CodingUtils")
shell.run("delete", "/Utils/Utils")
shell.run("delete", "/Utils/Ui")
shell.run("delete", "/Utils/Table")
shell.run("delete", "/Utils/5DMan")

-- Runn installer to get all new files.
shell.run("/Utils/installer")
term.setTextColor(colors.green)
print("Done.")