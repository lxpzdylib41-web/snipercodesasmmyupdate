local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local PRODUCT_ID = "x23-clone"

local API_URL =
    "https://0df0d4ce-f84e-423b-971d-a243eea7e01f-00-1pzapgoozo9mk.picard.replit.dev/api/keys/validate"

local HUB_URL =
    "https://raw.githubusercontent.com/lxpzdylib41-web/snipercodesasmmyupdate/main/cookiesxacecodetyper.lua"

--------------------------------------------------
-- HWID
--------------------------------------------------

local function getHWID()

    local ok, value = pcall(function()

        if typeof(gethwid) == "function" then
            return gethwid()
        end

        if typeof(getfingerprint) == "function" then
            return getfingerprint()
        end

        return game:GetService(
            "RbxAnalyticsService"
        ):GetClientId()

    end)

    if ok
        and value
        and tostring(value) ~= "" then

        return tostring(value)
    end

    return nil
end

--------------------------------------------------
-- HTTP POST
--------------------------------------------------

local function post(body)

    local encoded =
        HttpService:JSONEncode(body)

    local options = {
        Url = API_URL,
        Method = "POST",

        Headers = {
            ["Content-Type"] =
                "application/json"
        },

        Body = encoded
    }

    --------------------------------------------------
    -- SYN
    --------------------------------------------------

    if typeof(syn) == "table"
        and typeof(syn.request) == "function" then

        return syn.request(options)
    end

    --------------------------------------------------
    -- REQUEST
    --------------------------------------------------

    if typeof(request) == "function" then
        return request(options)
    end

    --------------------------------------------------
    -- HTTP REQUEST
    --------------------------------------------------

    if typeof(http_request) == "function" then
        return http_request(options)
    end

    --------------------------------------------------
    -- ROBLOX HTTP
    --------------------------------------------------

    return HttpService:RequestAsync(options)
end

--------------------------------------------------
-- LABEL
--------------------------------------------------

local function label(
    parent,
    text,
    size,
    position,
    color
)

    local item =
        Instance.new("TextLabel")

    item.BackgroundTransparency = 1

    item.Size = size
    item.Position = position

    item.Text = text
    item.TextColor3 = color

    item.Font =
        Enum.Font.Gotham

    item.TextSize = 13

    item.Parent = parent

    return item
end

--------------------------------------------------
-- REMOVE OLD GUI
--------------------------------------------------

local old =
    playerGui:FindFirstChild(
        "X23PremiumLoader"
    )

if old then
    old:Destroy()
end

--------------------------------------------------
-- GUI
--------------------------------------------------

local gui =
    Instance.new("ScreenGui")

gui.Name =
    "X23PremiumLoader"

gui.ResetOnSpawn = false
gui.Parent = playerGui

--------------------------------------------------
-- MAIN BOX
--------------------------------------------------

local box =
    Instance.new("Frame")

box.Size =
    UDim2.new(
        0,
        340,
        0,
        205
    )

box.Position =
    UDim2.new(
        0.5,
        -170,
        0.5,
        -102
    )

box.BackgroundColor3 =
    Color3.fromRGB(
        12,
        10,
        20
    )

box.BorderSizePixel = 0

box.Parent = gui

Instance.new(
    "UICorner",
    box
).CornerRadius =
    UDim.new(0, 14)

--------------------------------------------------
-- BORDER
--------------------------------------------------

local stroke =
    Instance.new("UIStroke")

stroke.Color =
    Color3.fromRGB(
        170,
        80,
        255
    )

stroke.Thickness = 2

stroke.Parent = box

--------------------------------------------------
-- TITLE
--------------------------------------------------

label(
    box,
    "X23 HUB - Premium Edition",
    UDim2.new(1, 0, 0, 32),
    UDim2.new(0, 0, 0, 16),
    Color3.fromRGB(
        190,
        110,
        255
    )
)

label(
    box,
    "ESCRIBE TU KEY PARA ACCEDER",
    UDim2.new(1, -30, 0, 28),
    UDim2.new(0, 15, 0, 48),
    Color3.fromRGB(
        150,
        130,
        170
    )
)

--------------------------------------------------
-- KEY INPUT
--------------------------------------------------

local input =
    Instance.new("TextBox")

input.Size =
    UDim2.new(
        1,
        -40,
        0,
        38
    )

input.Position =
    UDim2.new(
        0,
        20,
        0,
        82
    )

input.BackgroundColor3 =
    Color3.fromRGB(
        25,
        20,
        36
    )

input.PlaceholderText =
    "X23-XXXX-XXXX-XXXX"

input.Text = ""

input.TextColor3 =
    Color3.fromRGB(
        240,
        230,
        255
    )

input.PlaceholderColor3 =
    Color3.fromRGB(
        105,
        85,
        125
    )

input.Font =
    Enum.Font.GothamBold

input.TextSize = 14

input.ClearTextOnFocus = false

input.Parent = box

