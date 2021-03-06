

;; melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))

  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
;;(setq package-enable-at-startup nil)
(package-initialize)

;; add org repo (add before package-initialize)
;;(add-to-list 'package-archives '("org" . (concat proto "://orgmode.org/elpa/")))



;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Enable use-package
(eval-when-compile
  (require 'use-package))


;; ensure tab key works in org when in normal mode using evil
(setq evil-want-C-i-jump nil)

;; Extras
(require 'evil)
(require 'evil-leader)
(require 'evil-org)
(require 'workgroups2)
(require 'switch-window)
(require 'projectile)
(require 'helm)
(require 'helm-config)
;;(setq helm-follow-mode-persistent t)  ;; slowish on tablet
(require 'helm-ag)
(require 'helm-projectile)

;;(require 'rg)
;;(rg-enable-default-bindings (kbd "M-s"))



;; ------
;; config
;; ------


(load-theme 'atom-one-dark t)

;;(add-to-list 'default-frame-alist
;;	                            '(font . "Monaco 10"))

;; gui options that dont matter for terminal usage
;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq visible-bell t)
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq custom-safe-themes t) 


;; don't litter directories with backup files:
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))




;; modes
(evil-mode t)
(evil-org-mode 1)
(transient-mark-mode 1)					 ;; Enable transient mark mode
(org-indent-mode 1)
(helm-mode 1)
(projectile-global-mode)

;;(global-auto-revert-mode 1)


;; easier window switching
(global-set-key (kbd "C-x o") 'switch-window)




;; workgroups2

;;(setq wg-session-load-on-start t)    ; default: (not (daemonp))

;; Change prefix key (before activating WG)
(setq wg-prefix-key (kbd "C-c z"))

;; Change workgroups session file
(setq wg-session-file "~/.emacs.d/.workgroups")

;; What to do on Emacs exit / workgroups-mode exit?
(setq wg-emacs-exit-save-behavior           'ask)      ; Options: 'save 'ask nil
(setq wg-workgroups-mode-exit-save-behavior 'ask)      ; Options: 'save 'ask nil

;; Set your own keyboard shortcuts to reload/save/switch WGs:
;; "s" == "Super" or "Win"-key, "S" == Shift, "C" == Control
(global-set-key (kbd "<pause>")     'wg-reload-session)
(global-set-key (kbd "C-S-<pause>") 'wg-save-session)
(global-set-key (kbd "s-z")         'wg-switch-to-workgroup)
(global-set-key (kbd "s-/")         'wg-switch-to-previous-workgroup)




;; projectile + helm

;; asks for file to open when project is switched
(setq projectile-switch-project-action 'helm-projectile-find-file)

;; turns on helm bindings for projectile
(helm-projectile-on)


;; url browsing with termux
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "termux-open-url")

;; org

(setq org-cycle-separator-lines 1)

;; org paths

(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/notes.org")
(setq org-agenda-files '("~/org/agendas"))
(setq org-journal-dir "~/org/journal/")

;; todo, in progress, waiting | done, canceled
;; in progress | canceled, done
(setq org-todo-keywords
      '((sequence "⚡" "|" "⛔" "✓")))

;;(setq org-todo-keywords
;;      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))


;; tell org about my custom "icebox" drawer (DEPRECATED with ORG 8.3)
;; for keeping potential tasks around that i may want to work on, just hidden
;;(add-to-list 'org-drawers "ICEBOX")

;; (setq org-log-done t)
(setq org-log-done (quote time))

(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))

(setq org-journal-file-format "%Y-%m-%d.org")

(defvar org-journal-date-format "%A %d-%m-%Y"
  "Date format string for journal headings.")


;; org capture templates
(setq org-capture-templates
      '(("a" "My TODO task format." entry
         (file "index.org")
         "* TODO %?
SCHEDULED: %t")))


;; org fxns
;; TOFIX: next one not in use
(defun pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))


(defun org-task-capture ()
  "Capture a task with my default template."
  (interactive)
  (org-capture nil "a"))


;; org bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("•")))

;; hide stars
(setq org-hide-leading-stars t)





;; custom functions

(defun revert-all-buffers ()
  "Iterate through the list of buffers and revert them, e.g. after a
  new branch has been checked out."
  (interactive)
  (when (yes-or-no-p "Are you sure - any changes in open buffers will be lost! ")
    (let ((frm1 (selected-frame)))
      (make-frame)
      (let ((frm2 (next-frame frm1)))
	(select-frame frm2)
	(make-frame-invisible)
	(dolist (x (buffer-list))
	  (let ((test-buffer (buffer-name x)))
	    (when (not (string-match "\*" test-buffer))
	      (when (not (file-exists-p (buffer-file-name x)))
		(select-frame frm1)
		(when (yes-or-no-p (concat "File no longer exists (" (buffer-name x) "). Close buffer? "))
		  (kill-buffer (buffer-name x)))
		(select-frame frm2))
	      (when (file-exists-p (buffer-file-name x))
		(switch-to-buffer (buffer-name x))
		(revert-buffer t t t)))))
	(select-frame frm1)
	(delete-frame frm2)))))





(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
    (jump-to-register '_) 
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))





;; -----------
;; keybindings
;; -----------


;; (define-key global-map (kbd "C-c t a") 'pop-to-org-agenda)

(global-set-key [f9] 'toggle-maximize-buffer)

(global-set-key [f5] 'revert-all-buffers)

(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-task-capture)

;; fix TAB key interference between org and evil-mode
;;(define-key org-mode-map (kbd "<tab>") 'org-cycle)
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

;; helm shortcuts

(global-set-key (kbd "C-x f") 'helm-projectile-ag)

;;(define-key global-map (kbd "C-c s") 'helm-rg)

;;(define-key evil-ex-map "b " 'helm-mini)                         ;; :b
;;(define-key evil-ex-map "e" 'helm-find-files)                    ;; :e


;; Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/index.org")))
 '(package-selected-packages
   (quote
    (spacemacs-theme org 0blayout helm-projectile helm projectile atom-one-dark-theme darcula-theme workgroups2 org-bullets use-package evil-org)))
 '(safe-local-variable-values
   (quote
    ((org-list-description-max-indent . 5)
     (org-adapt-indentation)
     (org-edit-src-content-indentation . 0)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )






;; final init

(find-file "~/org/index.org")

;; open agenda
;; (org-agenda nil "a")







(workgroups-mode 1)
