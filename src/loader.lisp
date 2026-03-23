;
; This file loads in all the needed files for SHRDLU.
; 
(defpackage shrdlu
  (:use :common-lisp))
(in-package :shrdlu)

; This appears to be the width of the terminal
; No, it's not.  Not sure what it is....
(DEFCONSTANT CHRCT 76)

;; In MacLisp all variables were dynamically scoped by default.
;; Common Lisp defaults to lexical scoping. We must declare all
;; parser/semantic state variables as SPECIAL globally so that
;; functions like SMCL1, SMNG etc. can see variables bound in
;; CLAUSE, NG, VG etc. Without this, the semantic functions see
;; NIL for these variables and fail silently.
;; (This is the CL equivalent of MacLisp's (declare (specials t)))
(proclaim '(special
  ;; Parser state
  C FE H ME NB SM CUT NN N RE REST PARENT LEVEL
  MVB LOCATIONMARKER POSITION-OF-PRT POSITION-OF-PTW
  SUBJ-VB-BACKUP-TYPE1 PTW
  ;; Planner state
  THTREE THALIST THOLIST THVALUE THTIME
  ;; Semantic state
  SMSUB SMOB1 SMOB2 SMOBL SMCOMP RELLIST
  RSS OSS NODE SMN SMNTRACE SMNBREAK SMNBREAKS
  ;; Parser control
  PARSETRACE PARSEBREAK PARSENODE-SEE LABELTRACE LABELBREAK
  LASTLABEL PARSINGS
  ;; System
  NOSTOP NEVERSTOP ANNOYANCE TOPLEVEL-ERRSET? ERT-ERRSET
  ANSWER? DISCOURSE NOMEM DOIT BYPASS-PLANNER
  SH-STANDARD-PRINTOUT SH-PRINT-TIME
  WANT-DISPLAY MAKEINTERN
  ;; I/O
  SENT PUNCT PUNCL BACKREF BACKREF2 LASTREL
  GLOBAL-MESSAGE PLAN PLAN2 SUCCESS
  REMOTE-CMDS-P REMOTE-ACTIONS-P REMOTE-HOST REMOTE-PORT
  CMD-BUFFER RESPONSE-BUFFER
  ;; Misc parser variables used across function boundaries
  START TENSE TIME SENSE-OF-VERB WORD-BEING-INTERPRETED
  LASTEVENT LASTSENT LASTSENTNO ANSNAME
  UNIT WORD1 ALTN NEWWORD ALREADY-BLGING-NEWWRD
  HANDAT HANDAT2 ATABLE DISPLAY-AS
  EVENTLIST LASTSENTNO SENTNO SAVESENT
  LINEL ZOG-USER ZOGUSER *RSET ERRLIST
  ;; Feature switches
  FEATURESWITCHES PAUSESWITCHES CONTROLSWITCHES DISPLAYSWITCHES
))

(load "remote")
(load "fixes")
(load "progmr")
(load "cgram")
(load "syscom")
(load "smutil")
(load "smspec")
(load "smass")
(load "dictio")
(load "morpho")
(load "show")
(load "blockl")
(load "plnr")
(load "setup")
(load "thtrac")
(load "blockp")
(load "data")
(load "newans")
(load "mover")

; Set either (DEBUGMODE) or (USERMODE) here.
(USERMODE)
;(DEBUGMODE)

; For standalone terminal use, disable remote communication.
; The server.js launcher overrides these when running the web UI.
(setq remote-cmds-p nil)
(setq remote-actions-p nil)

; Start the program
(INITIALSTUFF 'UMR-1.0 NIL)

