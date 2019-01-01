--------------------------- RANDOM LAND GENERATOR ---------------------------------------------------------------
Author Bryan Dedeurwaerder
Created 12/31/2018

local layerHeight = 4
local minlength = 12
local maxlength = 36
math.randomseed(tick())
local inclineRate = 2

local count = 0
local function makeLandNewPart(size, cframe, container)
	count = count + 1
	local part = Instance.new("Part")
	part.Size = size
	part.CFrame = cframe
	part.Anchored = true
	part.TopSurface = "Smooth"
	part.BottomSurface = "Smooth"
	part.Name = part.Name..count
	part.Color = Color3.fromRGB(52, 142, 64)
	part.Parent = container
	return part	
end

local land = workspace:WaitForChild("Land")
for i, v in pairs (land:GetChildren()) do
	if v.Name == "Origin" then
		-- make base layer
		local layer = 1
		for i = 1, math.floor((v.Size.X)/(2*layerHeight)) do
		local remainingLength = v.Size.Z
		local zOffset = 0
			while remainingLength > maxlength do
				local newSize = Vector3.new(v.Size.X - (math.random(inclineRate)*layerHeight*layer), layerHeight*layer ,math.random(minlength, maxlength))
				local newCFrame = v.CFrame * CFrame.new(math.random((v.Size.X-newSize.X)/(layerHeight*layer))*((-1)^math.random(2))*layerHeight/2,-v.Size.Y/2+((layerHeight*layer)/2),-v.Size.Z/2+((newSize.Z)/2+zOffset)) --
				zOffset = (newSize.Z+zOffset)
				if newSize.X > 1 then
					makeLandNewPart(newSize, newCFrame, land)
				end
				remainingLength = remainingLength - newSize.Z
			end
			local newSize = Vector3.new(v.Size.X - (math.random(inclineRate)*layerHeight*layer),layerHeight*layer,remainingLength)
			local newCFrame = v.CFrame * CFrame.new(math.random((v.Size.X-newSize.X)/(layerHeight*layer))*((-1)^math.random(2))*layerHeight/2,-v.Size.Y/2+((layerHeight*layer)/2),-v.Size.Z/2+((newSize.Z)/2+zOffset))
			if newSize.X > 1 then
				makeLandNewPart(newSize, newCFrame, land)
			end
			layer = layer + 1
		end
	end
end

wait(15)

-- for resetting 
local land = workspace:WaitForChild("Land")
for i, v in pairs (land:GetChildren()) do
	if v.Name ~= "Origin" then
		v:Destroy()
	end
end