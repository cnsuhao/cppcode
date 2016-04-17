class ExampleCh52PC extends SimplePC; 
var Controller FollowBot; 
Var Pawn FollowPawn; 
var bool BotSpawned; 
var Actor BotTarget; 
function SpawnBot(Vector SpawnLocation) 
{ 
    SpawnLocation.z = SpawnLocation.z + 500; 
    FollowBot = Spawn(class'BotController',,,SpawnLocation);  
    FollowPawn = Spawn(class'BotPawn',,,SpawnLocation); 
    FollowBot.Possess(FollowPawn,false); 
    BotController(FollowBot).CurrentGoal = Pawn; 
    BotPawn(Followpawn).InitialLocation = SpawnLocation; 
    FollowPawn.SetPhysics(PHYS_Falling); 
    BotSpawned = true; 
} 
function bool SwipeZoneCallback(MobileInputZone Zone, 
float DeltaTime, 
int Handle, 
ETouchType EventType, 
Vector2D TouchLocation) 
{ 
    local bool retval; 
    retval = true; 
    if (EventType == Touch_Began) 
    { 
        WorldInfo.Game.Broadcast(self,"You touched the screen at = " 
        @ TouchLocation.x @ " , " 
        @ TouchLocation.y @ ", Zone Touched = " 
        @ Zone); 
        // Start Firing pawn's weapon 
        StartFire(0); 
    } 
    else if(EventType == Touch_Moved) 
    {  
    }   
    else if (EventType == Touch_Ended) 
    {  
        // Stop Firing Pawn's weapon 
        StopFire(0); 
    }  
    return retval; 
} 
function SetupZones() 
{ 
    Super.SetupZones(); 
    // If we have a game class, configure the zones
    if (MPI != None && WorldInfo.GRI.GameClass != none) 
    { 
        LocalPlayer(Player).ViewportClient.GetViewportSize(ViewportSize); 
        if (FreeLookZone != none) 
        { 
            FreeLookZone.OnProcessInputDelegate = SwipeZoneCallback;  
        }  
    } 
} 
function PlayerTick(float DeltaTime) 
{  
    Super.PlayerTick(DeltaTime);  
    if (!BotSpawned) 
    { 
        SpawnBot(Pawn.Location); 
        BotSpawned = true; 
        JazzPawnDamage(Pawn).InitialLocation = Pawn.Location; 
    } 
} 
defaultproperties 
{ 
    BotSpawned=false 
} 