//argument[0] : endaar_standard
//argument[1] : endaar_intercepteur
//argument[2] : endaar_standardV1
//argument[3] : endaar_standardV2
//argument[4] : endaar_standardV1UP
//argument[5] : endaar_standardV2UP

for(i=0; i<=3; i+=1)
{
    switch(i)
    {
        case 0 : objet=obj_endaar_standard
        break;
        
        case 1 : objet=obj_endaar_intercepteur
        break;
        
        case 2 : objet=obj_endaar_standardV1
        break;
        
        case 3 : objet=obj_endaar_standardV2
        break;
    }
    
    for(k=1; k<=argument[i]; k+=1)
    {
        xoffset=irandom(room_width-600)+300
        yoffset=irandom(room_height-300)+150
        
        while abs(view_xview[0]+(view_wview[0]/2)-xoffset)<view_wview[0] && abs(view_yview[0]+(view_hview[0]/2)-yoffset)<view_hview[0] //test si le vaisseau n'est pas trop proche par rapport au joueur
        {
            xoffset=irandom(room_width-600)+300
            yoffset=irandom(room_height-300)+150
        }
        
        if instance_number(objet)>0 //test si le vaisseau n'est pas trop près d'un autre
        {
            vaisseau_proche=instance_nearest(xoffset, yoffset, obj_ennemy)
            while point_distance(xoffset, yoffset, vaisseau_proche.x, vaisseau_proche.y)<90
            {
                xoffset=irandom(room_width-600)+300
                yoffset=irandom(room_height-300)+150
                
                vaisseau_proche=instance_nearest(xoffset, yoffset, obj_ennemy)
            }
        }
        
        
        instance_create(xoffset, yoffset, objet)
    }
}
