for(i=0; i<argument_count; i+=1)
{
    if instance_number(argument[i])>0
    {
        with(argument[i])
        {
            instance_destroy()
        }
    }
}
