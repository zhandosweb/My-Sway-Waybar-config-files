return {
  {
  "skwee357/nvim-prose",
  event = "BufReadPre",
  config = function()
    require("nvim-prose").setup({
      enable_word_count = true, -- Включаем подсчет слов
    })
  end,
  },
}
