-- ==========================================
-- Script: Eilia Menu (Pro Max)
-- Developer: Eilia (TG @Saharrmohamed2005)
-- ==========================================
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- الألوان
local Black = Color3.fromRGB(10, 10, 10)
local Purple = Color3.fromRGB(150, 0, 255)
local White = Color3.fromRGB(255, 255, 255)
local DarkGrey = Color3.fromRGB(30, 30, 30)

-- 1. شاشة الترحيب
local function showSplash()
    local splashGui = Instance.new("ScreenGui")
    splashGui.Name = "EiliaSplash"
    splashGui.Parent = playerGui
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BorderSizePixel = 0
    frame.Parent = splashGui
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "🐉 تم تفعيل سكربت إيليا 🐉"
    textLabel.TextColor3 = White
    textLabel.TextSize = 30
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = frame
    task.wait(3)
    for i = 1, 10 do
        frame.BackgroundTransparency = i / 10
        textLabel.TextTransparency = i / 10
        task.wait(0.05)
    end
    splashGui:Destroy()
end

-- 2. إشعار التحديث
local function showUpdateNotification()
    local notifGui = Instance.new("ScreenGui")
    notifGui.Name = "EiliaNotif"
    notifGui.Parent = playerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 50)
    frame.Position = UDim2.new(0.5, -150, 0, 20)
    frame.BackgroundColor3 = Black
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Purple
    frame.Parent = notifGui
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "تم تحديث السكربت وإضافة قفز لانهائي 🔰"
    text.TextColor3 = White
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 14
    text.Parent = frame
    
    task.wait(5)
    notifGui:Destroy()
end

