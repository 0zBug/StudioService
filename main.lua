local StudioService = {}

--[[
Documentation:

-- Using the Service --
Put the Service into your script via:
local StudioService = loadstring(game:HttpGet("https://raw.githubusercontent.com/saxophonebug/rblxtst/main/StudioService"))()

-- Functions --
StudioService:New("Workspace") -- Starts the file with an item

StudioService:Extend("Lighting") -- Creates a new item with a different Parent

StudioService:Wrap(1) -- Encloses an Item the amount specified.

StudioService:CreatePart({
	Name = "Part", 
	Color = Color3.fromRGB(255, 255, 255),
	Size = Vector3.new(1, 1, 1), 
	Position = Vector3.new(0, 10, 0),
	Orientation = Vector3.new(0, 45, 0), 
	Anchored = true, 
	CanCollide = true,
	Transparency = 0.5)
}) -- Creates a Part.

StudioService:CreateLocalScript({
	Name = "LocalScript",
	Source = "print('Hello, World!')"
}) -- Creates a LocalScript.

StudioService:CreateScript({
	Name = "Script",
	Source = "print('Hello, World!')"
}) -- Creates a Script.

StudioService:CreateModuleScript({
	Name = "ModuleScript",
	Source = "module = {} return module"
}) -- Creates a ModuleScript.

StudioService:CreateRemoteEvent("Name") -- Creates a RemoteEvent.
	
StudioService:Finish("Name") -- Ends the file and writes it to Workspace.	
]]--

local Start = '<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">'
local Ending = "</Item></roblox>"

function StudioService:New(Parent)
	Start = Start .. '<Item class="' .. Parent .. '" referent="RBX6BA637DD8B9C44D385DF70A48988C0D5">'
end

function StudioService:Extend(Parent)
	Start = Start .. '</Item>\n<Item class="' .. Parent .. '" referent="RBX6BA637DD8B9C44D385DF70A48988C0D5">'
end

function StudioService:Wrap(Amount)
	Start = Start .. ("</Item>\n"):rep(Amount)
end

function StudioService:CreatePart(Properties)
    local Name,Color,Size,Position,Orientation,Anchored,CanCollide,Transparency = Properties.Name,Properties.Color,Properties.Size,Properties.Position,Properties.Orientation,Properties.Anchored,Properties.CanCollide,Properties.Transparency
    Start = Start .. '<Item class="Part" referent="RBX620AF4060A8D4746BB58908C5E089749"><Properties>\n'
    Start = Start ..'<string name="Name">' .. tostring(Name) .. '</string>\n'
    Start = Start..'<bool name="Anchored">'..tostring(Anchored)..'</bool>\n'
    Start = Start..'<CoordinateFrame name="CFrame"><X>'..tostring(Position.X)..'</X><Y>'..tostring(Position.Y)..'</Y><Z>'..tostring(Position.Z)..'</Z></CoordinateFrame>\n'
    Start = Start..'<Vector3 name="size"><X>' ..tostring(Size.X) .. '</X><Y>' .. tostring(Size.Y) ..'</Y><Z>' .. tostring(Size.Z) ..'</Z></Vector3>\n'
    Start = Start..'<Vector3 name="Orientation"><X>' ..tostring(Orientation.X) .. '</X><Y>' ..tostring(Orientation.Y) .. '</Y><Z>' ..tostring(Orientation.Z) .. '</Z></Vector3>\n'
    Start = Start..'<Color3 name="Color"><R>' .. tostring(Color.R) ..'</R><G>' .. tostring(Color.G) .. '</G><B>' ..tostring(Color.B) .. '</B></Color3>\n'
    Start = Start..'<bool name="CanCollide">' ..tostring(CanCollide) ..'</bool>\n'
    Start = Start..'<float name="Transparency">' .. tostring(Transparency) ..'</float>\n'
    Start = Start..'</Properties>\n'
end

function StudioService:CreateLocalScript(Properties)
    local Name,Source = Properties.Name,Properties.Source
    Start = Start .. '<Item class="LocalScript" referent="RBX620AF4060A8D4746BB58908C5E089749"><Properties>\n'
    Start = Start..'<string name="Name">' .. tostring(Name) .. '</string>\n'
    Start = Start..'<ProtectedString name="Source"><![CDATA['..Source..']]></ProtectedString>'
    Start = Start..'</Properties>\n'
end

function StudioService:CreateScript(Properties)
    local Name,Source = Properties.Name,Properties.Source
    Start = Start .. '<Item class="Script" referent="RBX620AF4060A8D4746BB58908C5E089749"><Properties>\n'
    Start = Start..'<string name="Name">' .. tostring(Name) .. '</string>\n'
    Start = Start..'<ProtectedString name="Source"><![CDATA['..Source..']]></ProtectedString>'
    Start = Start..'</Properties>\n'
end

function StudioService:CreateModuleScript(Properties)
    local Name,Source = Properties.Name,Properties.Source
    Start = Start .. '<Item class="ModuleScript" referent="RBX620AF4060A8D4746BB58908C5E089749"><Properties>\n'
    Start = Start..'<string name="Name">' .. tostring(Name) .. '</string>\n'
    Start = Start..'<ProtectedString name="Source"><![CDATA['..Source..']]></ProtectedString>'
    Start = Start..'</Properties>\n'
end

function StudioService:CreateRemoteEvent(Name)
    Start = Start .. '<Item class="RemoteEvent" referent="RBX620AF4060A8D4746BB58908C5E089749"><Properties>\n'
    Start = Start..'<string name="Name">' .. tostring(Name) .. '</string>\n'
    Start = Start..'</Properties>\n'
end

function StudioService:Finish(Name)
    Start = Start..Ending
    writefile(Name..".rbxlx",Start);
end

return StudioService
