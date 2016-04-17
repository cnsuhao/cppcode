class BotController extends UDKBot; 
var Actor CurrentGoal; 
var Vector TempDest; 
var float FollowDistance;    
var Actor TempGoal; 
event bool GeneratePathTo(Actor Goal, optional float WithinDistance, optional bool bAllowPartialPath) 
{ 
    if( NavigationHandle == None ) 
        return FALSE; 
    // Clear cache and constraints (ignore recycling for the moment) 
    NavigationHandle.PathConstraintList = none; 
    NavigationHandle.PathGoalList = none; 
    class'NavMeshPath_Toward'.static.TowardGoal( NavigationHandle, Goal ); 
    class'NavMeshGoal_At'.static.AtActor( NavigationHandle, Goal, WithinDistance, bAllowPartialPath ); 
    return NavigationHandle.FindPath(); 
}

state FollowTarget 
{ 
Begin: 
    WorldInfo.Game.Broadcast(self,"BotController-USING NAVMESH FOR FOLLOWTARGET STATE"); 
    // Move Bot to Target 
    if (CurrentGoal != None) 
    { 
        if(GeneratePathTo(CurrentGoal))
        { 
            NavigationHandle.SetFinalDestination(CurrentGoal.Location);  
            if( NavigationHandle.ActorReachable(CurrentGoal) ) 
            {     // then move directly to the actor  
                MoveTo(CurrentGoal.Location, ,FollowDistance);   
            } 
            else 
            { 
                // move to the first node on the path 
                if( NavigationHandle.GetNextMoveLocation(TempDest, Pawn.GetCollisionRadius()) ) 
                { 
                    // suggest move preparation will return TRUE when the edge's 
                    // logic is getting the bot to the edge point 
                    // FALSE if we should run there ourselves 
                    if (!NavigationHandle.SuggestMovePreparation(TempDest,self)) 
                    { 
                        MoveTo(TempDest); 
                    } 
                }
            }  
        } 
        else 
        { 
            //give up because the nav mesh failed to find a path 
            `warn("FindNavMeshPath failed to find a path!");  
            WorldInfo.Game.Broadcast(self,"FindNavMeshPath failed to find a path!, CurrentGoal = " @ CurrentGoal); 
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