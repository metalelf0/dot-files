local execute = vim.api.nvim_command
local sorry_use_vimscript_please = vim.cmd

function Dec2Hex(nValue) -- http://www.indigorose.com/forums/threads/10192-Convert-Hexadecimal-to-Decimal
  if type(nValue) == "string" then
    nValue = String.ToNumber(nValue);
  end
  nHexVal = string.format("%X", nValue);  -- %X returns uppercase hex, %x gives lowercase letters
  sHexVal = nHexVal.."";
  if nValue < 16 then
    return "0"..tostring(sHexVal)
  else
    return sHexVal
  end
end

function limit_0_255(value)
  if value > 255 then
    return 255
  elseif value < 0 then
    return 0
  else
    return value
  end
end

function adjust(color, adjust)
  r1, g1, b1 = string.match(color, "#([0-9A-Fa-f][0-9A-Fa-f])([0-9A-Fa-f][0-9A-Fa-f])([0-9A-Fa-f][0-9A-Fa-f])")
  r2 = limit_0_255(tonumber(r1, 16) + adjust)
  g2 = limit_0_255(tonumber(g1, 16) + adjust)
  b2 = limit_0_255(tonumber(b1, 16) + adjust)

  return "#"..Dec2Hex(r2).. Dec2Hex(g2)..Dec2Hex(b2)
end

currentBackground = "#"..(string.format('%x', vim.api.nvim_get_hl_by_name('Normal', 'bg#')['background']))

if vim.o.background == "dark" then
  newBackground = adjust(currentBackground, 8)
else
  newBackground = adjust(currentBackground, -20)
end

print("Current: "..currentBackground)
print("Dimmed:  "..newBackground)

execute("hi ActiveWindow guibg="..currentBackground)
execute("hi InactiveWindow guibg="..newBackground)

sorry_use_vimscript_please(
[[
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END
]])
