local ok, navic = pcall(require, 'nvim-navic')
if not ok then
  return
end

navic.setup({
  highlight = false,
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = "練",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },
})

for _, group in ipairs({ "NavicIconsFile", "NavicIconsModule", "NavicIconsNamespace", "NavicIconsPackage",
  "NavicIconsClass", "NavicIconsMethod", "NavicIconsProperty", "NavicIconsField", "NavicIconsConstructor",
  "NavicIconsEnum", "NavicIconsInterface", "NavicIconsFunction", "NavicIconsVariable", "NavicIconsConstant",
  "NavicIconsString", "NavicIconsNumber", "NavicIconsBoolean", "NavicIconsArray", "NavicIconsObject", "NavicIconsKey",
  "NavicIconsNull", "NavicIconsEnumMember", "NavicIconsStruct", "NavicIconsEvent", "NavicIconsOperator",
  "NavicIconsTypeParameter" }) do
  vim.api.nvim_set_hl(0, group, { link = "WinSeparator" })
end
