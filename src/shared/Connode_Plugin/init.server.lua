-- INITIALIZE PLUGIN --
local WidgetUI = require(script.Connode.WidgetUI)

-- Create a new toolbar section titled "Custom Script Tools"
local toolbar = plugin:CreateToolbar("Connode Studio")
local showMenu = toolbar:CreateButton("Open Connode", "Open Connode", "rbxassetid://4458901886")
showMenu.ClickableWhenViewportHidden = false

-- Variables
local isOpen = false

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

local _widget = nil

-- Functions
local function createWidget()
    -- Create new widget GUI
    _widget = plugin:CreateDockWidgetPluginGui("ConnodeWidget", WidgetInfo)
    _widget.Title = "Connode Widget"

    WidgetUI.create(_widget)
end

local function destroyWidget()
    _widget:Destroy()
end

local function onPluginClick()
    if isOpen then
        destroyWidget()
    else
        createWidget()
    end

    isOpen = not isOpen
end

showMenu.Click:Connect(onPluginClick)