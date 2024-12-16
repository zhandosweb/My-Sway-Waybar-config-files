return {
  -- Подключаем bullets.vim
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "text", "gitcommit" }, -- Плагин будет работать только в указанных типах файлов
    config = function()
      -- Настройка bullets.vim
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit" }
      vim.g.bullets_set_mappings = 1       -- Включить стандартные горячие клавиши
      vim.g.bullets_outline_levels = { "num", "std-" } -- Настройка уровня списка
    end,
  },
}
