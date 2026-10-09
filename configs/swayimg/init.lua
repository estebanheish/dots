swayimg.imagelist.adjacent = true

--------------------------------------------------------------------------------
-- Viewer
--------------------------------------------------------------------------------
for _, key in ipairs({ "left", "h" }) do
    swayimg.viewer.on_key(key, function()
        swayimg.viewer.open("prev")
    end)
end
for _, key in ipairs({ "right", "l" }) do
    swayimg.viewer.on_key(key, function()
        swayimg.viewer.open("next")
    end)
end
swayimg.viewer.on_key("q", function()
    swayimg.exit()
end)
for button, step in pairs({ ScrollUp = 0.1, ScrollDown = -0.1 }) do
    swayimg.viewer.on_mouse(button, function()
        local mouse = swayimg.get_mouse_pos()
        local scale = swayimg.viewer.scale
        swayimg.viewer.set_abs_scale(scale + scale * step, mouse.x, mouse.y)
    end)
end

--------------------------------------------------------------------------------
-- Gallery
--------------------------------------------------------------------------------
for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
    swayimg.gallery.on_key(key, function()
        swayimg.gallery.select(dir)
    end)
end
swayimg.gallery.on_key("q", function()
    swayimg.exit()
end)
