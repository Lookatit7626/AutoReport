local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/GUI%20Library.lua')))()
local Words = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Lookatit7626/Project-R/main/HateSpeechs.lua')))()

local GUI = Library.CreateGUI("Eclipse's HUB","rbxassetid://14497104058")

local Section = Library.CreateSection(GUI,"Home")

Library.CreateButton(Section,"Name","Enforcing State Security GameWide")

Library.CreateButton(Section,"Delete","Delete Hub",function()
	Library.CreateNotification("Deleting","Deleting HUB...")
	wait(2)
	GUI:Destroy() 
end)

local Section2 = Library.CreateSection(GUI,"UniversalScript")

Library.CreateButton(Section2,"Build A Boat","Build a Boat Farm",function() loadstring(game:HttpGet("https://pastebin.com/raw/h9AnD9d1"))() end)

Library.CreateButton(Section2,"Bedwars","Bedwars",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/Bedwars"))() end)

Library.CreateButton(Section2,"Dex","IY Mobile Dex",function()
	getgenv().Key = "Bash"
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AIY%20Dex",true))() 
end)

Library.CreateButton(Section2,"IY","IY",function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)

Library.CreateButton(Section2,"Fling","Custom Fling Script",function() loadstring(game:HttpGet("https://pastebin.com/raw/WnJwFXgR"))() end)

local PlayerScript = Library.CreateSection(GUI,"Player Script")

Library.CreateSlider(PlayerScript,"Speed",'Speed',500,function(Speed)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end)

Library.CreateSlider(PlayerScript,"Jump",'Jump',1000,function(Speed)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Speed
end)

local Test0 = math.random(1,99999999)
local AA0 = Test0
Library.CreateLoopButton(PlayerScript,"InfJump", "Inf Jump", function()
	Test0 = math.random(1,99999999)
	AA0 = Test0
	local Set = nil
	if not Set then
		Set = game:GetService('UserInputService').JumpRequest:Connect(function()
			game.Players.LocalPlayer.Character.Humanoid:ChangeState('Jumping')
		end)
	end
	coroutine.wrap(function()
		wait(1)
		if AA0 == Test0 then
			pcall(function()
				Set:Disconnect()
			end)
		end
	end)()
end,0.1)

local lastpos = nil
Library.CreateLoopButton(PlayerScript,"AntiFling", "AntiFling", function()
	local humanoidroot = game.Players.LocalPlayer.Character.HumanoidRootPart
	local primary = humanoidroot
	if primary.AssemblyLinearVelocity.Magnitude > 250 or primary.AssemblyAngularVelocity.Magnitude > 250  then
		primary.AssemblyLinearVelocity = Vector3.new(0,0,0)
		primary.AssemblyAngularVelocity = Vector3.new(0,0,0)
		primary.CFrame = lastpos 
		Library.CreateNotification('Fling alert!','We detected that you got flung and neuturalised your velocity')
	end
	lastpos = primary.CFrame
end,0.01)

Library.CreateButton(PlayerScript,"resetGravity", "Reset Gravity to 196.2 ( Default )", function()
	game.Workspace.Gravity = 196.2
end)

Library.CreateSlider(PlayerScript,"Gravity",'Gravity',250,function(Speed)
	game.Workspace.Gravity = Speed
end)

Library.CreateTextBoxButton(PlayerScript,"Teleport",'Teleport',function(Playername)
	local foundName = nil
	local Players = game.Players:GetPlayers()
	for i = 1, #Players do
		local PossiblePlayer = Players[i]
		if string.find(string.lower(PossiblePlayer.Name), string.lower(Playername)) then
			foundName = PossiblePlayer.Name
		end
	end

	if foundName then
		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game.Workspace:FindFirstChild(foundName):FindFirstChild("HumanoidRootPart").CFrame
	else
		Library.CreateNotification("Alert!", "Can't find the player you want to teleport!")
	end

end,"Player name")

local Set = false
local Event = nil
local Test = math.random(1,99999999)
local AA = Test
Library.CreateLoopButton(PlayerScript,"AutoReport", "AutoReport", function()
	Test = math.random(1,99999999)
	AA = Test
	if not Set then
		Set = true
		if not Event then
			Event = game.Players.PlayerChatted:Connect(function(chatType, plr, msg)
				msg = string.lower(msg)
				if chatType ~= Enum.PlayerChatType.Whisper and plr ~= game.Players.LocalPlayer then
					for i, v in next, Words do
						if string.find(msg, i) then
							local suc, er = pcall(function()
								game.Players:ReportAbuse(game.Players:FindFirstChild(plr.name), v, 'using hate speech and making me feel very shamed!')
							end)
							if not suc then
								Library.CreateNotification('Reporting issue!',"Couldn't report due to the reason: " .. er .. ' | AR')
								return warn("Couldn't report due to the reason: " .. er .. ' | AR')
							else
								Library.CreateNotification('Reported',"Reported a person for : "..v..", Person: "..plr.Name..".")
							end
						end
					end
				end
			end)
		end
	end
	coroutine.wrap(function()
		wait(1)
		if AA == Test then
			Set = false
			pcall(function()
				Event:Disconnect()
			end)
		end
	end)()
end,0.1)

local target = "en"
local Set2 = false
local loop2 = false
local Test2 = math.random(1,99999999)
local AA2 = 1
Library.CreateLoopButton(PlayerScript,"AutoTranslate", "AutoTranslate", function()
	Test2 = math.random(1,99999999)
	AA2 = Test2
	loop2 = true
	if not Set2 then
		Set2 = true
		if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil
		local YourLang = "en" 
		local textChatService = game:GetService("TextChatService")
		local googlev = isfile'googlev.txt' and readfile'googlev.txt' or ''

		local function googleConsent(Body)
			local args = {}

			for match in Body:gmatch('<input type="hidden" name=".-" value=".-">') do
				local k,v = match:match('<input type="hidden" name="(.-)" value="(.-)">')
				args[k] = v
			end
			googlev = args.v
			writefile('googlev.txt', args.v)
		end

		local function got(url, Method, Body) 
			Method = Method or "GET"

			local res = request({
				Url = url,
				Method = Method,
				Headers = {cookie="CONSENT=YES+"..googlev},
				Body = Body
			})

			if res.Body:match('https://consent.google.com/s') then
				print('consent')
				googleConsent(res.Body)
				res = request({
					Url = url,
					Method = "GET",
					Headers = {cookie="CONSENT=YES+"..googlev}
				})
			end

			return res
		end

		local languages = {
			auto = "Automatic",
			af = "Afrikaans",
			sq = "Albanian",
			am = "Amharic",
			ar = "Arabic",
			hy = "Armenian",
			az = "Azerbaijani",
			eu = "Basque",
			be = "Belarusian",
			bn = "Bengali",
			bs = "Bosnian",
			bg = "Bulgarian",
			ca = "Catalan",
			ceb = "Cebuano",
			ny = "Chichewa",
			['zh-cn'] = "Chinese Simplified",
			['zh-tw'] = "Chinese Traditional",
			co = "Corsican",
			hr = "Croatian",
			cs = "Czech",
			da = "Danish",
			nl = "Dutch",
			en = "English",
			eo = "Esperanto",
			et = "Estonian",
			tl = "Filipino",
			fi = "Finnish",
			fr = "French",
			fy = "Frisian",
			gl = "Galician",
			ka = "Georgian",
			de = "German",
			el = "Greek",
			gu = "Gujarati",
			ht = "Haitian Creole",
			ha = "Hausa",
			haw = "Hawaiian",
			iw = "Hebrew",
			hi = "Hindi",
			hmn = "Hmong",
			hu = "Hungarian",
			is = "Icelandic",
			ig = "Igbo",
			id = "Indonesian",
			ga = "Irish",
			it = "Italian",
			ja = "Japanese",
			jw = "Javanese",
			kn = "Kannada",
			kk = "Kazakh",
			km = "Khmer",
			ko = "Korean",
			ku = "Kurdish (Kurmanji)",
			ky = "Kyrgyz",
			lo = "Lao",
			la = "Latin",
			lv = "Latvian",
			lt = "Lithuanian",
			lb = "Luxembourgish",
			mk = "Macedonian",
			mg = "Malagasy",
			ms = "Malay",
			ml = "Malayalam",
			mt = "Maltese",
			mi = "Maori",
			mr = "Marathi",
			mn = "Mongolian",
			my = "Myanmar (Burmese)",
			ne = "Nepali",
			no = "Norwegian",
			ps = "Pashto",
			fa = "Persian",
			pl = "Polish",
			pt = "Portuguese",
			pa = "Punjabi",
			ro = "Romanian",
			ru = "Russian",
			sm = "Samoan",
			gd = "Scots Gaelic",
			sr = "Serbian",
			st = "Sesotho",
			sn = "Shona",
			sd = "Sindhi",
			si = "Sinhala",
			sk = "Slovak",
			sl = "Slovenian",
			so = "Somali",
			es = "Spanish",
			su = "Sundanese",
			sw = "Swahili",
			sv = "Swedish",
			tg = "Tajik",
			ta = "Tamil",
			te = "Telugu",
			th = "Thai",
			tr = "Turkish",
			uk = "Ukrainian",
			ur = "Urdu",
			uz = "Uzbek",
			vi = "Vietnamese",
			cy = "Welsh",
			xh = "Xhosa",
			yi = "Yiddish",
			yo = "Yoruba",
			zu = "Zulu"
		};

		local function find(lang)
			for i,v in pairs(languages) do
				if i == lang or v == lang then
					return i
				end
			end
		end

		local function isSupported(lang)
			local key = find(lang)
			return key and true or false 
		end

		local function getISOCode(lang)
			local key = find(lang)
			return key
		end

		local function stringifyQuery(dataFields)
			local data = ""
			for k, v in pairs(dataFields) do
				if type(v) == "table" then
					for _,v in pairs(v) do
						data = data .. ("&%s=%s"):format(
							game.HttpService:UrlEncode(k),
							game.HttpService:UrlEncode(v)
						)
					end
				else
					data = data .. ("&%s=%s"):format(
						game.HttpService:UrlEncode(k),
						game.HttpService:UrlEncode(v)
					)
				end
			end
			data = data:sub(2)
			return data
		end

		local reqid = math.random(1000,9999)
		local rpcidsTranslate = "MkEWBc"
		local rootURL = "https://translate.google.com/"
		local executeURL = "https://translate.google.com/_/TranslateWebserverUi/data/batchexecute"
		local fsid, bl

		do -- init
			print('initialize')
			local InitialReq = got(rootURL)
			fsid = InitialReq.Body:match('"FdrFJe":"(.-)"')
			bl = InitialReq.Body:match('"cfb2h":"(.-)"')
		end

		local HttpService = game:GetService("HttpService")
		local function jsonE(o)
			return HttpService:JSONEncode(o)
		end
		local function jsonD(o)
			return HttpService:JSONDecode(o)
		end

		local function translate(str, to, from)
			reqid+=10000
			from = from and getISOCode(from) or 'auto'
			to = to and getISOCode(to) or 'en'

			local data = {{str, from, to, true}, {nil}}

			local freq = {
				{
					{
						rpcidsTranslate, 
						jsonE(data),
						nil,
						"generic"
					}
				}
			}

			local url = executeURL..'?'..stringifyQuery{rpcids = rpcidsTranslate, ['f.sid'] = fsid, bl = bl, hl="en", _reqid = reqid-10000, rt = 'c'}
			local body = stringifyQuery{['f.req'] = jsonE(freq)}

			local req = got(url, "POST", body)

			local body = jsonD(req.Body:match'%[.-%]\n')
			local translationData = jsonD(body[1][3])
			local result = {
				text = "",
				from = {
					language = "",
					text = ""
				},
				raw = ""
			}
			result.raw = translationData
			result.text = translationData[2][1][1][6][1][1]

			result.from.language = translationData[3]
			result.from.text = translationData[2][5][1]

			return result
		end

		local Players = game:GetService("Players")
		local LP = Players.LocalPlayer
		local StarterGui = game:GetService('StarterGui')
		for i=1, 15 do
			local r = pcall(StarterGui["SetCore"])
			if r then break end
			game:GetService('RunService').RenderStepped:wait()
		end
		wait()

		local properties = {
			Color = Color3.new(1,1,0);
			Font = Enum.Font.SourceSansItalic;
			TextSize = 16;
		}

		local function translateFrom(message)
			local translation = translate(message, YourLang)

			local text
			if translation.from.language ~= YourLang then 
				text = translation.text
			end

			return {text, translation.from.language}
		end

		local function get(plr, msg)
			local tab = translateFrom(msg)
			local translation = tab[1]
			if translation then
				properties.Text = "("..tab[2]:upper()..") ".."[".. plr.Name .."]: "..translation
				StarterGui:SetCore("ChatMakeSystemMessage", properties)
			end
		end

		for i, plr in ipairs(Players:GetPlayers()) do
			plr.Chatted:Connect(function(msg)
				get(plr, msg)
			end)
		end
		Players.PlayerAdded:Connect(function(plr)
			plr.Chatted:Connect(function(msg)
				get(plr, msg)
			end)
		end)

		local sendEnabled = false

		local function translateTo(message, target)
			target = target:lower() 
			local translation = translate(message, target, "auto")

			return translation.text
		end

		local TextService = game:GetService('TextChatService')
		local CBar, Connected = game.CoreGui.RobloxGui.Modules.Server.ClientChat.ChatBar, {}

		local makeChat = function(msg)
			textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(msg)
		end

		local players = game.Players:GetPlayers()
		for i = 1, #players do
			players[i].Chatted:Connect(function(msg)
				if players[i].Name == game.Players.LocalPlayer.Name then
					Library.CreateNotification(msg)
					if loop2 then
						msg = translateTo(msg, target)
						print('tets')
						Library.CreateNotification(msg)
						makeChat(msg)
					end
				else
					if loop2 then
						msg = translateTo(msg, target)
						Library.CreateNotification('Translated to english',players[i].Name..' said: '..msg)
					end
				end
			end)
		end

		game.Players.PlayerAdded:Connect(function(player)
			player.Chatted:Connect(function(msg)
				if loop2 then
					msg = translateTo(msg, target)
					Library.CreateNotification('Translated to english',player.Name..' said: '..msg)
				end
			end)
		end)
		Library.CreateNotification('Language set','>[Language code] to say in the target language')
	end
	wait(1)
	if Test == AA then
		loop2 = false
	end
end,0.1)

Library.CreateTextBoxButton(PlayerScript,"ChangeLanguage",'Change Language',function(language)
	target = language
end,"en")

local Server = Library.CreateSection(GUI,"Server Related")

Library.CreateButton(Server,"Rejoin","Rejoin the server",function() 
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	ts:Teleport(game.PlaceId, p)
end)

Library.CreateButton(Server,"ServerHop","Server Hop",function() 
	local Player = game.Players.LocalPlayer    
	local Http = game:GetService("HttpService")
	local TPS = game:GetService("TeleportService")
	local Api = "https://games.roblox.com/v1/games/"

	local _place,_id = game.PlaceId, game.JobId
	local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=10"
	local function ListServers(cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw)
	end

	Player.Character.HumanoidRootPart.Anchored = true
	local Servers = ListServers()
	local Server = Servers.data[math.random(1,#Servers.data)]
	TPS:TeleportToPlaceInstance(_place, Server.id, Player)
end)

local HeavenSword = Library.CreateSection(GUI,"Heaven Sword")

local button = Library.CreateLoopButton(HeavenSword,"Kill All","Kill All (NPCS)",function()
	local args = {
		[1] = "A7"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Force"):FireServer(unpack(args))

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "MP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))
end,0.05)
local button = Library.CreateLoopButton(HeavenSword,"InfHP","Inf HP all",function()

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "HP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))
end,0.05)
local button = Library.CreateLoopButton(HeavenSword,"HealAll","Heal All",function()

	local args = {
		[1] = "A7"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Cure"):FireServer(unpack(args))

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "MP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))

end,.05)
local button = Library.CreateLoopButton(HeavenSword,"Immunity","Immunity",function()

	local args = {
		[1] = "A7"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Barrier"):FireServer(unpack(args))

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "MP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))

end,.05)
local button = Library.CreateLoopButton(HeavenSword,"Fireball","Fireball",function()

	local args = {
		[1] = "C2"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Fireball"):FireServer(unpack(args))

	local args = {
		[1] = "InvA10",
		[2] = 1000,
		[3] = "MP",
		[4] = "Potion"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("UseItem"):FireServer(unpack(args))

end,.05)
