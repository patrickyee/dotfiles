local vault = vim.env.OBSIDIAN_VAULT or "~/git/notes"

return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "notes",
          path = vault,
        },
      },
      picker = {
        name = "fzf-lua",
      },
      new_notes_location = "notes_subdir",
      note_id_func = function(title, dir)
        local dated_title = os.date("%Y-%m-%d") .. "-" .. (title or "note")
        return require("obsidian.builtin").title_id(dated_title, dir)
      end,
      note = {
        template = "note.md",
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        customizations = {
          meeting = {
            notes_subdir = "meetings",
            note_id_func = function(title)
              local slug = (title or "meeting"):lower():gsub("%s+", "-"):gsub("[^%w%-]", "")
              return os.date("%Y-%m-%d") .. "-" .. slug
            end,
          },
        },
      },
      -- render-markdown.nvim is the single owner of Markdown presentation.
      -- Obsidian still provides vault navigation, links, and note commands.
      ui = {
        enable = false,
      },
    },
    keys = {
      {
        "<leader>on",
        function()
          vim.ui.input({ prompt = "Note title: " }, function(title)
            title = title and vim.trim(title) or ""
            if title == "" then
              return
            end

            require("obsidian.actions").new(title, function(note)
              note:open({ sync = true })
            end)
          end)
        end,
        desc = "Obsidian: new note",
      },
      {
        "<leader>om",
        function()
          vim.ui.input({ prompt = "Meeting title: " }, function(title)
            title = title and vim.trim(title) or ""
            if title == "" then
              return
            end

            require("obsidian.actions").new_from_template(title, "meeting", function(note)
              note:open({ sync = true })
            end)
          end)
        end,
        desc = "Obsidian: new meeting note",
      },
      { "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian: open note" },
      { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Obsidian: search notes" },
      { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian: backlinks" },
      { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Obsidian: tags" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      preset = "obsidian",
      completions = {
        lsp = {
          enabled = true,
        },
      },
    },
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown buf_toggle<cr>", desc = "Toggle Markdown rendering" },
    },
  },
}
