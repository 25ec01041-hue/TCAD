
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "source" 3 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "drain" 3 (color:rgb 0 0 1 )"##" )
(sdegeo:define-contact-set "gate" 3 (color:rgb 0 1 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "BL.SD.L" "Line" (position 0 0 0) (position 0 0.07 0))
(sdedr:define-refeval-window "BL.SD.R" "Line" (position 0 0.18 0) (position 0 0.25 0))
(sdedr:define-refeval-window "BL.LLD.L" "Line" (position 0 0.05 0) (position 0 0.105 0))
(sdedr:define-refeval-window "BL.LLD.R" "Line" (position 0 0.145 0) (position 0 0.2 0))
(sdedr:define-refeval-window "BL.Well" "Line" (position 0 0.11 0) (position 0 0.145 0))
(sdedr:define-refeval-window "Global_Win" "Rectangle" (position -0.07 0 0) (position 0.5 0.25 0))
(sdedr:define-refeval-window "Upper_Win" "Rectangle" (position -0.07 0 0) (position 0.2 0.25 0))
(sdedr:define-refeval-window "Gate_Win" "Rectangle" (position -0.01 0.095 0) (position 0.01 0.155 0))

;; Restore GUI session parameters:
(sde:set-window-position 370 76)
(sde:set-window-size 840 800)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Liberation Sans" "Normal" 8 124 )
