return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
        html = 'rainbow-delimiters.strategy.local', -- 👈 mejora para templates
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
        javascript = 'rainbow-delimiters-react',
        tsx = 'rainbow-delimiters-react',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
