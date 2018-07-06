const activate = (oni) => {
   // access the Oni plugin API here

   // for example, unbind the default `<c-p>` action:
   // oni.input.unbind("<c-p>")

   // or bind a new action:
   // oni.input.bind("<c-enter>", () => alert("Pressed control enter"));
};

module.exports = {
    activate,
    // change configuration values here:
    "oni.useDefaultConfig": false,
    "oni.loadInitVim": true,
    "editor.fontSize": "11px",
    "editor.fontFamily": "Iosevka Term",
    "editor.completions.enabled": true,
    "ui.fontSmoothing": 'subpixel-antialiased',
    "editor.scrollBar.visible": false,
    "editor.scrollBar.cursorTick.visible": false,
    "sidebar.default.open": false,
    "statusbar.enabled": true,
    "ui.colorscheme": "ayu",
  }
