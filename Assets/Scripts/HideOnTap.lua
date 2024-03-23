--!SerializeField
local objectToHide : GameObject = nil

self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
    objectToHide:SetActive(false)
end)