; Modified from carDiagnosis example in tutorial 10

; Asks if you live within walking distance
(defrule walkingDistance
	=>
	(printout t crlf "Discover a new eco friendly way to travel to uni by answering a few simple questions!" crlf crlf
	"Do you live within walking distance? (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (assert (walkingDistance yes))
	) (if (= ?x 0)
		then (assert (walkingDistance no))
	)
)

; Node telling you to walk
(defrule walk (walkingDistance yes)
	=>
	(printout t crlf "Looks like your best option is to walk" crlf)
)

; Asks if you live within cycling distance
(defrule cyclingDistance (walkingDistance no)
	=>
	(printout t crlf "Do you live within cycling distance? (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (assert (cyclingDistance yes))
	) (if (= ?x 0)
		then (assert (cyclingDistance no))
	)
)

; Asks if you own a bike
(defrule ownBike (cyclingDistance yes)
	=>
	(printout t crlf "Do you own a bicycle? (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Ride your bike" crlf)
	) (if (= ?x 0)
		then (printout t crlf "Buy a bike" crlf)
	)
)

; Asks if you live near bus stop
(defrule nearBus (cyclingDistance no)
	=>
	(printout t crlf "Do you live near a bus stop that goes to uni? (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Take the bus" crlf)
	) (if (= ?x 0)
		then (assert (nearBus no))
	)
)

; Asks if you live near train station
(defrule nearTrain (nearBus no)
	=>
	(printout t crlf "Do you live near a train station? (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Take the train" crlf)
	) (if (= ?x 0)
		then (assert (nearTrain no))
	)
)

; Asks if you live near a ferry
(defrule nearFerry (nearTrain no)
	=>
	(printout t crlf "Do you live near a ferry?  (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (assert (nearFerry yes))
	) (if (= ?x 0)
		then (assert (nearFerry no))
	)
)

; Asks if you get seasick
(defrule seasick (nearFerry yes)
	=>
	(printout t crlf "Do you get seasick?  (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (assert (nearFerry no))
	) (if (= ?x 0)
		then (printout t crlf "Take the ferry" crlf)
	)
)

; Asks if you have friends to carpool
(defrule friendsCarpool (nearFerry no)
	=>
	(printout t crlf "Do you have friends who you can carpool with?  (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (assert (friendsCarpool yes))
	) (if (= ?x 0)
		then (assert (friendsCarpool no))
	)
)

; Asks when your last argument was
(defrule lastArgument (friendsCarpool yes)
	=>
	(printout t crlf "When was your last argument with them? (2-<1 week, 1-Between 1 day and 1 week, 0->1 day)" crlf)
	(bind ?x (read))
	(if (= ?x 2)
		then (printout t crlf "Confidently ask to carpool" crlf)
	) (if (= ?x 1)
		then (printout t crlf "Cautiously ask to carpool" crlf)
	) (if (= ?x 0)
		then (printout t crlf "Beg for forgiveness then ask to carpool" crlf)
	)
)

; Asks if you're really sure you can't walk
(defrule confirmWalk (friendsCarpool no)
	=>
	(printout t crlf "Are you sure you can't just walk? (1-yes, 0-no)" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (printout t crlf "Well looks like you're out of luck" crlf)
	) (if (= ?x 0)
		then (assert (walkingDistance yes))
	)
)