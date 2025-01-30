return {
    {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",  -- Подключаем плагин только для markdown файлов
    build = "cd app && npm install",  -- Требуется установка зависимостей через npm
    config = function()
      vim.g.mkdp_auto_start = 1  -- Автоматически запускать предпросмотр при открытии markdown
      vim.g.mkdp_port = 8001      -- Указать порт для сервера предпросмотра (по умолчанию 8001)
      vim.g.mkdp_open_to_the_world = 1  -- Открывать предпросмотр на всех интерфейсах
    end
  },
}

