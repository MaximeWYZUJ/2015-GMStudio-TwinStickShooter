D=distance_to_object(obj_vaisseau)


//===Déplacement vers le joueur===
move_towards_point(global.xvaisseau+irandom(delta)-delta/2,global.yvaisseau+irandom(delta)-delta/2,vitesse);


//===Attaque===
if buffer_atk==0 //s'il n'attaque pas
    {
        if D<view_wview[0]/2 //et s'il est à portée de tir
            {alarm[0]=1; buffer_atk=1;} //il lance la procédure de tir (alarm[0])
        else alarm[0]=-1; //mais s'il n'est plus à portée de tir, la procédure s'arrête
    }
    
if obj_mission0_leperefurax.phase==10
{
    if distance_to_object(obj_vaisseau)<view_hview[0]/2
    {
        hspeed=0
        vspeed=0
    }
}


alarm[1]=changement_direction
