return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        {
            'nvim-treesitter/nvim-treesitter-context',
            opts = {
                max_lines = 0, -- 4
                multiline_threshold = 20, -- 2
            },
        },
    },
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        local ts = require('nvim-treesitter')

        -- Fix to prevent parser directory not being in runtimepath
        local install = require('nvim-treesitter.install')
        local parser_install_dir = vim.fn.stdpath("data") .. "/site"

        if vim.fn.isdirectory(parser_install_dir) == 0 then
            vim.fn.mkdir(parser_install_dir, "p")
        end

        install.parser_install_dir = parser_install_dir
        vim.opt.runtimepath:prepend(parser_install_dir)

        -- State tracking for async parser loading
        local parsers_loaded = {}
        local parsers_pending = {}
        local parsers_failed = {}

        local ns = vim.api.nvim_create_namespace('treesitter.async')

        -- Helper to start highlighting and indentation
        local function start(buf, lang)
            local ok = pcall(vim.treesitter.start, buf, lang)
            if ok then
                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
            return ok
        end

        -- Install core parsers after lazy.nvim finishes loading all plugins
        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyDone',
            once = true,
            callback = function()
                ts.install({
                    'awk',
                    'bash',
                    'c',
                    'c_sharp',
                    'cmake',
                    'comment',  -- Used for TODO and FIXME highlighting
                    'css',
                    'cpp',
                    'desktop', -- For .desktop and .directory files    tree-sitter-desktop
                    'diff',
                    'dockerfile',
                    'git_config',
                    'git_rebase',
                    'gitattributes',
                    'gitcommit',
                    'gitignore',
                    'glsl',
                    'graphql',
                    'hcl',      -- HCL language for hashicorp configuration language (used for Terraform (.tf .tfvars) and OpenTofu
                    'html',
                    'http',
                    'javascript',
                    'jq',    -- for the terminal command jq to develop complex queries etc
                    'jsdoc',
                    'json',
                    'lua',
                    'luadoc',
                    'make',
                    'markdown',
                    'markdown_inline',
                    'nginx',
                    'norg', -- Note taking similar to markdown but for local use.
                    'passwd', -- Parser for the /etc/passwd password database
                    'pem', -- Parser for PEM files
                    'pug',
                    'python',
                    'query',
                    'readline',
                    'regex',
                    'rust',
                    'scss',
                    'sql',
                    'ssh_config',
                    'terraform',
                    'tmux',
                    'toml',
                    'typescript',
                    'udev',
                    'vim',
                    'vimdoc',
                    'vue',
                    'xml',
                    'yaml',
                }, {
                        max_jobs = 1,
                    })
            end,
        })

        -- Decoration provider for async parser loading
        vim.api.nvim_set_decoration_provider(ns, {
            on_start = vim.schedule_wrap(function()
                if #parsers_pending == 0 then
                    return false
                end
                for _, data in ipairs(parsers_pending) do
                    if vim.api.nvim_buf_is_valid(data.buf) then
                        if start(data.buf, data.lang) then
                            parsers_loaded[data.lang] = true
                        else
                            parsers_failed[data.lang] = true
                        end
                    end
                end
                parsers_pending = {}
            end),
        })

        local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

        local ignore_filetypes = {
            'checkhealth',
            'lazy',
            'mason',
            'snacks_dashboard',
            'snacks_notif',
            'snacks_win',
        }

        -- Auto-install parsers and enable highlighting on FileType
        vim.api.nvim_create_autocmd('FileType', {
            group = group,
            desc = 'Enable treesitter highlighting and indentation (non-blocking)',
            callback = function(event)
                if vim.tbl_contains(ignore_filetypes, event.match) then
                    return
                end

                local lang = vim.treesitter.language.get_lang(event.match) or event.match
                local buf = event.buf

                if parsers_failed[lang] then
                    return
                end

                if parsers_loaded[lang] then
                    -- Parser already loaded, start immediately (fast path)
                    start(buf, lang)
                else
                    -- Queue for async loading
                    table.insert(parsers_pending, { buf = buf, lang = lang })
                end

                -- Auto-install missing parsers (async, no-op if already installed)
                ts.install({ lang })
            end,
        })
    end,
}
