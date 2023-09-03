local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
getgenv().SecureMode = true
local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local function SaveConfiguration()
	if not CEnabled then return end
	local Data = {}
	for i,v in pairs(RayfieldLibrary.Flags) do
		if v.Type == "ColorPicker" then
			Data[i] = PackColor(v.Color)
		else
			Data[i] = v.CurrentValue or v.CurrentKeybind or v.CurrentOption or v.Color
		end
	end	
	writefile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
end

local MarketplaceService = game:GetService("MarketplaceService")
local placeId = game.PlaceId
local placeInfo = MarketplaceService:GetProductInfo(placeId)
local placeName = placeInfo.Name
print(placeName)

local isEnabled = false
local headSize = 1
local isToggleOn = false -- Переменная для отслеживания состояния переключателя
local isCorsairVisible = false -- Переменная для отслеживания состояния прицела

local Window = Rayfield:CreateWindow({
    Name = "Xhook hub| " .. "Game: " .. (placeName),
    LoadingTitle = "Welcome  " .. (player.DisplayName),
    LoadingSubtitle = "by An1mk0",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Xhook Hub Configs123",
        FileName = "Xhook Hub123"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Penis", "Penis123"}
    }
 })

    
    local Tab = Window:CreateTab("Misc", 4483362458)

    local Toggle = Tab:CreateToggle({
        Name = "Head Size Toggle",
        CurrentValue = false,
        Flag = "Toggle",
        Callback = function(Value)
            isEnabled = Value
            if not isEnabled then
                -- Если выключатель выключен, восстанавливаем размер головы и свойства
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "Model" then
                        local head = v:FindFirstChild("Head")
                        if head then
                            head.Size = Vector3.new(1, 1, 1)
                            head.Material = Enum.Material.SmoothPlastic -- Восстанавливаем исходный материал
                            head.Transparency = 0 -- Восстанавливаем прозрачность
                            head.CanCollide = true -- Восстанавливаем возможность столкновения
                            head.CanTouch = true -- Восстанавливаем возможность прикосновения
                        end
                    end
                end
            end
        end,
    })

    local Slider = Tab:CreateSlider({
        Name = "Head Size",
        Range = {1, 10},
        Increment = 1,
        Suffix = "Size",
        CurrentValue = 1,
        Flag = "Slider",
        Callback = function(Value)
            headSize = Value
        end,
    })


	 local Toggle1 = Tab:CreateToggle({
        Name = "Torso Size Toggle",
        CurrentValue = false,
        Flag = "Toggle2",
        Callback = function(Value)
            isEnabled1 = Value
            if not isEnabled1 then
                -- Если выключатель выключен, восстанавливаем размер головы и свойства
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "Model" then
                        local torso = v:FindFirstChild("Torso")
                        if torso then
                            torso.Size = Vector3.new(1, 1, 1)
                            torso.Material = Enum.Material.SmoothPlastic -- Восстанавливаем исходный материал
                            torso.Transparency = 0 -- Восстанавливаем прозрачность
                            torso.CanCollide = true -- Восстанавливаем возможность столкновения
                            torso.CanTouch = true -- Восстанавливаем возможность прикосновения
                        end
                    end
                end
            end
        end,
    })

	local Slider = Tab:CreateSlider({
        Name = "Torso Size",
        Range = {1, 10},
        Increment = 1,
        Suffix = "Size",
        CurrentValue = 1,
        Flag = "Slider2",
        Callback = function(Value)
            TorsoSize = Value
        end,
    })

    local Button = Tab:CreateButton({
       Name = "Corsair",
       Callback = function()
           local corsair = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.ControllerMouse
           isCorsairVisible = not isCorsairVisible -- Инвертируем состояние прицела
           corsair.Visible = isCorsairVisible -- Устанавливаем видимость прицела в зависимости от состояния
       end,
    })

	local KeyBindsTab = Window:CreateTab("KeyBinds", nil)


	   local LegitBigJump = KeyBindsTab:CreateKeybind({
        Name = "LegitBigJump",
        CurrentKeybind = "Q",
        HoldToInteract = false,
        Flag = "Keybind3", -- Используйте разные флаги для разных элементов
        Callback = function(Keybind)
			local UserInputService = game:GetService("UserInputService")
        keypress(0x43)
        keypress(0x20) 
        task.wait(0.1)
        keyrelease(0x20)
        task.wait(0.5)
        keyrelease(0x43)
    

        end,
    })

 
	    local KeybindToggle = KeyBindsTab:CreateKeybind({
        Name = "Keybind HeadSize",
        CurrentKeybind = "G",
        HoldToInteract = true,
        Flag = "Keybind22",
        Callback = function(Keybind)
            isToggleOn = not isToggleOn -- Инвертируем состояние переключателя
            Toggle:Set(isToggleOn) -- Устанавливаем новое состояние переключателя
        end,
    })

		    local KeybindToggle = KeyBindsTab:CreateKeybind({
        Name = "Keybind TorsoSize",
        CurrentKeybind = "G",
        HoldToInteract = true,
        Flag = "Keybind11",
        Callback = function(Keybind)
            isToggleOn1 = not isToggleOn1
            Toggle1:Set(isToggleOn1)
        end,
    })


 local TabMovement = Window:CreateTab("Movement", nil)
 local Section = TabMovement:CreateSection("Cooming soon..")

 local SettingsTab = Window:CreateTab("Settings", nil)


	local Button = SettingsTab:CreateButton({
   Name = "Gui Destroy",
   Callback = function()
 Rayfield:Destroy()
   end,
 })

local Button = SettingsTab:CreateButton({
   Name = "Save",
   Callback = function()
SaveConfiguration()
   end,
 })


local Button = SettingsTab:CreateButton({
   Name = "Reload Gui And Save",
   Callback = function()  
SaveConfiguration()

Rayfield:Notify({
   Title = "Hey!" .. (player.DisplayName),
   Content = "Configuration Successfully Save",
   Duration = 6.5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Nice!",
         Callback = function()
      end
   },
},
})


   end,
 })

 


    spawn(function()
        while true do
            if isEnabled then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "Model" then
                        local head = v:FindFirstChild("Head")
                        if head then
                            head.Size = Vector3.new(headSize, headSize, headSize)
                            head.Material = Enum.Material.ForceField -- Применяем новый материал
                            head.Transparency = 0.3
                            head.CanCollide = false
                            head.CanTouch = false
                        end
                    end
                end
            end
            wait(1)
        end
    end)


 spawn(function()
        while true do
            if isEnabled1 then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "Model" then
                        local torso = v:FindFirstChild("Torso")
                        if  torso then
                           torso.Size = Vector3.new(TorsoSize, TorsoSize, TorsoSize)
                            torso.Material = Enum.Material.ForceField -- Применяем новый материал
                            torso.Transparency = 0.5
                            torso.CanCollide = false
                            torso.CanTouch = false
                        end
                    end
                end
			end
            wait(1)
        end
    end)
