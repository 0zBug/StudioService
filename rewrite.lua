
local Build = {}

local xml
local indent = 0
local Datatypes = {
    Source = {"ProtectedString", function(v)
        return "<![CDATA[" .. v .. "]]>"
    end},
    CFrame = {"CoordinateFrame", function(v)
        return '<X>' .. tostring(v.X) .. '</X><Y>' .. tostring(v.Y) .. '</Y><Z>' .. tostring(v.Z) .. '</Z>'
    end},
    Size = {"Vector3", function(v)
        return '<X>' .. tostring(v.X) .. '</X><Y>' .. tostring(v.Y) .. '</Y><Z>' .. tostring(v.Z) .. '</Z>'
    end},
    Orientation = {"Vector3", function(v)
        return '<X>' .. tostring(v.X) .. '</X><Y>' .. tostring(v.Y) .. '</Y><Z>' .. tostring(v.Z) .. '</Z>'
    end},
    Position = {"Vector3", function(v)
        return '<X>' .. tostring(v.X) .. '</X><Y>' .. tostring(v.Y) .. '</Y><Z>' .. tostring(v.Z) .. '</Z>'
    end},
    Color = {"Color3", function(v)
        return '<R>' .. tostring(v.R) .. '</R><G>' .. tostring(v.G) .. '</G><B>' .. tostring(v.B) .. '</B>'
    end}
}

local function BuildInstance(Instance)
    xml = xml .. string.rep('\t', indent) .. '<Item class="' .. Instance.ClassName .. '" referent="RBX620AF4060A8D4746BB58908C5E089749">\n'
    indent = indent + 1
    xml = xml .. string.rep('\t', indent) .. '<Properties>\n'

    indent = indent + 1
    if Instance.Properties then
        for i,v in next, Instance.Properties do
            if Datatypes[i] then
                xml = xml .. string.rep('\t', indent) ..  '<' .. Datatypes[i][1] .. ' name="' .. i .. '">' .. Datatypes[i][2](v) .. '</' .. Datatypes[i][1] .. '>\n' 
            else
                xml = xml .. string.rep('\t', indent) .. '<' .. type(v) .. ' name="' .. i .. '">' .. tostring(v) .. '</' .. type(v) .. '>\n' 
            end
        end
    end
    indent = indent - 1
    
    xml = xml .. string.rep('\t', indent) .. '</Properties>\n'
    
    if Instance.Children then
        for i,v in next, Instance.Children do
            BuildInstance(v)
        end
    end
    
    indent = indent - 1
    
    xml = xml .. string.rep('\t', indent) .. '</Item>\n'
end

local StudioService = {}

function StudioService:Build(Name)
    xml = '<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">\n'
    
    indent = indent + 1
    for Parent, Children in next, Build do
        xml = xml .. string.rep('\t', indent) .. '<Item class="' .. Parent .. '" referent="RBX6BA637DD8B9C44D385DF70A48988C0D5">\n'
       
        indent = indent + 1
        for i,v in next, Children do
            BuildInstance(v)
        end
        indent = indent - 1
        
        xml = xml .. string.rep('\t', indent) .. '</Item>\n'
    end
    indent = indent - 1
    
    xml = xml .. '</roblox>'
    
    writefile(Name .. ".rbxlx", xml)
    return xml
end

function StudioService.new(ClassName, Parent)
    local Instance = {
        ClassName = ClassName,
        Properties = {},
        Children = {}
    }
    
    setmetatable(Instance.Properties, {
        __index = {
            Children = Instance.Children
        }
    })
    
    local Parent = Parent or "Workspace"
    if type(Parent) == "table" then
        table.insert(Parent.Children, Instance)
    elseif type(Parent) == "userdata" then
        Parent = Parent.Name
        if not Build[Parent] then
            Build[Parent] = {}
        end
        
        table.insert(Build[Parent], Instance)
    else
        if not Build[Parent] then
            Build[Parent] = {}
        end
        
        table.insert(Build[Parent], Instance)
    end
    
    return Instance.Properties
end

return StudioService
