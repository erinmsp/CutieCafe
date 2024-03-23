--!SerializeField
local transform : Transform = nil

--!SerializeField
local cameraTransform : Transform = nil

self.Update = function()
    local toCamera = cameraTransform.position
    toCamera -= transform.position
    toCamera.y = 0
    transform.rotation = Quaternion.LookRotation(toCamera, Vector3.up)
end