local __substr = string.sub

Version = 0

local hasSuperWow = nil;
if CombatLogAdd then
	hasSuperWow = true;
end

local LoggaFrame = CreateFrame("Frame")
local running = false


LoggaFrame:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
LoggaFrame:RegisterEvent("CHAT_MSG_MONSTER_SAY") 
LoggaFrame:RegisterEvent("CHAT_MSG_MONSTER_YELL") 
LoggaFrame:RegisterEvent("CHAT_MSG_MONSTER_PARTY") 
LoggaFrame:RegisterEvent("CHAT_MSG_MONSTER_WHISPER")

LoggaFrame:SetScript("OnEvent", function()
	if running and event then
      if event == 'CHAT_MSG_MONSTER_EMOTE' or event == 'CHAT_MSG_MONSTER_SAY'
	   or event == 'CHAT_MSG_MONSTER_YELL'  or event == 'CHAT_MSG_MONSTER_PARTY'
	    or event == 'CHAT_MSG_MONSTER_WHISPER' then
			if hasSuperWow then
				CombatLogAdd("LOGGA_INFO: | " .. arg1 .. " | " .. arg2 .. " | " .. arg3)
			end
		end
	end
end)


SLASH_LOGGA1 = "/logga"
SlashCmdList["LOGGA"] = function(cmd)
	if cmd then
		if __substr(cmd, 1, 5) == 'start' then
			print('Starting, type /logga stop to stop')
			running = true
			return true
		end
		if __substr(cmd, 1, 4) == 'stop' then
			running = false
			print('Stopping')
			return true
		end

		if __substr(cmd, 1, 6) == 'status' then
			if running then
				print('LOGGA Status: YEP')
			else
				print('LOGGA Status: NOPE')
			end
			return true
		end

        print('LOGGA addon available commands:')
        print('/logga start - starts the logging')
        print('/logga stops - stops the logging')

	end
end


if (Version == 0) then
	Version = 1
	print('LOGGA addon loaded successfully')
end
