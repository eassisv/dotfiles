---@diagnostic disable: missing-fields

local function copilot_enabled()
  local weekday = os.date('%w')

  if weekday == '0' or weekday == '6' then
    return false -- Disable on weekends (Sunday and Saturday)
  end

  local hour = tonumber(os.date('%H'))
  local minute = tonumber(os.date('%M'))



  -- if (hour >= 18 and minute > 30) or (hour < 8 and minute < 30) then
  --   return false -- Disable after 18:30 and before 08:30
  -- end

  return true
end

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp',
      {
        'L3MON4D3/LuaSnip',
        versioin = 'v2.*',
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
      },
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local kind_icon = lspkind.symbolic(item.kind, { mode = 'symbol' })
            item.kind = string.format('%s  %s', kind_icon, item.kind)

            item.menu = ({
              buffer = '[Buff]',
              nvim_lsp = '[LSP]',
              luasnip = '[Snip]',
              nvim_lua = '[Lua]',
              cmdline = '[CMD]',
              path = '[Path]',
            })[entry.source.name]

            item.menu = item.menu or entry.source.name

            return item
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping.abort(),

          ['<C-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-b>'] = cmp.mapping.scroll_docs(4),

          ['<C-l>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),

        sources = cmp.config.sources({
          { name = 'lazydev' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'nvim_lsp_signature_help' },
        }, {
          { name = 'path' },
          { name = 'buffer' },
        }),
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline' },
          { name = 'path' },
        },
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities =
          vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities(capabilities))

      vim.lsp.config('*', {
        capabilities = capabilities,
      })
    end,
  },
  -- {
  --   'github/copilot.vim',
  --   config = function()
  --     vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })
  --     vim.g.copilot_no_tab_map = true
  --   end,
  -- },
}