-- 3. بناء القائمة
local function createMenu()
    local menuGui = Instance.new("ScreenGui")
    menuGui.Name = "EiliaMenu"
    menuGui.Parent = playerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 500, 0, 550) -- كبرنا الطول شوية عشان الأزرار
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -275)
    mainFrame.BackgroundColor3 = Black
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Purple
    mainFrame.Parent = menuGui

    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 35)
    topBar.BackgroundColor3 = Black
    topBar.BorderSizePixel = 2
    topBar.BorderColor3 = Purple
    topBar.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.Text = "Eilia Menu | Pro Max"
    title.TextColor3 = Purple
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 20
    title.Parent = topBar

    local btnClose = Instance.new("TextButton")
    btnClose.Size = UDim2.new(0, 30, 0, 30)
    btnClose.Position = UDim2.new(1, -35, 0, 2)
    btnClose.BackgroundColor3 = Purple
    btnClose.Text = "X"
    btnClose.TextColor3 = White
    btnClose.Font = Enum.Font.SourceSansBold
    btnClose.Parent = topBar
    
    local btnMin = Instance.new("TextButton")
    btnMin.Size = UDim2.new(0, 30, 0, 30)
    btnMin.Position = UDim2.new(1, -70, 0, 2)
    btnMin.BackgroundColor3 = DarkGrey
    btnMin.Text = "-"
    btnMin.TextColor3 = White
    btnMin.Font = Enum.Font.SourceSansBold
    btnMin.Parent = topBar

    local page1 = Instance.new("Frame")
    page1.Size = UDim2.new(1, 0, 1, -35)
    page1.Position = UDim2.new(0, 0, 0, 35)
    page1.BackgroundTransparency = 1
    page1.Parent = mainFrame

    local function createControlPanel(name, yPos, defaultVal, isSpeed)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0.9, 0, 0, 70) -- صغرنا الارتفاع
        container.Position = UDim2.new(0.05, 0, 0, yPos)
        container.BackgroundColor3 = DarkGrey
        container.BorderSizePixel = 1
        container.BorderColor3 = Purple
        container.Parent = page1

        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Size = UDim2.new(0.35, 0, 0, 30)
        toggleBtn.Position = UDim2.new(0, 10, 0, 20)
        toggleBtn.BackgroundColor3 = DarkGrey
        toggleBtn.Text = name .. " [OFF]"
        toggleBtn.TextColor3 = White
        toggleBtn.Font = Enum.Font.SourceSansBold
        toggleBtn.Parent = container

        local textBox = Instance.new("TextBox")
        textBox.Size = UDim2.new(0.25, 0, 0, 30)
        textBox.Position = UDim2.new(0.4, 0, 0, 20)
        textBox.BackgroundColor3 = Black
        textBox.TextColor3 = White
        textBox.Text = tostring(defaultVal)
        textBox.BorderSizePixel = 1
        textBox.BorderColor3 = Purple
        textBox.Parent = container

        local applyBtn = Instance.new("TextButton")
        applyBtn.Size = UDim2.new(0.25, 0, 0, 30)
        applyBtn.Position = UDim2.new(0.7, 0, 0, 20)
        applyBtn.BackgroundColor3 = Purple
        applyBtn.Text = "تطبيق"
        applyBtn.TextColor3 = White
        applyBtn.Font = Enum.Font.SourceSansBold
        applyBtn.Parent = container

        local isOn = false
        local function applyValue()
            local hum = player.Character and player.Character:FindFirstChild("Humanoid")
            if hum and isOn then
                local num = tonumber(textBox.Text)
                if num then
                    if isSpeed then hum.WalkSpeed = num
                    else hum.JumpPower = num end
                end
            end
        end

        toggleBtn.MouseButton1Click:Connect(function()
            isOn = not isOn
            if isOn then
                toggleBtn.Text = name .. " [ON]"
                toggleBtn.BackgroundColor3 = Purple
                applyValue()
            else
                toggleBtn.Text = name .. " [OFF]"
                toggleBtn.BackgroundColor3 = DarkGrey
                local hum = player.Character and player.Character:FindFirstChild("Humanoid")
                if hum then
                    if isSpeed then hum.WalkSpeed = 16
                    else hum.JumpPower = 50 end
                end
            end
        end)

        applyBtn.MouseButton1Click:Connect(applyValue)
        textBox.FocusLost:Connect(applyValue)
    end

    createControlPanel("السرعة", 10, 160, true)
    createControlPanel("القفز", 90, 125, false)

    -- القفز اللانهائي
    local infJumpContainer = Instance.new("Frame")
    infJumpContainer.Size = UDim2.new(0.9, 0, 0, 40)
    infJumpContainer.Position = UDim2.new(0.05, 0, 0, 170)
    infJumpContainer.BackgroundColor3 = DarkGrey
    infJumpContainer.BorderSizePixel = 1
    infJumpContainer.BorderColor3 = Purple
    infJumpContainer.Parent = page1

    local infJumpBtn = Instance.new("TextButton")
    infJumpBtn.Size = UDim2.new(1, 0, 1, 0)
    infJumpBtn.BackgroundTransparency = 1
    infJumpBtn.Text = "تفعيل القفز اللانهائي [OFF]"
    infJumpBtn.TextColor3 = White
    infJumpBtn.Font = Enum.Font.SourceSansBold
    infJumpBtn.Parent = infJumpContainer

    local infJumpOn = false
    infJumpBtn.MouseButton1Click:Connect(function()
        infJumpOn = not infJumpOn
        if infJumpOn then
            infJumpBtn.Text = "تفعيل القفز اللانهائي [ON]"
            infJumpContainer.BackgroundColor3 = Purple
        else
            infJumpBtn.Text = "تفعيل القفز اللانهائي [OFF]"
            infJumpContainer.BackgroundColor3 = DarkGrey
        end
    end)

    UserInputService.JumpRequest:Connect(function()
        if infJumpOn then
            local hum = player.Character and player.Character:FindFirstChild("Humanoid")
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)

    -- الجاذبية
    local gravityFrame = Instance.new("Frame")
    gravityFrame.Size = UDim2.new(0.9, 0, 0, 60)
    gravityFrame.Position = UDim2.new(0.05, 0, 0, 220)
    gravityFrame.BackgroundColor3 = DarkGrey
    gravityFrame.BorderSizePixel = 1
    gravityFrame.BorderColor3 = Purple
    gravityFrame.Parent = page1

    local gravTitle = Instance.new("TextLabel")
    gravTitle.Size = UDim2.new(1, 0, 0, 20)
    gravTitle.BackgroundTransparency = 1
    gravTitle.Text = "تخفيف الجاذبية:"
    gravTitle.TextColor3 = White
    gravTitle.Font = Enum.Font.SourceSansBold
    gravTitle.Parent = gravityFrame

    local gravities = {15, 20, 30, 40, 44}
    for i, val in ipairs(gravities) do
        local gBtn = Instance.new("TextButton")
        gBtn.Size = UDim2.new(0.18, 0, 0, 25)
        gBtn.Position = UDim2.new((i-1) * 0.2 + 0.02, 0, 0, 25)
        gBtn.BackgroundColor3 = Purple
        gBtn.Text = tostring(val) .. "%"
        gBtn.TextColor3 = White
        gBtn.Parent = gravityFrame
        gBtn.MouseButton1Click:Connect(function()
            game.Workspace.Gravity = 196.2 * (1 - (val / 100))
        end)
    end

    -- الكشف (ESP)
    local espBtn = Instance.new("TextButton")
    espBtn.Size = UDim2.new(0.9, 0, 0, 40)
    espBtn.Position = UDim2.new(0.05, 0, 0, 290)
    espBtn.BackgroundColor3 = DarkGrey
    espBtn.Text = "تفعيل كشف الأعداء (300 بلوكة) [OFF]"
    espBtn.TextColor3 = White
    espBtn.Font = Enum.Font.SourceSansBold
    espBtn.Parent = page1

    local espOn = false
    espBtn.MouseButton1Click:Connect(function()
        espOn = not espOn
        if espOn then
            espBtn.Text = "تفعيل كشف الأعداء (300 بلوكة) [ON]"
            espBtn.BackgroundColor3 = Purple
        else
            espBtn.Text = "تفعيل كشف الأعداء (300 بلوكة) [OFF]"
            espBtn.BackgroundColor3 = DarkGrey
            for _, p in ipairs(game.Players:GetPlayers()) do
                if p.Character then
                    local hl = p.Character:FindFirstChild("ESP_Highlight")
                    local box = p.Character:FindFirstChild("ESP_Box")
                    if hl then hl:Destroy() end
                    if box then box:Destroy() end
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.5) do
            if espOn and player.Character then
                local myRoot = player.Character:FindFirstChild("HumanoidRootPart")
                if myRoot then
                    for _, other in ipairs(game.Players:GetPlayers()) do
                        if other ~= player and other.Character then
                            local otherRoot = other.Character:FindFirstChild("HumanoidRootPart")
                            if otherRoot then
                                local dist = (myRoot.Position - otherRoot.Position).Magnitude
                                if dist <= 300 then
                                    if not other.Character:FindFirstChild("ESP_Highlight") then
                                        local hl = Instance.new("Highlight")
                                        hl.Name = "ESP_Highlight"
                                        hl.FillColor = Purple
                                        hl.OutlineColor = Purple
                                        hl.Parent = other.Character
                                    end
                                else
                                    local hl = other.Character:FindFirstChild("ESP_Highlight")
                                    if hl then hl:Destroy() end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    -- صفحة المعلومات (صفحة 2)
    local page2 = Instance.new("Frame")
    page2.Size = UDim2.new(1, 0, 1, -35)
    page2.Position = UDim2.new(0, 0, 0, 35)
    page2.BackgroundTransparency = 1
    page2.Parent = mainFrame
    page2.Visible = false

    local infoText = Instance.new("TextLabel")
    infoText.Size = UDim2.new(0.9, 0, 0.9, 0)
    infoText.Position = UDim2.new(0.05, 0, 0.05, 0)
    infoText.BackgroundTransparency = 1
    infoText.TextColor3 = White
    infoText.TextXAlignment = Enum.TextXAlignment.Left
    infoText.TextYAlignment = Enum.TextYAlignment.Top
    infoText.Font = Enum.Font.SourceSans
    infoText.TextSize = 14
    infoText.TextWrapped = true
    infoText.Text = "مطور السكربت: إيليا\n" ..
                     "تيك توك: b2_af\n" ..
                     "تلغرام: @Saharrmohamed2005\n" ..
                     "قناة تلغرام: w8q_y\n\n" ..
                     "المابات المدعومة:\n" ..
                     "- جست بلانت\n" ..
                     "- سرقة البراين\n" ..
                     "- البيوت (بروكهافن)\n" ..
                     "- فليك السنايبر (المقلد والأصل)\n\n" ..
                     "للاستفسار: @Saharrmohamed2005"
    infoText.Parent = page2

    -- التنقل
    local navFrame = Instance.new("Frame")
    navFrame.Size = UDim2.new(0, 100, 1, 0)
    navFrame.Position = UDim2.new(0, 0, 0, 35)
    navFrame.BackgroundColor3 = Black
    navFrame.BorderSizePixel = 1
    navFrame.BorderColor3 = Purple
    navFrame.Parent = mainFrame

    local navBtn1 = Instance.new("TextButton")
    navBtn1.Size = UDim2.new(1, 0, 0, 50)
    navBtn1.Position = UDim2.new(0, 0, 0, 0)
    navBtn1.BackgroundTransparency = 1
    navBtn1.Text = "تحكم\nاللاعب"
    navBtn1.TextColor3 = Purple
    navBtn1.Font = Enum.Font.SourceSansBold
    navBtn1.Parent = navFrame

    local navBtn2 = Instance.new("TextButton")
    navBtn2.Size = UDim2.new(1, 0, 0, 50)
    navBtn2.Position = UDim2.new(0, 0, 0, 50)
    navBtn2.BackgroundTransparency = 1
    navBtn2.Text = "معلومات"
    navBtn2.TextColor3 = White
    navBtn2.Font = Enum.Font.SourceSansBold
    navBtn2.Parent = navFrame

    page1.Position = UDim2.new(0, 100, 0, 35)
    page1.Size = UDim2.new(1, -100, 1, -35)
    page2.Position = UDim2.new(0, 100, 0, 35)
    page2.Size = UDim2.new(1, -100, 1, -35)

    navBtn1.MouseButton1Click:Connect(function()
        page1.Visible = true
        page2.Visible = false
        navBtn1.TextColor3 = Purple
        navBtn2.TextColor3 = White
    end)

    navBtn2.MouseButton1Click:Connect(function()
        page1.Visible = false
        page2.Visible = true
        navBtn1.TextColor3 = White
        navBtn2.TextColor3 = Purple
    end)

    -- زر الحقوق
    local rightsBtn = Instance.new("TextButton")
    rightsBtn.Size = UDim2.new(0, 250, 0, 30)
    rightsBtn.Position = UDim2.new(0, 10, 1, -40)
    rightsBtn.BackgroundTransparency = 1
    rightsBtn.Text = "Speed by Eilia | TG @Saharrmohamed2005"
    rightsBtn.TextColor3 = Purple
    rightsBtn.Font = Enum.Font.SourceSansBold
    rightsBtn.TextSize = 12
    rightsBtn.TextXAlignment = Enum.TextXAlignment.Left
    rightsBtn.Parent = menuGui

    rightsBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)

    -- زر الإغلاق النهائي
    btnClose.MouseButton1Click:Connect(function()
        local hum = player.Character and player.Character:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = 16
            hum.JumpPower = 50
        end
        game.Workspace.Gravity = 196.2
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p.Character then
                local hl = p.Character:FindFirstChild("ESP_Highlight")
                if hl then hl:Destroy() end
            end
        end
        menuGui:Destroy()
    end)
    
    -- زر التصغير
    btnMin.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)
end

showSplash()
showUpdateNotification()
createMenu()
