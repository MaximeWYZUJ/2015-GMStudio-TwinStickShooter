//Dash orthogonal vers la droite
if gamepad_button_check(0, gp_shoulderr)
{
    if compteur_dash<20
    {
        compteur_dash+=1
        hspeed=hspeed+dcos(image_angle-90 mod 360)*3.6*exp(-0.05*sqr(compteur_dash)/2)*(dash_propulsion mod 10)*compteur_dash //on peut augmenter la puissance du dash
        vspeed=vspeed-dsin(image_angle-90 mod 360)*3.6*exp(-0.05*sqr(compteur_dash)/2)*(dash_propulsion mod 10)*compteur_dash //avec des mod upgradables (max 9 de puissance)
    }
}


//Dash orthogonal vers la gauche
if gamepad_button_check(0, gp_shoulderl)
{
    if compteur_dash<20
    {
        compteur_dash+=1
        hspeed=hspeed+dcos(image_angle+90 mod 360)*3.6*exp(-0.05*sqr(compteur_dash)/2)*(dash_propulsion mod 10)*compteur_dash
        vspeed=vspeed-dsin(image_angle+90 mod 360)*3.6*exp(-0.05*sqr(compteur_dash)/2)*(dash_propulsion mod 10)*compteur_dash
    }
}

if gamepad_button_check_released(0, gp_shoulderr) || gamepad_button_check_released(0, gp_shoulderl)
{
    compteur_dash=0
}
