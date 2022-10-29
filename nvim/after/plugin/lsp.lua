vim.g.ale_linters = {
  typescript = {'prettier'},
  javascript = {'prettier'},
  solidity = {
    'solc', 'solium'
  },
  vue = {'vls'},
}

vim.g.ale_solidity_solc_options = '--base-path ./ --include-path ./lib $(forge remappings)'

vim.opt.completeopt= {"menuone","noinsert","noselect"}
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300

local nvim_lsp = require'lspconfig'

nvim_lsp.tsserver.setup{}
nvim_lsp.tailwindcss.setup{}
nvim_lsp.jsonls.setup{}
nvim_lsp.vuels.setup{}

-- Rust
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

local opts = {
    tools = {
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
                diagnostics = {
                  disabled = {"unresolved-proc-macro"}
                },
                procMacro = {
                    enable = false,
                    attributes = {
                      enabled = false
                    },
                },
            }
        }
    },
}


require('rust-tools').setup(opts)
