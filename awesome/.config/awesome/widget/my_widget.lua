-- Save this code to a file named 'my_widget.lua'
-- Add any additional widgets to the left side of the top bar here
local clock_widget = {
	widget = wibox.widget.textclock("%a %b %d, %I:%M %p"),
}

-- Add a tooltip to the widget
local clock_tooltip = awful.tooltip({
	objects = { clock_widget.widget },
	text = "Current time and date",
})

-- Add the widget to the top bar
local topbar = awful.wibar({
	position = "top",
	height = 24,
	screen = 1,
})

topbar:setup({
	layout = wibox.layout.align.horizontal,
	{ -- Left widgets
		layout = wibox.layout.fixed.horizontal,
		-- Add any additional widgets to the left side of the top bar here
	},
	nil, -- Center widget (leave as nil to center the remaining widgets)
	{ -- Right widgets
		layout = wibox.layout.fixed.horizontal,
		clock_widget,
	},
})
