-- Copyright 2015
-- Matthew
-- Licensed to the public under the Apache License 2.0.

local ipc = require "luci.ip"
local fs = require "nixio.fs"

m = Map("myhosts", translate("MyHosts"))


s = m:section(TypedSection, "myhosts", "My Hosts")
s.anonymous = true

s:tab("general",  translate("General Settings"))

switch = s:taboption("general", Flag, "enabled", translate("Enable"))
switch.rmempty = false


s = m:section(TypedSection, "domain", translate("Domain"))
s.addremove = true
s.anonymous = true
s.template = "cbi/tblsection"

ip = s:option(Value, "ip", translate("<abbr title=\"Internet Protocol Version 4\">IPv4</abbr>-Address"))
ip.datatype = "or(ip4addr,'ignore')"

domain = s:option(Value, "domain", translate("Domain"))
domain.rmempty = true



local apply = luci.http.formvalue("cbi.apply")
if apply then
	io.popen("/etc/init.d/myhosts restart")
end


return m
