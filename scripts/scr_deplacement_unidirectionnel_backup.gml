    if fuel>0
    {
        if gamepad_axis_value(0,gp_axislh)!=0 || gamepad_axis_value(0,gp_axislv)!=0
        {
        fuel-=0.02

        if acc<1 
        {acc+=1} //il faut que acc soit supérieur à 1 pour que l'accélération se fasse sentir (sinon acc est proche de 0 et l'acc prend trop de temps)
        else if acc<10+vitesse*10 {acc=acc*1.2*(1+vitesse)} //on multiplie l'acc par 1.2 et par la vitesse de l'appareil (variable selon les upgrades)
        
        xdir=gamepad_axis_value(0,gp_axislh)
        ydir=gamepad_axis_value(0,gp_axislv)
        }
        else {acc=acc*0.9*(1-vitesse/5)} //décélération
    }
    else {acc=acc*0.9*(1-vitesse/5)} //décélération


    if acc<0.2
        acc=0
    if acc>10+(vitesse*10)/2
        acc=10+(vitesse*10)/2
        
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

    move_towards_point(x+xdir,y+ydir,acc*ralentisseur)

    //===Limites de vitesse===
    if vitesse<0.1
    vitesse=0.1
    if vitesse>0.9
    vitesse=0.9
