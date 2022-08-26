if vim.g.fvim_loaded then
	vim.cmd([[
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontHintLevel 'full'
    FVimFontSubpixel v:true
    set guifont=JetBrains\ Mono:h16

    FVimCustomTitleBar v:true
  ]])
end
