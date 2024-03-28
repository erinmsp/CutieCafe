--!SerializeField
local animator : Animator = nil

--!SerializeField
local timeBetweenBobs : number = nil

local remainingTime : number = 0

self.Update = function()
    
    remainingTime -= Time.deltaTime
    print(remainingTime)

    if(remainingTime <= 0) then
        print("Bob")
        animator:SetTrigger("Bob")
        remainingTime = timeBetweenBobs
    end

end