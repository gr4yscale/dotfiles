

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



;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Enable use-package
(eval-when-compile
  (require 'use-package))

;; Extras
(require 'evil)
(require 'evil-leader)
(require 'evil-org)
(require 'helm)
(require 'ox-md)
;;(require 'helm-config)
;;(require 'org)
;;(require 'projectile)

;; inline config, hmmm
(eval-after-load "org"
  '(require 'ox-md nil t))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("•")))

  
;; ------
;; config
;; ------




(add-to-list 'custom-theme-load-path "~/.emacs.d/theme-atom-one-dark")
(load-theme 'atom-one-dark t)

(add-to-list 'default-frame-alist
	                            '(font . "Monaco 12"))



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

;; modes
(evil-mode t)
(helm-mode 1)
(evil-org-mode 1)
(transient-mark-mode 1)					 ;; Enable transient mark mode


;; org

;; org paths

(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file "~/Dropbox/org/notes.org")
(setq org-agenda-files '("~/Dropbox/org/agendas"))
(setq org-journal-dir "~/Dropbox/org/journal/")


(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

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

;; MobileOrg config

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; org - more config
;; hide stars
(setq org-hide-leading-stars t)



;; -----------
;; keybindings
;; -----------


;; (define-key global-map (kbd "C-c t a") 'pop-to-org-agenda)

(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-task-capture)

;; helm shortcuts
(define-key evil-ex-map "b " 'helm-mini)                         ;; :b
(define-key evil-ex-map "e" 'helm-find-files)                    ;; :e




;; Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/index.org")))
 '(package-selected-packages
   (quote
    (org-bullets use-package helm-anything geben-helm-projectile evil-visual-mark-mode evil-org evil-leader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; final init

(find-file "~/index.org")

;; open agenda
;; (org-agenda nil "a")


