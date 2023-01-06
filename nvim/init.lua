local ok, impatient = pcall(require, "impatient")

if not ok then
  print("impatient was not installed yet")
else
  impatient.enable_profile()
end

require("myconf")
