//Changement de vitesse selon la variation de la direction
        old_angle=point_direction(0,0,xdir,ydir)
        new_angle=point_direction(0,0,gamepad_axis_value(0,gp_axislh),gamepad_axis_value(0,gp_axislv))
        delta_angle=angle_difference(old_angle, new_angle) //différence entre la direction précédente et la direction actuelle
        
        if abs(delta_angle)>15 //changement de direction
        {
            delta_angle_count=-abs(delta_angle)
            ralentisseur_angulaire=exp(-abs(delta_angle)/40)
        }
        else if ralentisseur_angulaire<1 //ralentissement en ligne droite (pas pendant le changement)
            {
                delta_angle_count+=6
                ralentisseur_angulaire=exp(delta_angle_count/40)
            }
            else {ralentisseur_angulaire=1 ; delta_angle_count=0}
            
            
            //multiplier l'acc par ralentisseur_angulaire dans move_towards(machin)
