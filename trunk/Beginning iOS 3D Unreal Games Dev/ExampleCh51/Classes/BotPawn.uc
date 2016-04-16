class BotPawn extends SimplePawn; 
var vector InitialLocation; 
defaultproperties 
{ 
    // Jazz Mesh Object 
    Begin Object Class=SkeletalMeshComponent Name=JazzMesh 
        SkeletalMesh=SkeletalMesh'KismetGame_Assets.Anims.SK_Jazz' 
        AnimSets(0)=AnimSet'KismetGame_Assets.Anims.SK_Jazz_Anims' 
        AnimTreeTemplate=AnimTree'KismetGame_Assets.Anims.Jazz_AnimTree' 
        BlockRigidBody=true 
        CollideActors=true 
    End Object 
    Mesh = JazzMesh; 
    Components.Add(JazzMesh); 
    // Collision Component for This actor  
    Begin Object Class=CylinderComponent NAME=CollisionCylinder2 
        CollideActors=true 
        CollisionRadius=+25.000000 
        CollisionHeight=+60.000000 
    End Object 
    CollisionComponent=CollisionCylinder2 
    CylinderComponent=CollisionCylinder2 
    Components.Add(CollisionCylinder2) 
} 