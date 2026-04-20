local workspace = game:GetService("Workspace");
local players = game:GetService("Players");

local local_player = players.LocalPlayer;
local camera = workspace.CurrentCamera;

local bullet_handler = require(game:GetService("ReplicatedStorage").ModuleScripts.GunModules.BulletHandler);

function get_closest_target(range: number)
    local closest_part, closest_distance = nil, range;

    for _, player in (players:GetPlayers()) do
        if (player == local_player) then
            continue;
        end
        local character = player.Character;
        if (not character) then
            continue;
        end
        local humanoid = character:FindFirstChild("Humanoid");
        local head = character:FindFirstChild("Head");
        if (not head) or (not humanoid) or (humanoid.Health == 0) then
            continue;
        end
        local screen_position, on_screen = camera:WorldToViewportPoint(head.Position);
        if (not on_screen) then
            continue;
        end
        local distance = (Vector2.new(screen_position.X, screen_position.Y) - camera.ViewportSize / 2).Magnitude;
        if (distance < closest_distance) then
            closest_part = head;
            closest_distance = distance;
        end
    end

    return closest_part;
end

local old = bullet_handler.Fire;
bullet_handler.Fire = function(data)
    local closest = get_closest_target(999);
    if (closest) then
        data.Force = data.Force * 1000;
        data.Direction = (closest.Position - data.Origin).Unit;
    end
    return old(data);
end
