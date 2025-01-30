return {
  {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astroui.status")

    -- Кастомный компонент для Word Count
    local word_count = {
      provider = function()
        local prose = require("nvim-prose")
        return prose.word_count and prose.word_count() or "0"
      end,
      hl = { fg = "cyan", bold = true },
    }

    opts.statusline = { -- статус-бар
      hl = { fg = "fg", bg = "bg" },
      status.component.mode(),
      status.component.git_branch(),
      status.component.file_info(),
      word_count,  -- Компонент для подсчета слов
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      status.component.nav(),
      status.component.mode({ surround = { separator = "right" } }),
    }

    opts.winbar = {
      init = function(self)
        self.bufnr = vim.api.nvim_get_current_buf()
      end,
      fallthrough = false,
      {
        condition = function()
          return not status.condition.is_active()
        end,
        status.component.separated_path(),
        status.component.file_info({
          file_icon = {
            hl = status.hl.file_icon("winbar"),
            padding = { left = 0 },
          },
          filename = {},
          filetype = false,
          file_read_only = false,
          hl = status.hl.get_attributes("winbarnc", true),
          surround = false,
          update = "BufEnter",
        }),
      },
      {
        status.component.breadcrumbs({
          hl = status.hl.get_attributes("winbar", true),
        }),
      },
    }

    opts.tabline = {
      {
        condition = function(self)
          self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
          self.winwidth = vim.api.nvim_win_get_width(self.winid)
          return self.winwidth ~= vim.o.columns
            and not require("astrocore.buffer").is_valid(
              vim.api.nvim_win_get_buf(self.winid)
            )
        end,
        provider = function(self)
          return (" "):rep(self.winwidth + 1)
        end,
        hl = { bg = "tabline_bg" },
      },
      status.heirline.make_buflist(status.component.tabline_file_info()),
      status.component.fill({ hl = { bg = "tabline_bg" } }),
      {
        condition = function()
          return #vim.api.nvim_list_tabpages() >= 2
        end,
        status.heirline.make_tablist({
          provider = status.provider.tabnr(),
          hl = function(self)
            return status.hl.get_attributes(
              status.heirline.tab_type(self, "tab"),
              true
            )
          end,
        }),
        {
          provider = status.provider.close_button({
            kind = "TabClose",
            padding = { left = 1, right = 1 },
          }),
          hl = status.hl.get_attributes("tab_close", true),
          on_click = {
            callback = function()
              require("astrocore.buffer").close_tab()
            end,
            name = "heirline_tabline_close_tab_callback",
          },
        },
      },
    }

    opts.statuscolumn = {
      init = function(self)
        self.bufnr = vim.api.nvim_get_current_buf()
      end,
      status.component.foldcolumn(),
      status.component.numbercolumn(),
      status.component.signcolumn(),
    }
  end,
  },
}
