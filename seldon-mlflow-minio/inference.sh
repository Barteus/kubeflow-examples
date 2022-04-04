#!/bin/bash

#curl  -s http://10.1.100.56:8000/api/v0.1/predictions \
#  -H "Content-Type: application/json" \
#  -d '{"data":{"ndarray":[[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]]}}'


#curl  -s http://10.1.100.56:8000/api/v0.1/predictions \
#  -H "Content-Type: application/json" \
#  -d '{"data":{"ndarray":[[[-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.3860282599925995, -0.19510474801063538, -0.19510474801063538, -0.19510474801063538, 1.179544448852539, 1.3068269491195679, 1.8032280206680298, -0.09327887743711472, 1.688673973083496, 2.821486711502075, 2.719660758972168, 1.192272663116455, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.042365945875644684, 0.034003473818302155, 0.7722410559654236, 1.5359351634979248, 1.7395868301391602, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.4396398067474365, 1.7650433778762817, 2.796030282974243, 2.656019687652588, 2.0577926635742188, 0.39039403200149536, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 0.19947050511837006, 2.605106830596924, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.770573854446411, 0.7595127820968628, 0.6195022463798523, 0.6195022463798523, 0.2885681390762329, 0.07218817621469498, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.19510474801063538, 2.3632702827453613, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.095977306365967, 1.8923256397247314, 2.719660758972168, 2.643291473388672, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 0.5940457582473755, 1.5613915920257568, 0.9377080202102661, 2.796030282974243, 2.796030282974243, 2.185075044631958, -0.2842023968696594, -0.4242129623889923, 0.12310110777616501, 1.5359351634979248, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.2460176944732666, -0.4114847183227539, 1.5359351634979248, 2.796030282974243, 0.72132807970047, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 1.3450117111206055, 2.796030282974243, 1.9941515922546387, -0.3987565040588379, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.2842023968696594, 1.9941515922546387, 2.796030282974243, 0.466763436794281, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 0.021275240927934647, 2.643291473388672, 2.4396398067474365, 1.6123045682907104, 0.9504362344741821, -0.4114847183227539, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 0.6067740321159363, 2.630563259124756, 2.796030282974243, 2.796030282974243, 1.0904468297958374, -0.10600711405277252, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 0.14855757355690002, 1.943238615989685, 2.796030282974243, 2.796030282974243, 1.4850221872329712, -0.0805506482720375, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.2205612063407898, 0.7595127820968628, 2.783302068710327, 2.796030282974243, 1.955966830253601, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 2.7451171875, 2.796030282974243, 2.7451171875, 0.39039403200149536, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 0.16128580272197723, 1.2304575443267822, 1.905053973197937, 2.796030282974243, 2.796030282974243, 2.21053147315979, -0.3987565040588379, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 0.07218817621469498, 1.4595657587051392, 2.4905526638031006, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.757845640182495, 1.8923256397247314, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.11873534321784973, 1.0268056392669678, 2.3887267112731934, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.134162187576294, 0.5685893297195435, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.13146357238292694, 0.41585052013397217, 2.2869009971618652, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.095977306365967, 0.6067740321159363, -0.3987565040588379, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.19510474801063538, 1.7523151636123657, 2.3632702827453613, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.0577926635742188, 0.5940457582473755, -0.30965885519981384, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 0.2758398950099945, 1.7650433778762817, 2.4523680210113525, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.68147611618042, 1.2686423063278198, -0.2842023968696594, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, 1.3068269491195679, 2.796030282974243, 2.796030282974243, 2.796030282974243, 2.274172782897949, 1.2940987348556519, 1.2559140920639038, -0.2205612063407898, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923], [-0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923, -0.4242129623889923]]]}}'

#curl  -s http://10.1.100.56:8000/api/v0.1/predictions \
#  -H "Content-Type: application/json" \
#  -d '{"data":{"tensor":{"shape":[1,28,28],"values": [[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]]}}}'

curl  -s http://10.1.100.27:8000/api/v0.1/predictions \
  -H "Content-Type: application/json" \
  -d '{"data":{"ndarray":[[ 0.4322, -0.5924,  0.5922,  0.7907]]}}'