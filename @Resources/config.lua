-- ## Information ###################################################################
-- Filename: config.lua
-- Author: Brett Stevenson
-- Project: GitHubCalendar
-- License: BSD 3-Clause 
-- Updated: July 31, 2016
-- ###############################################################################

-- ## Description ###################################################################
-- A work-in-progress Lua script, intended to improve the ease of use of the GitHubCalendar Rainmeter 
-- skin by automating much of the user configuration processes. 
-- ###############################################################################


function Initialize()
	path = SELF:GetOption('WriteTo')
	Update()
end

function Update()
	local file = io.open(path, "r")
	io.input(file)
	data = io.read("*all")
	-- io.close(file)
	return tostring(data)
end

function Write()
	local file = io.open(path, "w")
	local variant = SELF:GetOption('Input1')
	local minimize = SELF:GetOption('Input2')
	SKIN:Bang('!SetVariable', 'Minimize', 1)
	io.output(file)
	io.write("variant: ")
	io.write(tostring(variant))
	io.write("\nminimize: ")
	io.write(tostring(minimize))
	io.close(file)
	if(tonumber(minimize) > 0) then
		SKIN:Bang('!SetVariable', 'Minimize', 1)
	else
		SKIN:Bang('!SetVariable', 'Minimize', 0)
	end
	return tostring(minimize)
end
