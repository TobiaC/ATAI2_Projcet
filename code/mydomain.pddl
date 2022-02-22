(define (domain mydomain)
    
    (:requirements :strips)
    
    (:predicates
        (hasBox) ;the robot has the box
        (isAtStart) ; the robot is ath the start location
        (isAtGoal) ;the robot is at the goal location
    )    

    ; go to the location with the box
    ; can always go to start location
    (:action go2start
        :effect (isAtStart)
    )
    
    ; go to the location where to drop the box
    ; can go to the goal location only with if carrying the box
    (:action go2goal
        :precondition (and 
            (hasBox)
            (isAtStart)
        )
        :effect (and 
            (isAtGoal)
            (hasBox)
            (not (isAtStart))
        )
    )

    ; pick the box
    (:action pick
        :precondition (and 
            (isAtStart)
        )
        :effect (and 
            (hasBox)
            (isAtStart)
        )
    )
    
    ; drop the box
    (:action drop
        :precondition (and (hasBox) (isAtGoal) (not(isAtStart)))
        :effect (and (not (hasBox)) )
    )
    
)