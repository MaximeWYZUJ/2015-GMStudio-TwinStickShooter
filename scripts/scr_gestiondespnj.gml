//Argument[0]=spr_pnj

if gamepad_button_check_released(0, gp_face1)
{
    switch(argument[0])
    {
        case spr_MarchandEndaar :
        {
            if action==1
            {
                obj_planete_fenetre.sprite_index=spr_planete_achat //passage à l'onglet d'achat
                
                instance_create(view_xview[0]+592,view_yview[0]+108,obj_vaisseau_fenetre) //ouverture de la fenetre de la soute
                obj_vaisseau_fenetre.transparence=0.7
                instance_create(obj_planete_fenetre.x+60, obj_planete_fenetre.y+154, obj_outil_selection_achat) //création de l'outil de sélection d'achat
                
                
                
                //Création des marchandises de la planète à acheter
                for (i=1; i<=4; i+=1)
                {
                    if i<=2
                    {
                        caisse=instance_create(obj_planete_fenetre.x+60+(86*((i+1) mod 2)) , obj_planete_fenetre.y+154 , obj_drogue) //1ere ligne (2 premières marchandises)
                        caisse.xancrage=192 /*position relative de la fenetre d'achat par rapport à la vue*/ +60+(86*((i+1) mod 2))
                        caisse.yancrage=108 + 154
                    }
                    else
                    {
                        caisse=instance_create(obj_planete_fenetre.x+60+(86*((i+1) mod 2)) , obj_planete_fenetre.y+154+106 , obj_drogue) // 2e ligne
                        caisse.xancrage=192+60+(86*((i+1) mod 2))
                        caisse.yancrage=108+154+106
                    }
                    
                    caisse.image_index=planete.drogue[i]
                }
                    
                scr_destroy(obj_pnj, obj_outil_selection_pnj)
            }
        }
        break;
        
        case spr_leperefurax_pnj :
        {
            if image_index==0
            {
                if !instance_exists(obj_mission0_leperefurax)
                {
                    if gamepad_button_check_released(0, gp_face1)
                    {
                        instance_create(0,0,obj_mission0_leperefurax)
                    }
                }
            }
        }
        break;
    }
}
