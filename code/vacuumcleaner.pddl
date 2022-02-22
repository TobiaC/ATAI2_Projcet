(define (domain vacuumcleaner)
    
    (:requirements :strips)
    
    (:predicates
        (bathroomcleaned)
        (livingroomcleaned)
        (kitchencleaned)
        (bedroomcleaned)
    )    

    (:action dirty_the_house
        :effect (and 
            (not (bathroomcleaned))
            (not (livingroomcleaned))
            (not (bedroomcleaned))
            (not (kitchencleaned))
        )
    )
    

    (:action clean_bathroom
        :precondition (and 
            (not (bathroomcleaned))
            (not (livingroomcleaned))
            (not (bedroomcleaned))
            (not (kitchencleaned))
        )
        :effect (and 
            (bathroomcleaned)
        )
    )

    (:action clean_bedroom
        :precondition (and 
            (bathroomcleaned)
            (not (livingroomcleaned))
            (not (bedroomcleaned))
            (not (kitchencleaned))
        )
        :effect (and 
            (bedroomcleaned)
        )
    )

    (:action clean_livingroom
        :precondition (and 
            (bedroomcleaned)
            (bathroomcleaned)
            (not (livingroomcleaned))
            (not (kitchencleaned))
        )
        :effect (and 
            (livingroomcleaned)
        )
    )

    (:action clean_kitchen
        :precondition (and 
            (bathroomcleaned)
            (bedroomcleaned)
            (livingroomcleaned)
            (not (kitchencleaned))
        )
        :effect (and 
            (kitchencleaned)
        )
    )
    
    
)