local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player.PlayerGui
local PRODUCT_ID = "x23-Premium Edition"
local API_URL = "https://0df0d4ce-f84e-423b-971d-a243eea7e01f-00-1pzapgoozo9mk.picard.replit.dev/api/keys/validate"
local HUB_URL = "https://github.com/lxpzdylib41-web/snipercodesasmmyupdate/blob/main/cookiesxacecodetyper.lua

local function getHWID()
    local ok, value = pcall(function()
        if typeof(gethwid) == "function" then return gethwid() end
        if typeof(getfingerprint) == "function" then return getfingerprint() end
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    if ok and value and tostring(value) ~= "" then return tostring(value) end
    return nil
end

local function post(body)
    local encoded = HttpService:JSONEncode(body)
    local options = {
        Url = API_URL,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = encoded,
    }
    if typeof(syn) == "table" and typeof(syn.request) == "function" then return syn.request(options) end
    if typeof(request) == "function" then return request(options) end
    return HttpService:RequestAsync(options)
end

local function label(parent, text, size, position, color)
    local item = Instance.new("TextLabel")
    item.BackgroundTransparency = 1
    item.Size = size
    item.Position = position
    item.Text = text
    item.TextColor3 = color
    item.Font = Enum.Font.Gotham
    item.TextSize = 13
    item.Parent = parent
    return item
end

local old = playerGui:FindFirstChild("X23CloneLoader")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "X23CloneLoader"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local box = Instance.new("Frame")
box.Size = UDim2.new(0, 340, 0, 205)
box.Position = UDim2.new(0.5, -170, 0.5, -102)
box.BackgroundColor3 = Color3.fromRGB(12, 10, 20)
box.BorderSizePixel = 0
box.Parent = gui
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(170, 80, 255)
stroke.Thickness = 2
stroke.Parent = box

label(box, "✦ X23 HUB — CLON", UDim2.new(1, 0, 0, 32), UDim2.new(0, 0, 0, 16), Color3.fromRGB(190, 110, 255))
label(box, "Este loader usa keys exclusivas del segundo script", UDim2.new(1, -30, 0, 28), UDim2.new(0, 15, 0, 48), Color3.fromRGB(150, 130, 170))

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, -40, 0, 38)
input.Position = UDim2.new(0, 20, 0, 82)
input.BackgroundColor3 = Color3.fromRGB(25, 20, 36)
input.PlaceholderText = "X23-XXXX-XXXX-XXXX"
input.Text = ""
input.TextColor3 = Color3.fromRGB(240, 230, 255)
input.PlaceholderColor3 = Color3.fromRGB(105, 85, 125)
input.Font = Enum.Font.GothamBold
input.TextSize = 14
input.ClearTextOnFocus = false
input.Parent = box
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -40, 0, 36)
button.Position = UDim2.new(0, 20, 0, 130)
button.BackgroundColor3 = Color3.fromRGB(135, 55, 210)
button.Text = "Verificar key del clon"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 13
button.Parent = box
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

local status = label(box, "", UDim2.new(1, -40, 0, 24), UDim2.new(0, 20, 0, 174), Color3.fromRGB(255, 90, 90))
status.TextWrapped = true

local busy = false
local function verify()
    if busy then return end
    local key = input.Text:match("^%s*(.-)%s*$")
    if key == "" then status.Text = "Escribe una key"; return end
    busy = true
    button.Text = "Verificando..."
    local ok, response = pcall(post, { key = key, hwid = getHWID(), productId = PRODUCT_ID })
    if not ok or not response then
        status.Text = "No se pudo conectar con el servidor"
        busy = false
        button.Text = "Verificar key del clon"
        return
    end
    local success = response.Success or (response.StatusCode and response.StatusCode >= 200 and response.StatusCode < 300)
    local parsed, data = pcall(function() return HttpService:JSONDecode(response.Body) end)
    if not success or not parsed or type(data) ~= "table" or not data.valid then
        status.Text = (parsed and data and data.message) or "Key inválida para este loader"
        busy = false
        button.Text = "Verificar key del clon"
        return
    end
    status.Text = "Acceso concedido"
    status.TextColor3 = Color3.fromRGB(80, 255, 160)
    task.wait(0.8)
    gui:Destroy()
    pcall(function()
        loadstring(game:HttpGet(HUB_URL))()
    end)
end

button.MouseButton1Click:Connect(verify)
input.FocusLost:Connect(function(enterPressed)
    if enterPressed then verify() end
end)
