
return {
  -- Добавляем render-markdown.nvim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup({
        --- Настройки плагина
        -- Например, можно настроить автозапуск
        auto_enable = true,    -- Автоматическое включение рендеринга
        file_types = { "markdown" }, -- Какие типы файлов обрабатывать
      })
    end,
  },
}
