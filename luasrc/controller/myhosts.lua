-- Copyright 2015
-- Matthew
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.myhosts", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/myhosts") then
		return
	end

	local page

	page = entry({"admin", "network", "myhosts"}, cbi("myhosts"), _("My Hosts"))
	page.dependent = true
end
