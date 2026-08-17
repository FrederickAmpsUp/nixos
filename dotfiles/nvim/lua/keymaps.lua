local function git_commit()
  local buf = vim.api.nvim_create_buf(false, true)

  local width = 60
  local height = 1
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " Commit message ",
    title_pos = "center",
  })

  vim.bo[buf].buftype = "prompt"
  vim.bo[buf].bufhidden = "wipe"

  vim.fn.prompt_setprompt(buf, "> ")

  local function commit()
    local message = vim.fn.getline(1):sub(3)

    if message == "" then
      return
    end

    vim.api.nvim_win_close(win, true)

    vim.system({ "git", "commit", "-m", message }, {
      text = true,
    }, function(result)
      vim.schedule(function()
        if result.code == 0 then
          vim.notify("Committed: " .. message)
        else
          vim.notify(
            result.stderr ~= "" and result.stderr or "git commit failed",
            vim.log.levels.ERROR
          )
        end
      end)
    end)
  end

  vim.keymap.set("i", "<CR>", commit, { buffer = buf })
  vim.keymap.set("n", "<Esc>", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })

  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>vc", git_commit, { desc = "Git commit staged changes" })

vim.keymap.set("n", "<leader>vp", function()
  vim.system({ "git", "push" }, { text = true }, function(result)
    vim.schedule(function()
      if result.code == 0 then
        vim.notify("Pushed")
      else
        vim.notify(
          result.stderr ~= "" and result.stderr or "git push failed",
          vim.log.levels.ERROR
        )
      end
    end)
  end)
end, { desc = "Git push" })
