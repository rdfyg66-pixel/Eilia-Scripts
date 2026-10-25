-- ==========================================
-- Script: Eilia Menu (Pro UI + ESP) - Horizontal
-- Developer: Eilia (TG @Saharrmohamed2005)
-- ==========================================
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

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

-- 2. بناء القائمة
local function createMenu()
    local menuGui = Instance.new("ScreenGui")
    menuGui.Name = "EiliaMenu"
    menuGui.Parent = playerGui

    -- الإطار الرئيسي (عريض وقصير)
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 650, 0, 250)
    mainFrame.Position = UDim2.new(0.5, -325, 0.5, -125)
    mainFrame.BackgroundColor3 = Black
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Purple
    mainFrame.Parent = menuGui

    -- الشريط العلوي
    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 35)
    topBar.BackgroundColor3 = Black
    topBar.BorderSizePixel = 2
    topBar.BorderColor3 = Purple
    topBar.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.Text = "Eilia Menu | Pro (Horizontal)"
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

    -- صفحة التحكم (أفقية)
    local page1 = Instance.new("Frame")
    page1.Size = UDim2.new(1, 0, 1, -35)
    page1.Position = UDim2.new(0, 0, 0, 35)
    page1.BackgroundTransparency = 1
    page1.Parent = mainFrame

    -- دالة إنشاء لوحة تحكم (سرعة أو قفز)
    local function createControlPanel(name, xPos, defaultVal, isSpeed)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0.45, 0, 0, 100)
        container.Position = UDim2.new(xPos, 0, 0.05, 0)
        container.BackgroundColor3 = DarkGrey
        container.BorderSizePixel = 1
        container.BorderColor3 = Purple
        container.Parent = page1

        local titleLbl = Instance.new("TextLabel")
        titleLbl.Size = UDim2.new(1, 0, 0, 20)
        titleLbl.BackgroundTransparency = 1
        titleLbl.Text = name
        titleLbl.TextColor3 = White
        titleLbl.Font = Enum.Font.SourceSansBold
        titleLbl.Parent = container

        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Size = UDim2.new(0.3, 0, 0, 30)
        toggleBtn.Position = UDim2.new(0.05, 0, 0, 30)
        toggleBtn.BackgroundColor3 = DarkGrey
        toggleBtn.Text = "[OFF]"
        toggleBtn.TextColor3 = White
        toggleBtn.Font = Enum.Font.SourceSansBold
        toggleBtn.Parent = container

        local textBox = Instance.new("TextBox")
        textBox.Size = UDim2.new(0.3, 0, 0, 30)
        textBox.Position = UDim2.new(0.35, 0, 0, 30)
        textBox.BackgroundColor3 = Black
        textBox.TextColor3 = White
        textBox.Text = tostring(defaultVal)
        textBox.BorderSizePixel = 1
        textBox.BorderColor3 = Purple
        textBox.Parent = container

        local applyBtn = Instance.new("TextButton")
        applyBtn.Size = UDim2.new(0.25, 0, 0, 30)
        applyBtn.Position = UDim2.new(0.7, 0, 0, 30)
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
                toggleBtn.Text = "[ON]"
                toggleBtn.BackgroundColor3 = Purple
                applyValue()
            else
                toggleBtn.Text = "[OFF]"
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

    -- لوحات التحكم (السرعة والقفز)
    createControlPanel("السرعة", 0.025, 160, true)
    createControlPanel("القفز", 0.525, 125, false)

    -- لوحة الجاذبية
    local gravContainer = Instance.new("Frame")
    gravContainer.Size = UDim2.new(0.95, 0, 0, 100)
    gravContainer.Position = UDim2.new(0.025, 0, 0.55, 0)
    gravContainer.BackgroundColor3 = DarkGrey
    gravContainer.BorderSizePixel = 1
    gravContainer.BorderColor3 = Purple
    gravContainer.Parent = page1

    local gravTitle = Instance.new("TextLabel")
    gravTitle.Size = UDim2.new(1, 0, 0, 20)
    gravTitle.BackgroundTransparency = 1
    gravTitle.Text = "الجاذبية"
    gravTitle.TextColor3 = White
    gravTitle.Font = Enum.Font.SourceSansBold
    gravTitle.Parent = gravContainer

    local gravToggle = Instance.new("TextButton")
    gravToggle.Size = UDim2.new(0.2, 0, 0, 30)
    gravToggle.Position = UDim2.new(0.05, 0, 0, 30)
    gravToggle.BackgroundColor3 = DarkGrey
    gravToggle.Text = "[OFF]"
    gravToggle.TextColor3 = White
    gravToggle.Font = Enum.Font.SourceSansBold
    gravToggle.Parent = gravContainer

    local gravFrame = Instance.new("Frame")
    gravFrame.Size = UDim2.new(0.65, 0, 0, 30)
    gravFrame.Position = UDim2.new(0.3, 0, 0, 30)
    gravFrame.BackgroundTransparency = 1
    gravFrame.Parent = gravContainer

    local gravities = {15, 20, 30, 40, 44}
    local selectedVal = 15
    local isGravOn = false
    
    local gravButtons = {}
    for i, val in ipairs(gravities) do
        local gBtn = Instance.new("TextButton")
        gBtn.Size = UDim2.new(0.18, 0, 0, 30)
        gBtn.Position = UDim2.new((i-1) * 0.2, 0, 0, 0)
        gBtn.BackgroundColor3 = DarkGrey
        gBtn.Text = tostring(val) .. "%"
        gBtn.TextColor3 = White
        gBtn.Font = Enum.Font.SourceSansBold
        gBtn.Parent = gravFrame
        gravButtons[i] = gBtn
        
        gBtn.MouseButton1Click:Connect(function()
            selectedVal = val
            for _, b in ipairs(gravButtons) do
                b.BackgroundColor3 = DarkGrey
            end
            gBtn.BackgroundColor3 = Purple
            if isGravOn then
                game.Workspace.Gravity = 196.2 * (1 - (selectedVal / 100))
            end
        end)
    end

    gravButtons[1].BackgroundColor3 = Purple

    gravToggle.MouseButton1Click:Connect(function()
        isGravOn = not isGravOn
        if isGravOn then
            gravToggle.Text = "[ON]"
            gravToggle.BackgroundColor3 = Purple
            game.Workspace.Gravity = 196.2 * (1 - (selectedVal / 100))
        else
            gravToggle.Text = "[OFF]"
            gravToggle.BackgroundColor3 = DarkGrey
            game.Workspace.Gravity = 196.2
        end
    end)

    -- لوحة ESP
    local espContainer = Instance.new("Frame")
    espContainer.Size = UDim2.new(0.95, 0, 0, 40)
    espContainer.Position = UDim2.new(0.025, 0, 0.85, 0)
    espContainer.BackgroundColor3 = DarkGrey
    espContainer.BorderSizePixel = 1
    espContainer.BorderColor3 = Purple
    espContainer.Parent = page1

    local espBtn = Instance.new("TextButton")
    espBtn.Size = UDim2.new(1, 0, 1, 0)
    espBtn.BackgroundTransparency = 1
    espBtn.Text = "تفعيل كشف الأعداء (300 بلوكة) [OFF]"
    espBtn.TextColor3 = White
    espBtn.Font = Enum.Font.SourceSansBold
    espBtn.Parent = espContainer

    local espOn = false
    espBtn.MouseButton1Click:Connect(function()
        espOn = not espOn
        if espOn then
            espBtn.Text = "تفعيل كشف الأعداء (300 بلوكة) [ON]"
            espBtn.Parent.BackgroundColor3 = Purple
        else
            espBtn.Text = "تفعيل كشف الأعداء (300 بلوكة) [OFF]"
            espBtn.Parent.BackgroundColor3 = DarkGrey
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
                                    if not other.Character:FindFirstChild("ESP_Box") then
                                        local box = Instance.new("SelectionBox")
                                        box.Name = "ESP_Box"
                                        box.Adornee = otherRoot
                                        box.Color3 = Purple
                                        box.LineThickness = 0.1
                                        box.Parent = other.Character
                                    end
                                else
                                    local hl = other.Character:FindFirstChild("ESP_Highlight")
                                    local box = other.Character:FindFirstChild("ESP_Box")
                                    if hl then hl:Destroy() end
                                    if box then box:Destroy() end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    -- صفحة المعلومات (تحتاج ضغط زر للوصول إليها، بس بما إننا سوينا القائمة عريضة، خلينا نطلعها فوق)
    local infoBtn = Instance.new("TextButton")
    infoBtn.Size = UDim2.new(0, 100, 0, 20)
    infoBtn.Position = UDim2.new(0.5, -50, 1, -25)
    infoBtn.BackgroundTransparency = 1
    infoBtn.Text = "معلومات المطور"
    infoBtn.TextColor3 = Purple
    infoBtn.Font = Enum.Font.SourceSansBold
    infoBtn.Parent = mainFrame

    local infoGui = Instance.new("Frame")
    infoGui.Size = UDim2.new(0, 400, 0, 300)
    infoGui.Position = UDim2.new(0.5, -200, 0.5, -150)
    infoGui.BackgroundColor3 = Black
    infoGui.BorderSizePixel = 2
    infoGui.BorderColor3 = Purple
    infoGui.Parent = menuGui
    infoGui.Visible = false

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
    infoText.Parent = infoGui

    local closeInfo = Instance.new("TextButton")
    closeInfo.Size = UDim2.new(0, 30, 0, 30)
    closeInfo.Position = UDim2.new(1, -35, 0, 2)
    closeInfo.BackgroundColor3 = Purple
    closeInfo.Text = "X"
    closeInfo.TextColor3 = White
    closeInfo.Parent = infoGui
    closeInfo.MouseButton1Click:Connect(function() infoGui.Visible = false end)

    infoBtn.MouseButton1Click:Connect(function()
        infoGui.Visible = not infoGui.Visible
    end)

    -- زر الحقوق (Toggle)
    local rightsBtn = Instance.new("TextButton")
    rightsBtn.Size = UDim2.new(0, 250, 0, 20)
    rightsBtn.Position = UDim2.new(0, 10, 1, -25)
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
                local box = p.Character:FindFirstChild("ESP_Box")
                if hl then hl:Destroy() end
                if box then box:Destroy() end
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
createMenu()
