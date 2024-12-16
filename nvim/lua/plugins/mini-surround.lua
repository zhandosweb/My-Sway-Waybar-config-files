return {
  {
    "echasnovski/mini.surround",
    version = false,
    opts = {
      -- Настраиваем окружения для Markdown
      custom_surroundings = {
        B = { output = { left = "**", right = "**" } }, -- Жирный текст
        I = { output = { left = "*", right = "*" } },   -- Курсив
      },
      mappings = {
        add = "gsa",       -- Добавить окружение
        delete = "gsd",    -- Удалить окружение
        find = "gsf",      -- Найти окружение
        replace = "gsr",   -- Заменить окружение
      },
    },
  },
}
