-- Vanish Loader - Platform Detector (PC / Mobile / Console / VR) - No Webhooks
-- Cleaned & fixed March 2026

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer

-- ──────────────────────────────────────────────
--  PLATFORM DETECTION (accurate in 2026)
-- ──────────────────────────────────────────────

local function IsMobile()
    -- Touch-enabled + small screen + touch input active
    return UserInputService.TouchEnabled 
        and (GuiService:IsTenFootInterface() == false)  -- exclude console
        and (UserInputService.MouseEnabled == false or UserInputService.MouseBehavior == Enum.MouseBehavior.Default)
end

local function IsConsole()
    -- Xbox / PlayStation detection
    return GuiService:IsTenFootInterface()          -- Official console UI mode
        or UserInputService.GamepadEnabled
end

local function IsPC()
    -- Keyboard + mouse, not touch, not console
    return UserInputService.KeyboardEnabled 
        and UserInputService.MouseEnabled
        and not IsMobile()
        and not IsConsole()
end

local function IsVR()
    -- VR headsets (rare but possible)
    return UserInputService.VREnabled
end

-- Determine final platform
local platform = "Unknown"
if IsVR() then
    platform = "VR"
elseif IsConsole() then
    platform = "Console (Xbox/PS)"
elseif IsMobile() then
    platform = "Mobile (Phone/Tablet)"
else
    platform = "PC / Laptop"
end

-- Optional: Show platform once (remove if you don't want any feedback)
print("[Vanish Loader] Detected platform: " .. platform)

-- ──────────────────────────────────────────────
--  YOUR SCRIPTS GO HERE
-- ──────────────────────────────────────────────

local function pc_script()
    -- ┌───────────────────────────────────────┐
    -- │        PUT YOUR PC VERSION HERE       │
    -- └───────────────────────────────────────┘
    
    print("Running PC version of the script!")
    
    -- Example PC-only feature (bigger UI, more complex ESP, etc.)
    -- loadstring(game:HttpGet("your-pc-script-url"))()
    
    -- Your real code here...
end

local function mobile_script()
    -- ┌───────────────────────────────────────┐
    -- │      PUT YOUR MOBILE VERSION HERE     │
    -- └───────────────────────────────────────┘
    
    print("Running Mobile version of the script!")
    
    -- Example mobile-friendly (smaller UI, touch controls, optimized)
    -- loadstring(game:HttpGet("your-mobile-script-url"))()
    
    -- Your real code here...
end

-- ──────────────────────────────────────────────
--  EXECUTE THE CORRECT SCRIPT
-- ──────────────────────────────────────────────

if platform:find("Mobile") or platform == "VR" then
    mobile_script()
else
    pc_script()
end

-- Optional: one-time notification (uncomment if you want)
-- game:GetService("StarterGui"):SetCore("SendNotification", {
--     Title = "Vanish Loader",
--     Text = "Loaded " .. platform .. " version",
--     Duration = 5
-- })
