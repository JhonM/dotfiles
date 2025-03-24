local M = {}

function M.setup()
  -- Set environment variables
  vim.env.FZF_DEFAULT_OPTS = [[--color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse --margin=0,1]]
  vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

  -- Key mappings
  vim.keymap.set("n", "<C-p>", ":Files<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-\\>", ":Buffers<CR>", { noremap = true, silent = true })

  -- Buffer tracking
  local fzf_buffers = {}

  local function FzfBufEntered()
    local name = vim.fn.resolve(vim.fn.expand("<afile>"))
    if name ~= "" and not name:match("NERD_tree_.*") then
      for i, val in ipairs(fzf_buffers) do
        if val == name then
          table.remove(fzf_buffers, i)
          break
        end
      end
      table.insert(fzf_buffers, 1, name)
    end
  end

  local function FzfBufDeleted()
    local name = vim.fn.resolve(vim.fn.expand("<afile>"))
    for i, val in ipairs(fzf_buffers) do
      if val == name then
        table.remove(fzf_buffers, i)
        break
      end
    end
  end

  vim.api.nvim_create_augroup("fzfbuf", { clear = true })
  vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter" }, {
    group = "fzfbuf",
    callback = FzfBufEntered,
  })
  vim.api.nvim_create_autocmd("BufDelete", {
    group = "fzfbuf",
    callback = FzfBufDeleted,
  })

  vim.api.nvim_create_user_command("FZFBuffers", function()
    vim.fn["fzf#run"]({
      source = fzf_buffers,
      sink = "e ",
      options = "-m",
      tmux_height = 50,
    })
  end, {})

  -- Line search
  local function line_handler(l)
    local keys = vim.split(l, ":\t")
    vim.cmd("buf " .. keys[1])
    vim.cmd(keys[2])
    vim.cmd("normal! ^zz")
  end

  local function buffer_lines()
    local res = {}
    for _, b in ipairs(vim.fn.range(1, vim.fn.bufnr("$"))) do
      if vim.fn.buflisted(b) == 1 then
        local lines = vim.fn.getbufline(b, 1, "$")
        for i, line in ipairs(lines) do
          table.insert(res, b .. ":\t" .. i .. ":\t" .. line)
        end
      end
    end
    return res
  end

  vim.api.nvim_create_user_command("FZFLines", function()
    vim.fn["fzf#run"]({
      source = buffer_lines(),
      sink = line_handler,
      options = "--extended --nth=3..",
      down = "70%",
    })
  end, {})

  -- `ag` integration
  local function ag_to_qf(line)
    local parts = vim.split(line, ":")
    return {
      filename = parts[1],
      lnum = tonumber(parts[2]),
      col = tonumber(parts[3]),
      text = table.concat(parts, ":", 4),
    }
  end

  local function ag_handler(lines)
    if #lines < 2 then return end
    local cmdmap = { ["ctrl-x"] = "split", ["ctrl-v"] = "vsplit", ["ctrl-t"] = "tabedit" }
    local cmd = cmdmap[lines[1]] or "e"
    local qf_list = vim.tbl_map(ag_to_qf, vim.list_slice(lines, 2))

    local first = qf_list[1]
    vim.cmd(cmd .. " " .. vim.fn.fnameescape(first.filename))
    vim.cmd(first.lnum)
    vim.cmd("normal! " .. first.col .. "|zz")

    if #qf_list > 1 then
      vim.fn.setqflist(qf_list)
      vim.cmd("copen")
      vim.cmd("wincmd p")
    end
  end

  vim.api.nvim_create_user_command("Ag", function(opts)
    local query = opts.args ~= "" and opts.args or "^(?=.)"
    local cmd = string.format(
      'ag git ls-files --nogroup --column --color --smart-case --exclude-standard --others --cached "%s"',
      vim.fn.escape(query, [["]])
    )
    vim.fn["fzf#run"]({
      source = cmd,
      sinklist = ag_handler,
      options = [[--ansi --expect=ctrl-t,ctrl-v,ctrl-x --multi --bind ctrl-a:select-all,ctrl-d:deselect-all --color hl:68,hl+:110]],
      down = "100%",
    })
  end, { nargs = "*" })

  -- Floating window layout for fzf (non-tmux)
  if vim.env.TMUX then
    vim.g.fzf_layout = { tmux = "-p90%,60%" }
  else
    vim.g.fzf_layout = { window = "call v:lua.FloatingFZF()" }
  end

  function _G.FloatingFZF()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, "signcolumn", "no")

    local width = 230
    local height = 50
    local col = math.floor((vim.o.columns - width) / 2)
    local row = 1

    local opts = {
      relative = "editor",
      row = row,
      col = col,
      width = width,
      height = height,
      style = "minimal",
    }

    vim.api.nvim_open_win(buf, true, opts)
  end
end

return M

