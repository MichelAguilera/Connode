-- INITIALIZE PLUGIN --
local WidgetUI = require(script.Connode.WidgetUI)

-- Create a new toolbar section titled "Custom Script Tools"
local toolbar = plugin:CreateToolbar("Connode Studio")
local showMenu = toolbar:CreateButton("Open Connode", "Open Connode", "rbxassetid://4458901886")
showMenu.ClickableWhenViewportHidden = false

-- Variables
local isOpen = false
local widgetInitialized = false
local _widget = nil

-- Create new "DockWidgetPluginGuiInfo" object
local WidgetInfo = DockWidgetPluginGuiInfo.new(
    Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
	true,   -- Widget will be initially enabled
	false,  -- Don't override the previous enabled state
	200,    -- Default width of the floating window
	300,    -- Default height of the floating window
	150,    -- Minimum width of the floating window
	150     -- Minimum height of the floating window
)

-- Functions
local function createWidget()
    print("Making widget")

    -- Create new widget GUI
    _widget = plugin:CreateDockWidgetPluginGui("ConnodeWidget", WidgetInfo)
    _widget.Title = "Connode Widget"

    WidgetUI.create(_widget)
    widgetInitialized = true
end

local function openWidget()
    print("Opening widget")
    _widget.Enabled = true
end

local function closeWidget()
    print("Closing widget")
    _widget.Enabled = false
end

local function onPluginClick()

    if not widgetInitialized then
        createWidget()
    end

    if isOpen then
        closeWidget()
    else
        openWidget()
    end

    isOpen = not isOpen
end

showMenu.Click:Connect(onPluginClick)