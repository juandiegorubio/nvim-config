local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}
local function floating_window(opts)
    opts = opts or {}
    local ui = vim.api.nvim_list_uis()[1]

    local width = opts.width or math.floor(ui.width * 0.8)
    local height = opts.height or math.floor(ui.height * 0.8)

    local row = math.floor((ui.height - height) / 2)
    local col = math.floor((ui.width - width) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end


local toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term()
        end
        vim.cmd("startinsert")
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({'n', 't'}, "<leader>tt", toggle_terminal, { desc = "[T]oggle Floating [Terminal]" } )

