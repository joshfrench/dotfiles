return {
  'altermo/ultimate-autopair.nvim',
  event = { 'InsertEnter', 'CmdlineEnter' },
  branch = 'v0.6',
  opts = {
    cr = {
      autoclose = true,
    },
    space2 = {
      enable = true,
    },
    fastwarp = {
      map = '<C-f>',
    },
  },
}