Instance.new(
    "UICorner",
    input
).CornerRadius =
    UDim.new(0, 8)

--------------------------------------------------
-- BUTTON
--------------------------------------------------

local button =
    Instance.new("TextButton")

button.Size =
    UDim2.new(
        1,
        -40,
        0,
        36
    )

button.Position =
    UDim2.new(
        0,
        20,
        0,
        130
    )

button.BackgroundColor3 =
    Color3.fromRGB(
        135,
        55,
        210
    )

button.Text =
    "Verificar Key"

button.TextColor3 =
    Color3.fromRGB(
        255,
        255,
        255
    )

button.Font =
    Enum.Font.GothamBold

button.TextSize = 13

button.Parent = box

Instance.new(
    "UICorner",
    button
).CornerRadius =
    UDim.new(0, 8)

--------------------------------------------------
-- STATUS
--------------------------------------------------

local status =
    label(
        box,
        "",
        UDim2.new(
            1,
            -40,
            0,
            28
        ),
        UDim2.new(
            0,
            20,
            0,
            171
        ),
        Color3.fromRGB(
            255,
            90,
            90
        )
    )

status.TextWrapped = true
status.TextXAlignment =
    Enum.TextXAlignment.Center

--------------------------------------------------
-- SERVER OFFLINE
--------------------------------------------------

local function serverOffline()

    status.Text =
        "🔴 SERVER APAGADO\nContacta al vendedor"

    status.TextColor3 =
        Color3.fromRGB(
            255,
            70,
            70
        )

    button.Text =
        "Servidor apagado"

    button.BackgroundColor3 =
        Color3.fromRGB(
            90,
            20,
            30
        )

    warn(
        "[X23] SERVER APAGADO - Contacta al vendedor"
    )

end

--------------------------------------------------
-- RESET BUTTON
--------------------------------------------------

local function resetButton()

    button.Text =
        "Verificar Key"

    button.BackgroundColor3 =
        Color3.fromRGB(
            135,
            55,
            210
        )

    button.Active = true

end

--------------------------------------------------
-- FORMAT KEY TIME
--------------------------------------------------

local function getKeyTimeText(data)

    local keyType =
        tostring(
            data.type or ""
        ):lower()

    --------------------------------------------------
    -- PERMANENT
    --------------------------------------------------

    if keyType == "permanent"
        or data.expiresAt == nil then

        return "✅ Key válida • Permanente"
    end

    --------------------------------------------------
    -- EXPIRATION
    --------------------------------------------------

    local expiresAt =
        tostring(data.expiresAt)

    local ok, result =
        pcall(function()

            local date =
                DateTime.fromIsoDate(
                    expiresAt
                )

            local now =
                DateTime.now()

            local remaining =
                date.UnixTimestamp
                - now.UnixTimestamp

            return remaining

        end)

    if not ok
        or type(result) ~= "number" then

        return "✅ Key válida"
    end

    --------------------------------------------------
    -- EXPIRED
    --------------------------------------------------

    if result <= 0 then
        return "✅ Key válida • Expirada"
    end

    --------------------------------------------------
    -- DAYS
    --------------------------------------------------

    local days =
        math.floor(
            result / 86400
        )

    if days >= 1 then

        if days == 1 then

            return
                "✅ Key válida • 1 día restante"

        else

            return
                "✅ Key válida • "
                .. tostring(days)
                .. " días restantes"

        end
    end

    --------------------------------------------------
    -- HOURS
    --------------------------------------------------

    local hours =
        math.floor(
            result / 3600
        )

    if hours >= 1 then

        if hours == 1 then

            return
                "✅ Key válida • 1 hora restante"

        else

            return
                "✅ Key válida • "
                .. tostring(hours)
                .. " horas restantes"

        end
    end

    --------------------------------------------------
    -- MINUTES
    --------------------------------------------------

    local minutes =
        math.max(
            1,
            math.floor(
                result / 60
            )
        )

    return
        "✅ Key válida • "
        .. tostring(minutes)
        .. " minutos restantes"

end

--------------------------------------------------
-- VERIFY
--------------------------------------------------

local busy = false

