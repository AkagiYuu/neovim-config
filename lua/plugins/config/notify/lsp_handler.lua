local M = {}
local client_notifs = {}

local function get_notif_data(client_id, token)
	if not client_notifs[client_id] then
		client_notifs[client_id] = {}
	end

	if not client_notifs[client_id][token] then
		client_notifs[client_id][token] = {}
	end

	return client_notifs[client_id][token]
end

local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
	local notif_data = get_notif_data(client_id, token)

	if notif_data.spinner then
		local new_spinner = (notif_data.spinner + 1) % #spinner_frames
		notif_data.spinner = new_spinner

		notif_data.notification = vim.notify(nil, nil, {
			hide_from_history = true,
			icon = spinner_frames[new_spinner],
			replace = notif_data.notification,
		})

		vim.defer_fn(function()
			update_spinner(client_id, token)
		end, 100)
	end
end

local function format_title(title, client_name)
	return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
	return (percentage and percentage .. "%\t" or "") .. (message or "")
end

M.progress = function(_, result, ctx)
	local client_id = ctx.client_id

	local val = result.value

	if not val.kind then
		return
	end

	local notif_data = get_notif_data(client_id, result.token)

	local client_name = vim.lsp.get_client_by_id(client_id).name
	if client_name == "null-ls" then
		return
	end

	local message = format_message(val.message, val.percentage)

	if val.kind == "begin" then
		notif_data.notification = vim.notify(message, "info", {
			title = format_title(val.title, client_name),
			icon = spinner_frames[1],
			timeout = false,
			hide_from_history = false,
		})

		notif_data.spinner = 1
		update_spinner(client_id, result.token)
		return
	end

	if not notif_data then
		return
	end

	if val.kind == "report" then
		notif_data.notification = vim.notify(message, "info", {
			replace = notif_data.notification,
			hide_from_history = false,
		})
		return
	end

	if val.kind == "end" then
		notif_data.notification = vim.notify(val.message and message or "Complete", "info", {
			icon = "",
			replace = notif_data.notification,
			timeout = 1000,
		})

		notif_data.spinner = nil
	end
end

local severity = {
	"error",
	"warn",
	"info",
	"info",
}

M.show_message = function(_, method, params, _)
	vim.notify(method.message, severity[params.type])
end

return M
