class BotController extends UDKBot; 
var Actor CurrentGoal; 
var Vector TempDest; 
var float FollowDistance;    
var Actor TempGoal; 
// Path Nodes 
state FollowTarget 
{ 
Begin: 
    // Move Bot to Target 
    if (CurrentGoal != None) 
    { 
        TempGoal = FindPathToward(CurrentGoal); 
        if (ActorReachable(CurrentGoal)) 
        {  
            MoveTo(CurrentGoal.Location, ,FollowDistance);  
        } 
        else if (TempGoal != None) 
        { 
            MoveToward(TempGoal); 
        } 
        else 
        { 
            //give up because the nav mesh failed to find a path 
            `warn("PATCHNODES failed to find a path!"); 
            WorldInfo.Game.Broadcast(self,"PATHNODES failed to find a path!, CurrentGoal = " @ CurrentGoal); 
            MoveTo(Pawn.Location); 
        } 
    } 
    LatentWhatToDoNext(); 
}

auto state Initial 
{ 
Begin: 
    LatentWhatToDoNext(); 
} 

event WhatToDoNext() 
{ 
    DecisionComponent.bTriggered = true; 
} 

protected event ExecuteWhatToDoNext() 
{ 
    if (IsInState('Initial')) 
    { 
        GotoState('FollowTarget', 'Begin'); 
    } 
    else 
    { 
        GotoState('FollowTarget', 'Begin'); 
    } 
}

defaultproperties 
{ 
    CurrentGoal = None; 
    FollowDistance = 700;   
} 