local function verify()

    if busy then
        return
    end

    local key =
        input.Text:match(
            "^%s*(.-)%s*$"
        )

    if key == "" then

        status.Text =
            "⚠️ Escribe tu key"

        status.TextColor3 =
            Color3.fromRGB(
                255,
                200,
                80
            )

        return
    end

    busy = true

    button.Active = false

    --------------------------------------------------
    -- VERIFYING KEY
    --------------------------------------------------

    button.Text =
        "Verificando..."

    button.BackgroundColor3 =
        Color3.fromRGB(
            70,
            45,
            100
        )

    status.Text =
        "🔐 Verificando key..."

    status.TextColor3 =
        Color3.fromRGB(
            255,
            200,
            80
        )

    --------------------------------------------------
    -- API
    --------------------------------------------------

    local ok, response =
        pcall(
            post,
            {
                key = key,
                hwid = getHWID(),
                productId = PRODUCT_ID
            }
        )

    --------------------------------------------------
    -- NO RESPONSE
    --------------------------------------------------

    if not ok or not response then

        serverOffline()

        busy = false

        return
    end

    --------------------------------------------------
    -- HTTP STATUS
    --------------------------------------------------

    local statusCode =
        tonumber(
            response.StatusCode
        )

    if statusCode then

        --------------------------------------------------
        -- 5XX SERVER ERROR
        --------------------------------------------------

        if statusCode >= 500 then

            serverOffline()

            busy = false

            return
        end

        --------------------------------------------------
        -- OTHER HTTP ERROR
        --------------------------------------------------

        if statusCode < 200
            or statusCode >= 300 then

            status.Text =
                "⚠️ Error del servidor (" ..
                tostring(statusCode) ..
                ")"

            status.TextColor3 =
                Color3.fromRGB(
                    255,
                    170,
                    70
                )

            resetButton()

            busy = false

            return
        end

    elseif response.Success == false then

        serverOffline()

        busy = false

        return
    end

    --------------------------------------------------
    -- EMPTY RESPONSE
    --------------------------------------------------

    if not response.Body
        or tostring(
            response.Body
        ) == "" then

        serverOffline()

        busy = false

        return
    end

    --------------------------------------------------
    -- JSON
    --------------------------------------------------

    local parsed, data =
        pcall(function()

            return HttpService:JSONDecode(
                response.Body
            )

        end)

    if not parsed
        or type(data) ~= "table" then

        serverOffline()

        busy = false

        return
    end

    --------------------------------------------------
    -- SERVER DISABLED
    --------------------------------------------------

    if data.serverOnline == false
        or data.serverEnabled == false
        or data.maintenance == true then

        serverOffline()

        busy = false

        return
    end

    --------------------------------------------------
    -- INVALID KEY
    --------------------------------------------------

    if data.valid ~= true then

        status.Text =
            "❌ " ..
            tostring(
                data.message
                or "Key inválida o expirada"
            )

        status.TextColor3 =
            Color3.fromRGB(
                255,
                90,
                90
            )

        resetButton()

        busy = false

        return
    end

    --------------------------------------------------
    -- VALID KEY
    --------------------------------------------------

    animating = false

    stroke.Color =
        Color3.fromRGB(
            80,
            255,
            160
        )

    button.Text =
        "✅ Acceso concedido"

    button.BackgroundColor3 =
        Color3.fromRGB(
            35,
            150,
            85
        )

    status.Text =
        getKeyTimeText(data)

    status.TextColor3 =
        Color3.fromRGB(
            80,
            255,
            160
        )

    print(
        "[X23] "
        .. getKeyTimeText(data)
    )

    --------------------------------------------------
    -- ONLY SHOW RESULT BRIEFLY
    --------------------------------------------------

    task.wait(1)

    --------------------------------------------------
    -- CLOSE LOADER
    --------------------------------------------------

    if gui
        and gui.Parent then

        gui:Destroy()

    end

    --------------------------------------------------
    -- LOAD HUB DIRECTLY
    --------------------------------------------------

    local okHttp, hubSource =
        pcall(function()

            return game:HttpGet(
                HUB_URL
            )

        end)

    if not okHttp
        or not hubSource
        or tostring(hubSource) == "" then

        warn(
            "[X23] Error descargando HUB:",
            hubSource
        )

        return
    end

    --------------------------------------------------
    -- LOADSTRING
    --------------------------------------------------

    if type(loadstring) ~= "function" then

        warn(
            "[X23] loadstring no disponible"
        )

        return
    end

    --------------------------------------------------
    -- COMPILE HUB
    --------------------------------------------------

    local hubFunction, compileError =
        loadstring(
            hubSource
        )

    if not hubFunction then

        warn(
            "[X23] Error compilando HUB:",
            compileError
        )

        return
    end

    --------------------------------------------------
    -- RUN HUB
    --------------------------------------------------

    local okRun, runError =
        pcall(
            hubFunction
        )

    if not okRun then

        warn(
            "[X23] Error ejecutando HUB:",
            runError
        )

    end

end

--------------------------------------------------
-- BUTTON
--------------------------------------------------

button.MouseButton1Click:Connect(
    function()

        verify()

    end
)

--------------------------------------------------
-- ENTER
--------------------------------------------------

input.FocusLost:Connect(
    function(enterPressed)

        if enterPressed then
            verify()
        end

    end
)

--------------------------------------------------
-- RAINBOW ANIMATION
--------------------------------------------------

local animating = true

task.spawn(function()

    while animating
        and gui
        and gui.Parent do

        for hue = 0, 1, 0.015 do

            if not animating then
                break
            end

            local rgb =
                Color3.fromHSV(
                    hue,
                    0.75,
                    1
                )

            if stroke
                and stroke.Parent then

                stroke.Color = rgb

            end

            task.wait(0.04)

        end

    end

end)
