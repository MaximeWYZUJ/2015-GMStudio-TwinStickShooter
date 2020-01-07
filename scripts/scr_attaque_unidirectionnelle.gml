    //===Visée===
    if gamepad_axis_value(0,gp_axisrh)!=0 || gamepad_axis_value(0,gp_axisrv)!=0
    {
    image_angle = point_direction(0, 0, gamepad_axis_value(0, gp_axisrh), gamepad_axis_value(0, gp_axisrv)) //rotation du vaisseau avec le stick droit
    }


    //===Attaque===
    if buffer_atk==0
    {if gamepad_button_check(0,gp_shoulderrb) && gamepad_button_check(0,gp_shoulderlb)
    {alarm[0]=1 ; buffer_atk=1}}

    if gamepad_button_check_released(0,gp_shoulderrb) || gamepad_button_check_released(0,gp_shoulderlb)
    {buffer_atk=0 ; alarm[0]=-1}
