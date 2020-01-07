switch(config_deplacement)
{
    case "gauche" :
    {
        //=== Visée avec stick droit ===
        if gamepad_axis_value(0,gp_axisrh)!=0 || gamepad_axis_value(0,gp_axisrv)!=0
        {
            image_angle = point_direction(0, 0, gamepad_axis_value(0, gp_axisrh), gamepad_axis_value(0, gp_axisrv)) //rotation du vaisseau avec le stick droit
        }


        //===Attaque===
        if buffer_atk==0
        {if gamepad_button_check(0,gp_shoulderrb)
            {alarm[0]=1 ; buffer_atk=1}}

        if gamepad_button_check_released(0,gp_shoulderrb)
            {buffer_atk=0 ; alarm[0]=-1}
    }
    break;
    
    case "droit" :
    {
        //=== Visée avec stick gauche ===
        if gamepad_axis_value(0,gp_axislh)!=0 || gamepad_axis_value(0,gp_axislv)!=0
        {
            image_angle = point_direction(0, 0, gamepad_axis_value(0, gp_axislh), gamepad_axis_value(0, gp_axislv)) //rotation du vaisseau avec le stick gauche
        }


        //===Attaque===
        if buffer_atk==0
        {if gamepad_button_check(0,gp_shoulderlb)
            {alarm[2]=1 ; buffer_atk=1}}

        if gamepad_button_check_released(0,gp_shoulderlb)
            {buffer_atk=0 ; alarm[2]=-1}
    }
    break;
    
    case "double" :
    {
        //===Visée===
        if gamepad_axis_value(0,gp_axisrh)!=0 || gamepad_axis_value(0,gp_axisrv)!=0
        {
            image_angle = point_direction(0, 0, xdir, ydir) //rotation du vaisseau dans la direction du mouvement
        }


        //===Attaque===
        if buffer_atk==0
        {if gamepad_button_check(0,gp_shoulderrb) && gamepad_button_check(0,gp_shoulderlb)
            {alarm[1]=1 ; buffer_atk=1}}

        if gamepad_button_check_released(0,gp_shoulderrb) || gamepad_button_check_released(0,gp_shoulderlb)
            {buffer_atk=0 ; alarm[1]=-1}
    }
    break;
}



