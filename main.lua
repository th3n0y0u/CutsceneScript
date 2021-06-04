local TweenService = game:GetService("TweenService")

local camera = game.Workspace.Camera

local cutsceneTime = 12.4

local debounce = false

local tweenInfo = TweenInfo.new(
	cutsceneTime,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

function tween(part1, part2)
	camera.CameraType = Enum.CameraType.Scriptable
	camera.CFrame = part1.CFrame
	
	local tween = TweenService:Create(camera, tweenInfo, {CFrame = part2.CFrame})
	tween:Play()
	
	wait(cutsceneTime)
	
	camera.CameraType = Enum.CameraType.Custom
end

wait(2)

game.Workspace["Cart Ride Section"].ParkourTransition.Touched:Connect(function()
	if debounce == false then 
		debounce = true
		tween(game.Workspace.Test1, game.Workspace.Test2) 
		tween(game.Workspace.Test2, game.Workspace.Test3)
	end
end)

game.Workspace.TowerTransition.Touched:Connect(function()
	if debounce == false then 
		debounce = true
		tween(game.Workspace.Test4, game.Workspace.Test5)
	end
end)