    if fuel>0
    {
        if gamepad_axis_value(0,gp_axislh)!=0 || gamepad_axis_value(0,gp_axislv)!=0
        {
        fuel-=0.02

        if acc<10+vitesse*10
            {
            step_count_acc+=0.2
            acc=(vitesse/10*1.025)^(2*step_count_acc)+(1+poussee)*1.5*step_count_acc //phase d'accélération
            }
            else acc=10+vitesse*10
        
        
        step_count_dec=0
        vitesse_de_pointe=acc
        
        
        //Variation de la vitesse selon la direction et l'angle de vision (image_angle)
        xdir=gamepad_axis_value(0,gp_axislh)
        ydir=gamepad_axis_value(0,gp_axislv)
        
        delta_angle=angle_difference(point_direction(0,0,xdir,ydir), image_angle)
        ralentisseur_angulaire=exp(-0.000045*sqr(delta_angle)/2)
        }
        else {step_count_dec+=1 ; acc=vitesse_de_pointe*exp(-(0.027*sqr(step_count_dec))/2) ; step_count_acc=0} //décélération
    }
    else {step_count_dec+=1 ; acc=vitesse_de_pointe*exp(-(0.027*sqr(step_count_dec))/2) ; step_count_acc=0} //décélération


    if acc<0.2
        acc=0
    if acc>10+(vitesse*10)
        acc=10+(vitesse*10)
        
    if ralentisseur>1 //la variable ralentisseur dépend de rayons tracteurs ou autres champs susceptibles d'affecter la vitesse du joueur (modifiée dans l'obj qui modifie cette vitesse)
        {ralentisseur=1}
    if buffer_ralentisseur<5 //on fait varier la variable de ralentissement selon le nombre de rayons que subit le joueur
    {
        if ralentisseur < 0.6-(buffer_ralentisseur/10)
            {ralentisseur = 0.6-(buffer_ralentisseur/10)}
    }
    else ralentisseur = 0.1
        
    if buffer_ralentisseur==0
        {if ralentisseur<1
            {ralentisseur+=0.05}}

    move_towards_point(x+xdir,y+ydir, 1.6*acc*ralentisseur*ralentisseur_angulaire)

    //===Limites de vitesse===
    if vitesse<0.1
    vitesse=0.1
//    if vitesse>0.9
//    vitesse=0.9
