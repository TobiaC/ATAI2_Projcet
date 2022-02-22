(define (domain amazonrackingrobots)
    
    (:requirements :strips)

    
    (:predicates
        (bigbox_at_start)
        (robot_carries_box) ;the robot has the box
        (robot_at_start) ; the robot is ath the start location
        (box_at_start) ; the box is at the start location
        (robot_at_goal) ;the robot is at the goal location
        (box_closed) ; the box is closed
        (robot_charged) ; robot full battery
        (robot_call) ; a robot calls for another robot
        (robots_composed) ; two robots get comoposed
    )    


    ; go to the recharging station
    (:action go2charge
        :effect (and 
            (robot_charged)
        )
    )

    ; a box arrives in the warehouse
    (:action bring_box
        :effect (and 
            (box_at_start)
        )
    )

    
    ; go to the location where the box is situated
    ; can always go to start location
    ; at the start location there will be always a box to pic
    (:action go_to_start
        :precondition (and 
            (robot_charged)
        )
        :effect (and 
            (robot_at_start)
            (not (robot_at_goal))
        )
    )
    

    ; go to the location where to drop the box
    ; can go to the goal location only with if carrying the box
    (:action go_to_goal
        :precondition (and 
            (robot_charged)
            (box_at_start)
            (robot_carries_box)
        )
        :effect (and 
            (not (box_at_start))
            (robot_at_goal)
            (not (robot_at_start))
        )
    )

    
    ; pick the box
    (:action pick_box
        :precondition (and 
            (robot_at_start)
            (robot_charged)
            (box_at_start)
        )
        :effect (and 
            (robot_carries_box)
        )
    )
    

    ; drop the box
    (:action drop_box
        :precondition (and 
            (not (box_at_start))
            (robot_charged)
            (robot_carries_box) 
            (robot_at_goal) 
            (not(robot_at_start)))
        :effect (and 
            (not (robot_carries_box)) 
            (not(robot_charged))
            )
    )
    

    ; open the box for inspection
    (:action openbox
        :precondition (and 
            (robot_charged)
        )
        :effect (and 
            (not (box_closed))
            )
    )
    

    ; close the box
    (:action closebox
        :precondition (and 
            (not (box_closed))
            (robot_charged)
            )
        :effect (and  
            (box_closed)
            (not (robot_charged))
            )
    )

    
    ; a big box arrives in the warehouse    
    (:action bring_bigbox
        :effect (and
            (bigbox_at_start)
            (not (robots_composed))
         )
    )

    
    ; call another robot for help
    (:action call_another_robot
        :precondition (and 
            (robot_charged)
            (bigbox_at_start)
            (not (robots_composed))
        )
        :effect (and 
            (robot_call)
        )
    )
        
    
    ; compose two robots to form a bigger one
    (:action perform_robot_composition
        :precondition (and
            (robot_charged)
            (bigbox_at_start)
            (robot_call)
        )
        :effect (and 
            (robots_composed)
            (not (robot_call))
            )
    )

    
    ; put the bigbox to the goal location
    (:action put_bigbox_to_goal
        :precondition (and 
            (robot_charged)
            (robots_composed)
            (bigbox_at_start)
        )
        :effect (and
            (not (bigbox_at_start))
         )
    )
    

    ; decompose two composed robots
    (:action perform_robot_decomposition
        :precondition (and 
            (robot_charged)
            (not (bigbox_at_start))
            (robots_composed)
            (not (robot_call))
        )
        :effect (and 
            (not (robots_composed))
            (not (robot_charged))
        )
    )    
    
)