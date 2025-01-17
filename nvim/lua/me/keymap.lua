local nest = require('nest')
local shell = require('shell-split')
local async = require("plenary.async")
local notify = require("notify")
nest.applyKeymaps {
    -- Remove silent from ; : mapping, so that : shows up in command mode
    { ';', ':' , options = { silent = false } },
    { '<LEADER>P', '<CMD>source $HOME/Session.vim<CR>'},
    { '<LEADER>S', '<CMD>mksession! $HOME/Session.vim<CR>'},
    {mode = 'n', {
        {'<LeftMouse>', '<LeftMouse>i'},
        -- control keybinds
        { '<c-x>',  '<cmd>call vimspector#Continue()<CR>' },
        -- window resizing commands
        { '<C-w><C-h>', '<CMD>WinResizerStartResize<CR>h' },
        { '<C-w><C-j>', '<CMD>WinResizerStartResize<CR>j' },
        { '<C-w><C-k>', '<CMD>WinResizerStartResize<CR>k' },
        { '<C-w><C-l>', '<CMD>WinResizerStartResize<CR>l' },
        -- leader
        {'<leader>', {
            { 'ai', '<CMD>ChatGPT<CR>', },
            { 'cpd', '<CMD>Copilot disable<CR>'},
            { 'cpe', '<CMD>Copilot enable<CR>'},
            { 'cpp', '<CMD>Copilot panel<CR>'},
            -- rebind jumping back to previous buffer
            {'bb', '<c-6>'},
            --datetime
            {'da', 'i<return><esc><up><cmd>put =strftime(\'%c\')<CR>i<backspace># <Esc><S-a><esc><S-a><return>'},

            -- leader f ( for "Find" )
            {'f', {
                -- find buffer
                {'b', '<cmd>Telescope buffers<CR>' },
                -- find command
                {'c', '<cmd>Telescope commands<CR> ' },
                {'d', '<CMD>Telescope coc diagnostics<CR>'},
                -- find emoji
                {'e', '<cmd>Telescope emoji<CR>' },
                -- find file
                {'f', '<CMD>FZF<CR>' },
                -- find help
                {'h', '<cmd>Telescope help_tags<CR>' },
                -- find in file
                {'if', '<CMD>Telescope current_buffer_fuzzy_find<CR>' },
                -- find in buffer (same command, but easier to remember)
                {'ib', '<CMD>Telescope current_buffer_fuzzy_find<CR>' },
                -- find keymap
                {'k', '<CMD>Telescope keymaps<CR>' },
                {'l', '<CMD>Telescope coc document_symbols<CR>'},
                -- find in THIS folder (current buffer directory)
                {'tf','<cmd>lua require"telescope.builtin".live_grep{ search_dirs={"%:p:h"} }<CR>'},
                -- find registers
                {'r', '<cmd>Telescope registers<CR>' }, 
                {'s', '<cmd>PRg<CR>' },
            }},
            {'hex', '<cmd>file %.hexdump<CR><cmd>%!xxd<CR><cmd>set syntax=xxd<CR>'},
            { 'jd','<cmd>CocCommand java.debug.vimspector.start<CR>'},
            {'js', '<cmd>JsDoc<CR>'},
            {'lg', '<cmd>LazyGit<CR>'},
            {'m', '<cmd>MinimapToggle<cr>'},
            {'wp', '<cmd>Files ~/vimwiki/<CR>' },
            -- search buffer
            {'se', '<cmd>Telescope current_buffer_fuzzy_find<CR>' },
            -- search emojis
            {'se', '<cmd>Telescope emoji<CR>' },
            -- search folder (uses pwd)
            {'sf', '<cmd>Telescope live_grep<CR>' },
            -- quick open terminal
            {'sh', shell.newshell },
            --search THIS folder ( uses current buffer directory )
            {'stf','<cmd>lua require"telescope.builtin".live_grep{ search_dirs={"%:p:h"} }<CR>'},
            {'t', '<CMD>CHADopen<CR>'},
            -- quick resource
            {'rr', '<CMD>source $MYVIMRC<CR>' },
            -- vimspector commands
            { 'v', { --<leader>v
                {'b', '<cmd>call vimspector#ToggleBreakpoint()<CR>'},
                {'c', '<cmd>call vimspector#Continue()<CR>'},
                {'p', '<cmd>call vimspector#Pause()<CR>'},
                {'s', { --<leader>vs
                    {'i', '<cmd>call vimspector#StepInto()<CR>'},
                    {'o', '<cmd>call vimspector#StepOver()<CR>'},
                    {'O', '<cmd>call vimspector#StepOut()<CR>'},
                    }
                },
                {'C', '<cmd>call vimspector#ClearBreakpoints()<CR>'},
                {'x', '<cmd>VimspectorReset<CR>'},
                }
            },

            -- quick edit
            {'qe', '<CMD>tabnew ~/.config/nvim/init.lua | cd ~/.config/nvim<CR>'},
        }},
    }},
    {mode = 'i', {
        {'??', '<Esc>'},
        {'jj', '<Esc>'},
        {'\'', '\'\'<left>' },
        {'\"', '\"\"<left>' },
        {'(' , '()<left>' },
        {'[' , '[]<left>' },
        {'{' , '{}<left>' },
        {'{<CR>', '{<CR>}<ESC>O' },
        {'{;<CR>', '{<CR>};<ESC>O' },
        {'<C-w>','<Esc><C-w>'},
    }},
    {mode = 't', {
        {'??', '<C-\\><C-n>' },
        {'<C-w>', '<C-\\><C-n><C-w>' },
        {'<leader>sh', shell.newshell},
    }},
    {mode = 'v', {
        {'ai', '<CMD>ChatGPTEditWithInstructions<CR>'},
        {'//', '<Esc>'},
    }},
    {mode = 'vn', {
        {'<RightMouse>', 'y'},
    }},
}
