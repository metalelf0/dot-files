local M = {}

M.hex_to_rgb = function(hex)
	hex = hex:gsub("#", "")
	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

M.rgb_to_hex = function(r, g, b)
	r = math.min(255, math.max(0, math.floor(r + 0.5)))
	g = math.min(255, math.max(0, math.floor(g + 0.5)))
	b = math.min(255, math.max(0, math.floor(b + 0.5)))
	return string.format("#%02x%02x%02x", r, g, b)
end

M.blend = function(fg, bg, a)
	local r1, g1, b1 = hex_to_rgb(fg)
	local r2, g2, b2 = hex_to_rgb(bg)
	return rgb_to_hex((1 - a) * r2 + a * r1, (1 - a) * g2 + a * g1, (1 - a) * b2 + a * b1)
end

return M
