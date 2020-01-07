//Argument [0] = nombre max de groupes de vaisseaux à créer autour du joueur (auquel on ajoute 2)
//Argument [1] = nombre max de vaisseaux par groupe


for (groupes=0; groupes<2+irandom(argument[0]); groupes+=1)
{
    /*xtarget=global.xvaisseau-1.5*view_wview[0]+irandom(3*view_wview[0])
    ytarget=global.yvaisseau-1.5*view_hview[0]+irandom(3*view_hview[0])
        
    while (abs(global.xvaisseau-xtarget)-400)<view_wview[0] && (abs(global.yvaisseau-ytarget)-300)<view_hview[0]
    {
        xtarget=global.xvaisseau-1.5*view_wview[0]+irandom(3*view_wview[0]) //on définit le point d'origine de l'escouade
        ytarget=global.yvaisseau-1.5*view_hview[0]+irandom(3*view_hview[0]) //on définit le point d'origine de l'escouade
    }*/
    

    angle_deplacement=point_direction(0, 0, obj_vaisseau.xdir, obj_vaisseau.ydir)
    variation_aleatoire=irandom(200)
    xtarget=global.xvaisseau+view_wview[0]*dcos((angle_deplacement-100+variation_aleatoire) mod 360)
    ytarget=global.yvaisseau+view_wview[0]*dsin((angle_deplacement-100+variation_aleatoire) mod 360)
    
    for (vaisseaux=0; vaisseaux<2+irandom(argument[1]); vaisseaux+=1)
    {
        ennemi=irandom(3)
        switch(ennemi)
        {
            case 0 : ennemi=obj_endaar_standard
            break;
            
            case 1 : ennemi=obj_endaar_intercepteur
            break;
            
            case 2 : ennemi=obj_endaar_standardV1
            break;
            
            case 3 : ennemi=obj_endaar_standardV2
            break;
        }
        
        xdestination=xtarget-300+irandom(600);
        ydestination=ytarget-300+irandom(600);
        
        for(i=0; i<10; i+=1)
        {
            if collision_rectangle(xdestination-80, ydestination-80, xdestination+80, ydestination+80, obj_ennemy, true, true)
            {
                xdestination=xtarget-300+irandom(600);
                ydestination=ytarget-300+irandom(600);
            }
            else
            {
                instance_create(xdestination, ydestination, ennemi);
                break;
            }
        }
    }
}
