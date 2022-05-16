# StudioService
**A simple module to write rbxlx files like instances.**
# Documentation
### new
**Instance.new but for StudioService.**
```html
<Object> StudioService.new(<string> ClassName, <Instance> Parent)
```
### Build
**writes the rbxlx file to workspace.**
```html
<void> StudioService:Build(<string> FileName)
```
# Example
```lua
local Part = StudioService.new("Part", Workspace)
Part.Anchored = true
Part.Color = Color3.new(1, 0, 0)
Part.Size = Vector3.new(1, 1, 1)
Part.Transparency = 0.5
Part.Name = "XML Part"

local Script = StudioService.new("Script", Part)
Script.Source = "print('Hello, World!');"

local StarterPlayerScripts = StudioService.new("StarterPlayerScripts", game.StarterPlayer)

local LocalScript = StudioService.new("LocalScript", StarterPlayerScripts)
LocalScript.Source = "print('Hello, World!');"

StudioService:Build("Place")
```
# Output
  Place.rbxlx
```xml
<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">
    <Item class="Workspace" referent="RBX6BA637DD8B9C44D385DF70A48988C0D5">
        <Item class="Part" referent="RBX620AF4060A8D4746BB58908C5E089749">
            <Properties>
                <number name="Transparency">0.5</number>
                <string name="Name">XML Part</string>
                <Color3 name="Color"><R>1</R><G>0</G><B>0</B></Color3>
                <boolean name="Anchored">true</boolean>
                <Vector3 name="Size"><X>1</X><Y>1</Y><Z>1</Z></Vector3>
            </Properties>
            <Item class="Script" referent="RBX620AF4060A8D4746BB58908C5E089749">
                <Properties>
                    <ProtectedString name="Source"><![CDATA[print('Hello, World!');]]></ProtectedString>
                </Properties>
            </Item>
        </Item>
    </Item>
    <Item class="StarterPlayer" referent="RBX6BA637DD8B9C44D385DF70A48988C0D5">
        <Item class="StarterPlayerScripts" referent="RBX620AF4060A8D4746BB58908C5E089749">
            <Properties>
            </Properties>
            <Item class="LocalScript" referent="RBX620AF4060A8D4746BB58908C5E089749">
                <Properties>
                    <ProtectedString name="Source"><![CDATA[print('Hello, World!');]]></ProtectedString>
                </Properties>
            </Item>
        </Item>
    </Item>
</roblox>
```
