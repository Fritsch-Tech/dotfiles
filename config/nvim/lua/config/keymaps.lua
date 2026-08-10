vim.keymap.set("n", "<leader>mm", function()
  local default_path = ""

  -- Try to get Neo-tree state
  local ok, state = pcall(function()
    return require("neo-tree.sources.manager").get_state("filesystem")
  end)

  if ok and state then
    local node = state.tree:get_node()

    if node and node.path then
      local path = node.path

      -- If file, use parent directory
      if vim.fn.isdirectory(path) == 0 then
        path = vim.fn.fnamemodify(path, ":h")
      end

      -- Make relative
      default_path = vim.fn.fnamemodify(path, ":.") .. "/"
    end
  end

  local function slugify(s)
    if not s then return "" end
    s = s:gsub("Ä","Ae"):gsub("ä","ae"):gsub("Ö","Oe"):gsub("ö","oe"):gsub("Ü","Ue"):gsub("ü","ue"):gsub("ß","sz")
    s = s:lower()
    -- replace non-alphanumeric with hyphen
    s = s:gsub("[^%w]+","-")
    -- replace underscores with hyphen
    s = s:gsub("_","-")
    -- collapse multiple hyphens
    s = s:gsub("%-+","-")
    -- trim
    s = s:gsub("^%-+",""):gsub("%-+$","")
    return s
  end

  vim.ui.input({ prompt = "Name (used for filename): " }, function(name)
    if not name or name == "" then return end

    vim.ui.input({ prompt = "Location (folder or path): ", default = default_path }, function(input)
      if not input or input == "" then return end

      local path = input

      if path:match("/$") then
        local filename = slugify(name) .. ".md"
        path = path .. filename
      else
        local filename = vim.fn.fnamemodify(path, ":t")
        if not filename:match("%.") then
          path = path .. ".md"
        end
      end

      local cmd = "generate-note " .. vim.fn.shellescape(path) .. " --title " .. vim.fn.shellescape(name)
      local output = vim.fn.system(cmd)

      if vim.v.shell_error ~= 0 then
        vim.notify(output, vim.log.levels.ERROR)
        return
      end

      vim.cmd("edit " .. path)
    end)
  end)
end, { desc = "Generate note from Neo-tree selection" })

vim.keymap.set("n", "<leader>md", function()
  local path = "daily/" .. os.date("%Y-%m-%d") .. ".md"
  local cmd = "generate-note --daily --title " .. vim.fn.shellescape(os.date("%Y-%m-%d"))
  local output = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify(output, vim.log.levels.ERROR)
    return
  end

  vim.cmd("edit " .. path)
end, { desc = "Generate daily note" })
