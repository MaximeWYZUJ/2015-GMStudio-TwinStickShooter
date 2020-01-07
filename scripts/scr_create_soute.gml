if TOTAL_marchandise>0
{
    outil=instance_create(x+542, y+675, obj_outil_selection_soute)
    outil.xancrage=374+542 //374 -> x de obj_vaisseau_fenetre par rapport à la vue
    outil.yancrage=108+675//108 -> y de obj_vaisseau_fenetre par rapport à la vue
    
    for(b=0; b<5; b+=1) //On génère les obj_drogue présents dans la soute lors de la création de l'interface sous forme de tableau (array 2D -> soute[a,b])
    {
        for(a=0; a<7; a+=1)
        {
            caisse=instance_create(x+542+a*75, y+675-b*75, obj_drogue)
            soute[a,b] = caisse
            caisse.xancrage=374+542+a*75
            caisse.yancrage=108+675-b*75
            
            if b*7+a<obj_vaisseau.QTT_drogue[1]
            {caisse.image_index=1}
            
            else if b*7+a<obj_vaisseau.QTT_drogue[1] + obj_vaisseau.QTT_drogue[2]
                {caisse.image_index=2}
                
                else if b*7+a<obj_vaisseau.QTT_drogue[1] + obj_vaisseau.QTT_drogue[2] + obj_vaisseau.QTT_drogue[3]
                    {caisse.image_index=3}
                    
                    else if b*7+a<TOTAL_marchandise
                        {caisse.image_index=4}
                        
                        else caisse.image_index=0
        }
    }
}
