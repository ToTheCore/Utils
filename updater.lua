-- Delete old files.
term.setTextColor(colors.green)
print("Deleting files..")
term.setTextColor(colors.gray)
shell.run("delete", "/Utils/Console")
shell.run("delete", "/Utils/StringUtils")
shell.run("delete", "/Utils/updater")

-- Runn installer to get all new files.
shell.run("installer")
term.setTextColor(colors.green)
print("Done.")