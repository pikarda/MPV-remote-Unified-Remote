local kb = libs.keyboard;

-- Ref: https://mpv.io/manual/stable/

-- Documentation
-- http://www.unifiedremote.com/api

-- Keyboard Library
-- http://www.unifiedremote.com/api/libs/keyboard

local active_hwnd = 0;
local title = "";

events.focus = function()
	tid = libs.timer.interval(update, 500);
	stack = {};
end

function update()
	update_title();
end


function update_title()
	local hwnd = libs.win.find("mpv", nil);
	local _title = libs.win.title(hwnd);
	
	if (_title == "") then
		_title = "[Not Playing]";
	end
	
	if (_title ~= title) then
		title = _title;
		libs.server.update({ id = "info", text = title });
	end
end

function switch_to_mpv()
	active_hwnd = libs.win.active();
	local hwnd = libs.win.find("mpv", nil);
	libs.win.switchtowait(hwnd);
end
-------------------------------------------------------------------
function switch_to_active()
	libs.win.switchtowait(active_hwnd);
end

--@help Seek Left button
actions.seekleft = function ()
	switch_to_mpv();
	kb.stroke("left");
	switch_to_active();
end

--@help Seek Left More button
actions.seekleftmore = function ()
	switch_to_mpv();
	kb.stroke("down");
	switch_to_active();
end

--@help hop to previous chapter
actions.previouschapter = function ()
	switch_to_mpv();
	kb.stroke("pageDown");
	switch_to_active();
end

--@help Seek Right button
actions.seekright = function ()
	switch_to_mpv();
	kb.stroke("right");
	switch_to_active();
end

--@help Seek Right More button
actions.seekrightmore = function ()
	switch_to_mpv();
	kb.stroke("up");
	switch_to_active();
end

--@help hop to next chapter
actions.nextchapter = function ()
	switch_to_mpv();
	kb.stroke("pageUp");
	switch_to_active();
end

--@help volumedown button
actions.volumedown = function ()
	switch_to_mpv();
	kb.stroke("9");
	switch_to_active();
end

--@help volumeup button
actions.volumeup = function ()
	switch_to_mpv();
	kb.stroke("0");
	switch_to_active();
end

--@help mute button
actions.mute = function ()
	switch_to_mpv();
	kb.stroke("m");
	switch_to_active();
end

--@help exit button
actions.exit = function ()
	switch_to_mpv();
	kb.stroke("Q");
	switch_to_active();
end

--@help fullscreen button
actions.fullscreen = function ()
	switch_to_mpv();
	kb.stroke("f");
	switch_to_active();
end

--@help screenshot button
actions.screenshot = function ()
	switch_to_mpv();
	kb.stroke("s");
	switch_to_active();
end

--@help osd button
actions.osd = function ()
	switch_to_mpv();
	kb.stroke("o");
	switch_to_active();
end

--@help info button
actions.info = function ()
	switch_to_mpv();
	kb.stroke("i");
	switch_to_active();
end    

--@help playpause button
actions.playpause = function ()
	switch_to_mpv();
	kb.stroke("space");
	switch_to_active();
end

--@help next audio button
actions.nextaudio = function ()
	switch_to_mpv();
	kb.stroke("#");
	switch_to_active();
end

--@help next subtitle button
actions.nextsub = function ()
	switch_to_mpv();
	kb.stroke("j");
	switch_to_active();
end

--@help toggle subtitles
actions.togglesub = function ()
	switch_to_mpv();
	kb.stroke("v");
	switch_to_active();
end

--@help previous track
actions.prevtrack = function ()
	switch_to_mpv();
	kb.character(0x3c);
	switch_to_active();
end

--@help next track
actions.nexttrack = function ()
	switch_to_mpv();
	kb.character(0x3e);
	switch_to_active();
end

--@help activate shaders
actions.activateshaders = function ()
	switch_to_mpv();
	kb.stroke("ctrl", "4");
	switch_to_active();
end

--@help turn off shaders
actions.turnoffshaders = function ()
	switch_to_mpv();
	kb.stroke("ctrl", "0");
	switch_to_active();
end