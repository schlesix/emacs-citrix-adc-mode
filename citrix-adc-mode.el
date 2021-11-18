;;; citrix-adc-mode.el --- Major Mode for Citrix ADC configuration files
;;
;; Copyright (C) 2021 Thomas Schlesinger <thomas at thomasschlesinger dot de>
;;
;; This program is not part of Gnu Emacs
;;
;; citrix-adc.el is free software; you can
;; redistribute it and/or modify it under the terms of the GNU General
;; Public License as published by the Free Software Foundation; either
;; version 2 of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

;; Hook
(defvar citrix-adc-mode-hook nil)

;; Creating a keymap
(defvar citrix-adc-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for Citrix ADC major mode")

;; Link to buffer name extension .ctx
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ctx\\'" . citrix-adc-mode))

;; Font locking definitions. 
(defvar citrix-adc-ipadd-face 'citrix-adc-ipadd-face "Face for IP addresses")

(defface citrix-adc-ipadd-face
  '(
    (((type tty) (class color)) (:foreground "red"))
    (((type graphic) (class color)) (:foreground "red"))
    (t (:foreground "lightsteelblue" ))
    )
   "Face for basic router commands")
  
(defvar citrix-adc-interface-face 'citrix-adc-interface-face "Face for Interfaces")

(defface citrix-adc-interface-face
  '(
    (((type tty) (class color)) (:foreground "#010b73"))
    (((type graphic) (class color)) (:foreground "#010b73"))
    (t (:foreground "lightsteelblue" ))
    )
   "Face for basic router commands")


(defvar citrix-adc-vlan-face 'citrix-adc-vlan-face "Face for Interfaces")

(defface citrix-adc-vlan-face
  '(
    (((type tty) (class color)) (:foreground "#3a0173"))
    (((type graphic) (class color)) (:foreground "#3a0173"))
    (t (:foreground "lightsteelblue" ))
    )
  "Face for basic router commands")

(defvar citrix-adc-server-face 'citrix-adc-server-face "Face for Interfaces")
(defface citrix-adc-server-face
  '(
    (((type tty) (class color)) (:foreground "#593100"))
    (((type graphic) (class color)) (:foreground "#593100"))
    (t (:foreground "lightsteelblue" ))
    )
  "Face for basic router commands")

(defvar citrix-adc-service-face 'citrix-adc-service-face "Face for Interfaces")
(defface citrix-adc-service-face
  '(
    (((type tty) (class color)) (:foreground "#945201"))
    (((type graphic) (class color)) (:foreground "#945201"))
    (t (:foreground "lightsteelblue" ))
    )
  "Face for basic router commands")

(defvar citrix-adc-servicegroup-face 'citrix-adc-servicegroup-face "Face for Interfaces")
(defface citrix-adc-servicegroup-face
  '(
    (((type tty) (class color)) (:foreground "#c46d02"))
    (((type graphic) (class color)) (:foreground "#c46d02"))
    (t (:foreground "lightsteelblue" ))
    )
  "Face for basic router commands")

(defvar citrix-adc-monitor-face 'citrix-adc-monitor-face "Face for Interfaces")
(defface citrix-adc-monitor-face
  '(
    (((type tty) (class color)) (:foreground "#6902c4"))
    (((type graphic) (class color)) (:foreground "#6902c4"))
    (t (:foreground "lightsteelblue" ))
    )
  "Face for basic router commands")

(defvar citrix-adc-lb-vserver-face 'citrix-adc-lb-vserver-face "Face for Interfaces")
(defface citrix-adc-lb-vserver-face
  '(
    (((type tty) (class color)) (:foreground "#004d00"))
    (((type graphic) (class color)) (:foreground "#004d00"))
    (t (:foreground "lightsteelblue" ))
    )
  "Face for basic router commands")

(defvar citrix-adc-cs-vserver-face 'citrix-adc-cs-vserver-face "Face for Interfaces")
(defface citrix-adc-cs-vserver-face
  '(
    (((type tty) (class color)) (:foreground "#01594b"))
    (((type graphic) (class color)) (:foreground "#01594b"))
    (t (:foreground "lightsteelblue" ))
    )
  "Face for basic router commands")


(defvar citrix-adc-ssl-face 'citrix-adc-ssl-face "Face for Interfaces")
(defface citrix-adc-ssl-face
  '(
    (((type tty) (class color)) (:foreground "#0215c2"))
    (((type graphic) (class color)) (:foreground "#0215c2"))
    (t (:foreground "lightsteelblue" ))
    )
  "Face for basic router commands")

;; First set of keywords
(defconst citrix-adc-font-lock-keywords-1
  (list
   '("\\<\\(vlan\\s-[0-9]*\\)" . citrix-adc-interface-face)
   '("\\(^add vlan*\\)" . citrix-adc-interface-face)
   '("\\(^set interface*\\)" . citrix-adc-interface-face)
   '("\\(^set channel*\\)" . citrix-adc-interface-face)
   '("\\(^add route*\\)" . citrix-adc-ipadd-face)
   '("\\(^add server*\\)" . citrix-adc-server-face)
   '("\\(^add serviceGroup*\\)" . citrix-adc-service-face)
   '("\\(^add service*\\)" . citrix-adc-service-face)
   '("\\(^add lb monitor*\\)" . citrix-adc-monitor-face)
   '("\\(^set lb monitor*\\)" . citrix-adc-monitor-face)
   '("\\(^add lb vserver*\\)" . citrix-adc-lb-vserver-face)
   '("\\(^set lb vserver*\\)" . citrix-adc-lb-vserver-face)
   '("\\(^bind lb vserver*\\)" . citrix-adc-lb-vserver-face)
   '("\\(^add cs vserver*\\)" . citrix-adc-cs-vserver-face)
   '("\\(^set cs vserver*\\)" . citrix-adc-cs-vserver-face)
   '("\\(^bind cs vserver*\\)" . citrix-adc-cs-vserver-face)
   '("\\(add ssl*\\)" . citrix-adc-ssl-face)
   '("\\(link ssl*\\)" . citrix-adc-ssl-face)
   '("\\(set ssl*\\)" . citrix-adc-ssl-face)
   '("\\(bind ssl*\\)" . citrix-adc-ssl-face)
   '("\\(^interface\\|^channel\\|-ifnum\\)" . citrix-adc-interface-face)
   '("\\(^bind vlan\\)" . citrix-adc-vlan-face)
   '("\\(^bind serviceGroup\\)" . citrix-adc-servicegroup-face)
   '("\\(^bind\\|^enable\\|^set\\)" . font-lock-builtin-face)
   '("\\(vlan\\)" . citrix-adc-vlan-face)
   '("\\(monitorName\\)" . citrix-adc-monitor-face)
   '("\\(monitor\\)" . citrix-adc-monitor-face)
   '("\\(^add\\)" . font-lock-builtin-face)   
   '("\\<\\(server\\)" . citrix-adc-server-face)   
   '("\\<\\(serviceGroup\\)" . citrix-adc-servicegroup-face)   
   '("\\<\\(service\\)" . citrix-adc-service-face)
   '("\\(ssl\\)" . citrix-adc-ssl-face)
   '("\\<\\(L[AO]/[0-9]\\)" . citrix-adc-interface-face)
   '("\\<\\(1/[0-9]\\)" . citrix-adc-interface-face)
   '("\\<\\(10/[0-9]\\)" . citrix-adc-interface-face)


   
   
					; original   
;   '("\\<\\(A\\(CTIVITY\\|PPLICATION\\)\\|DATA\\|END_\\(A\\(CTIVITY\\|PPLICATION\\)\\|DATA\\|MODEL\\|PARTICIPANT\\|T\\(OOL_LIST\\|RANSITION\\)\\|WORKFLOW\\)\\|MODEL\\|PARTICIPANT\\|T\\(OOL_LIST\\|RANSITION\\)\\|WORKFLOW\\)\\>" . font-lock-builtin-face)
   '("\\('\\w*'\\)" . font-lock-variable-name-face))
  "Minimal highlighting expressions for Citrix ADC mode")

;; Second set of Keywords
(defconst citrix-adc-font-lock-keywords-2
  (append citrix-adc-font-lock-keywords-1
		  (list
		   '("\\<\\(AUTHOR\\|C\\(ONDITION\\|REATED\\)\\|DE\\(FAULT_VALUE\\|SCRIPTION\\)\\|EXTENDED_ATTRIBUTE\\|FROM\\|I\\(MPLEMENTATION\\|N_PARAMETERS\\)\\|JOIN\\|NAME\\|O\\(THERWISE\\|UT_PARAMETERS\\)\\|PERFORMER\\|ROUTE\\|S\\(PLIT\\|TATUS\\)\\|T\\(O\\(OLNAME\\)?\\|YPE\\)\\|VENDOR\\|WPDL_VERSION\\)\\>" . font-lock-keyword-face)
	     	   '("\\<\\(TRUE\\|FALSE\\)\\>" . font-lock-constant-face)))
  "Additional Keywords to highlight in WPDL mode")
(defconst citrix-adc-font-lock-keywords-3
  (append citrix-adc-font-lock-keywords-2
		  (list
		   '("\\<\\(A\\(ND\\|PPLICATIONS\\)\\|BOOLEAN\\|HUMAN\\|INTEGER\\|NO\\|OR\\(GANISATIONAL_UNIT\\)?\\|R\\(EFERENCE\\|OLE\\)\\|S\\(TRING\\|YNCHR\\)\\|UNDER_REVISION\\|WORKFLOW\\|XOR\\)\\>" . font-lock-constant-face)))
  "Balls-out highlighting in WPDL mode")

(defconst citrix-adc-font-lock-keywords-4
  (append citrix-adc-font-lock-keywords-3
		  (list
		   '("\\<\\([0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\)\\>" . citrix-adc-ipadd-face)))
  "Balls-out highlighting in WPDL mode")


;; Level of highlighting
(defvar citrix-adc-font-lock-keywords citrix-adc-font-lock-keywords-4
  "Default highlighting expressions for WPDL mode")

;; Indentation
(defun citrix-adc-indent-line ()
  "Indent current line as WPDL code"
  (interactive)
  (beginning-of-line)

(if (bobp)  ; Check for rule 1
    (indent-line-to 0)
  (let ((not-indented t) cur-indent)
        (if (looking-at "^[ \t]*END_") ; Check for rule 2
            (progn
              (save-excursion
                (forward-line -1)
                (setq cur-indent (- (current-indentation) default-tab-width)))
              (if (< cur-indent 0)
                  (setq cur-indent 0)))
(save-excursion 
          (while not-indented
            (forward-line -1)
            (if (looking-at "^[ \t]*END_") ; Check for rule 3
                (progn
                  (setq cur-indent (current-indentation))
                  (setq not-indented nil))
              ; Check for rule 4
              (if (looking-at "^[ \t]*\\(PARTICIPANT\\|MODEL\\|APPLICATION\\|WORKFLOW\\|ACTIVITY\\|DATA\\|TOOL_LIST\\|TRANSITION\\)")
                  (progn
                    (setq cur-indent (+ (current-indentation) default-tab-width))
                    (setq not-indented nil))
                (if (bobp) ; Check for rule 5
                    (setq not-indented nil)))))))
      (if cur-indent
          (indent-line-to cur-indent)
        (indent-line-to 0))))) ; If we didn't see an indentation hint, then allow no indentation

(defvar citrix-adc-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?/ ". 124b" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?\n "> b" st)
    st)
  "Syntax table for citrix-adc-mode")    
(defun citrix-adc-mode ()
  "Major mode for editing Workflow Process Description Language files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table citrix-adc-mode-syntax-table)
  (use-local-map citrix-adc-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(citrix-adc-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'citrix-adc-indent-line)
  (setq major-mode 'citrix-adc-mode)
  (setq mode-name "Citrix-ADC")
  (run-hooks 'citrix-mode-hook))
(provide 'citrix-adc-mode)
