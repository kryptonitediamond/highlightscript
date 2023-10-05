-- Script by Bard, a large language model from Google AI
-- This script will highlight other users and display their names
-- To use, simply paste it into a Script object in Roblox

local Players = game.Players
local RunService = game.RunService

-- Create a function to highlight a player
function HighlightPlayer(player)
    -- Get the player's HumanoidRootPart
    local humanoidRootPart = player.Character.HumanoidRootPart

    -- Create a new Highlight object
    local highlight = Instance.new("Highlight")

    -- Set the Highlight's Part property to the player's HumanoidRootPart
    highlight.Part = humanoidRootPart

    -- Set the Highlight's Size property to the player's BoundingBoxSize
    highlight.Size = humanoidRootPart.BoundingBoxSize

    -- Set the Highlight's Color property to a color of your choice
    highlight.Color = Color3.new(1, 0, 0)

    -- Add the Highlight to the game
    game.Lighting.Add(highlight)
end

-- Create a function to unhighlight a player
function UnhighlightPlayer(player)
    -- Get the player's Highlight object
    local highlight = player.Character.HumanoidRootPart.Highlight

    -- Remove the Highlight object from the game
    game.Lighting.Remove(highlight)
end

-- Create a function to display a player's name
function DisplayPlayerName(player)
    -- Get the player's HumanoidRootPart
    local humanoidRootPart = player.Character.HumanoidRootPart

    -- Create a new TextLabel object
    local textLabel = Instance.new("TextLabel")

    -- Set the TextLabel's Text property to the player's name
    textLabel.Text = player.Name

    -- Set the TextLabel's Position property to the player's HumanoidRootPart's Position
    textLabel.Position = humanoidRootPart.Position

    -- Set the TextLabel's Size property to a size of your choice
    textLabel.Size = Vector2.new(100, 20)

    -- Set the TextLabel's Font property to a font of your choice
    textLabel.Font = Enum.Font.SourceSansBold

    -- Add the TextLabel to the game
    game.StarterGui.Screen.AddChild(textLabel)
end

-- Unhighlight all players when the script starts
for _, player in pairs(Players:GetPlayers()) do
    UnhighlightPlayer(player)
end

-- Highlight a player when the player is moused over
RunService.RenderStepped:Connect(function()
    local player = game.Players.LocalPlayer

    -- Get the player that the mouse is over
    local mouseOverPlayer = player.Character.HumanoidRootPart:FindPartOnRayWithIgnoreList(player.Character:GetRay(), {player.Character})

    -- If the mouse is over a player, highlight them
    if mouseOverPlayer then
        HighlightPlayer(mouseOverPlayer)

        -- Display the player's name
        DisplayPlayerName(mouseOverPlayer)
    else
        -- Unhighlight all players
        for _, player in pairs(Players:GetPlayers()) do
            UnhighlightPlayer(player)
        end
    end
end)
