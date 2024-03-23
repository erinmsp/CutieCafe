--!SerializeField
local transform : Transform = nil

--!SerializeField
local spinSpeed : number = nil

self.Update = function()
    transform:RotateAround(transform.position, Vector3.up, spinSpeed*Time.deltaTime)
end