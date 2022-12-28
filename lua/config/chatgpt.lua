local M = {}

local env = vim.fn.expand("$HOME") .. "/.config/nvim/lua/env.lua"
dofile(env)

if vim.env.OPENAI_API_KEY == nil then
	print("Please set the OPENAI_API_KEY environment variable")
	return
end

local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
	return
end


function M.setup()
	chatgpt.setup({})
end
return M
