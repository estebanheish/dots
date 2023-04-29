require 'os'

function delete_current_file()
  path = mp.get_property("path")
  os.execute("mv '" .. path .. "' ~/.trash/")
  mp.commandv("show-text", path .. " deleted", 3000)
end

mp.add_key_binding("ctrl+d", "delete_current_file", delete_current_file)
