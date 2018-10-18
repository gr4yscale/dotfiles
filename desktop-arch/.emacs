

;;;

;; remove config-general-mode, kivy, ivy, counsel, counsel-rg. helm-rg?

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

;; globally ensure that all packages refered by use-packaged are installed if not already installed
;; https://github.com/jwiegley/use-package/blob/master/README.md#package-installation
(setq use-package-always-ensure t)


;; org-agenda
;;(use-package org-agenda)

;; ------
;; config
;; ------

;; UTF-8 as default encoding
(set-language-environment "UTF-8")


;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)


(use-package atom-one-dark-theme)

(add-to-list 'custom-theme-load-path "~/.emacs.d/theme-atom-one-dark")
(load-theme 'atom-one-dark t)

(add-to-list 'default-frame-alist
	                            '(font . "Monaco 8"))

;; gui options that dont matter for terminal usage
;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq visible-bell t)
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq custom-safe-themes t) 


;; line wrapping
(global-visual-line-mode 1)

;; make yes or no prompts shorter
(defalias 'yes-or-no-p 'y-or-n-p)

;; don't litter directories with backup files:
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; modes (TOFIX clean this up)
(transient-mark-mode 1)					 ;; Enable transient mark mode
;; (org-indent-mode 1)



;; org
(setq org-cycle-separator-lines 1) 


(setq org-tags-column -80)

;; org paths

(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/notes.org")
(setq org-agenda-files '("~/org/chores-life.org" "~/org/projects.org" "~/org/study.org" "~/org/social.org" "~/org/errands.org" "~/org/chores-digital.org"))
(setq org-journal-dir "~/org/journal/")

;; todo, in progress, waiting | done, canceled
;; in progress | canceled, done
(setq org-todo-keywords
      '((sequence "★" "⚡" "|" "⛔" "✓")))

;;      '((sequence "❗" "⚡" "|" "⛔" "✓")))
;;      '((sequence "❗" "⚡" "|" "⛔" "✓")))
;;(setq org-todo-keywords
;;      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))



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



;; refile targets
(setq org-refile-targets '((nil :maxlevel . 3)
                                (org-agenda-files :maxlevel . 3)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling


;; agenda customization
(setq org-agenda-skip-scheduled-if-done t)


(setq org-agenda-span 9
      org-agenda-start-on-weekday nil
      org-agenda-start-day "-2d")


;; TOFIX: next one not in use
;;(defun pop-to-org-agenda (split)
;;  "Visit the org agenda, in the current window or a SPLIT."
;;  (interactive "P")
;;  (org-agenda-list)
;;  (when (not split)
;;    (delete-other-windows)))

(setq org-agenda-prefix-format '(
  ;; (agenda  . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
  ;; (agenda  . "  • ")
  (agenda  . "  ")
  (timeline  . "  % s")
  (todo  . " %i %-12:c")
  (tags  . " %i %-12:c")))

;  (search . " %i %-12:c")))

(setq org-agenda-custom-commands
      '(("w" "weekday"
         ((tags-todo "study")
          (tags-todo "life")
          (tags-todo "social")
          (tags-todo "digital")
          (tags-todo "errand")
          (tags-todo "project")))))








(defun org-task-capture ()
  "Capture a task with my default template."
  (interactive)
  (org-capture nil "a"))



;; hide stars
(setq org-hide-leading-stars t)







;; org bullets
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("•")))


;; hack
;; ensure tab key works in org when in normal mode using evil
(setq evil-want-C-i-jump nil)


;; evil
(use-package evil
  :config
  (evil-mode 1))


;; evil-leader
(use-package evil-leader)


;; evil-org
(use-package evil-org
  :config
(evil-org-mode 1)
;; fix TAB key interference between org and evil-mode
;;(define-key org-mode-map (kbd "<tab>") 'org-cycle)
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
)

;; workgroups2 (workspaces)
(use-package workgroups2
  :config
  (setq wg-session-load-on-start t)
  ;; Change prefix key (before activating WG)
  (setq wg-prefix-key (kbd "C-c z"))
  ;; Change workgroups session file
  (setq wg-session-file "~/.emacs.d/.workgroups")
  ;; What to do on Emacs exit / workgroups-mode exit?
  (setq wg-emacs-exit-save-behavior           'ask)      ; Options: 'save 'ask nil
  (setq wg-workgroups-mode-exit-save-behavior 'ask)      ; Options: 'save 'ask nil
  (workgroups-mode 1))


;; switch-window (visual window switching)
(use-package switch-window)


;; helm
(use-package helm
  :init
  (setq helm-M-x-fuzzy-match t
  helm-mode-fuzzy-match t
  helm-buffers-fuzzy-matching t
  helm-recentf-fuzzy-match t
  helm-locate-fuzzy-match t
  helm-semantic-fuzzy-match t
  helm-imenu-fuzzy-match t
  helm-completion-in-region-fuzzy-match t
  helm-candidate-number-list 150
  helm-split-window-in-side-p t
  helm-move-to-line-cycle-in-source t
  helm-echo-input-in-header-line t
  helm-autoresize-max-height 0
  helm-autoresize-min-height 20)
  (require' helm-config)
  :config
  (helm-mode 1))


;; projectile
(use-package projectile
  :init
  :config
  (projectile-mode 1)
  (projectile-global-mode))


(use-package counsel)

;; ox-hugo (exports org -> hugo markdown)
(use-package ox-hugo
  :after ox)


;; Which Key
(use-package which-key
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))


;; Helm
(use-package helm
  :init
  (setq helm-M-x-fuzzy-match t
	helm-mode-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-completion-in-region-fuzzy-match t
	helm-candidate-number-list 80
	helm-split-window-in-side-p t
	helm-move-to-line-cycle-in-source t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 0
	helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;; RipGrep
(use-package helm-rg)


;; Helm Projectile
(use-package helm-projectile
  :init
  (setq helm-projectile-fuzzy-match t)
	;; when project is switched, list files
  (setq projectile-switch-project-action 'projectile-dired
	projectile-project-search-path '("~/org/" "~/txt/")
	projectile-indexing-method 'alien
	projectile-require-project-root nil)
  :config
  (helm-projectile-on))






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









;; Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/chores-life.org" "~/org/projects.org" "~/org/study.org" "~/org/errands.org" "~/org/chores-digital.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )









;; -----------
;; keybindings
;; -----------

;; easier window switching
(global-set-key (kbd "C-x o") 'switch-window)

;; Set your own keyboard shortcuts to reload/save/switch WGs:
;; "s" == "Super" or "Win"-key, "S" == Shift, "C" == Control
(global-set-key (kbd "<pause>")     'wg-reload-session)
(global-set-key (kbd "C-S-<pause>") 'wg-save-session)
(global-set-key (kbd "s-z")         'wg-switch-to-workgroup)
(global-set-key (kbd "s-/")         'wg-switch-to-previous-workgroup)



(global-set-key [f9] 'toggle-maximize-buffer)

(global-set-key [f5] 'revert-all-buffers)

(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-task-capture)

;; helm shortcuts

(global-set-key (kbd "C-x f") 'helm-find)

;;(define-key global-map (kbd "C-c s") 'helm-rg)

;;(define-key evil-ex-map "b " 'helm-mini)                         ;; :b
;;(define-key evil-ex-map "e" 'helm-find-files)                    ;; :e


;; Custom

;; helm-grep-do-git-grep


;; Custom keybinding
(use-package general
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  "/"   '(counsel-rg :which-key "ripgrep") 
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(helm-M-x :which-key "M-x")
  "pf"  '(helm-find-files :which-key "find files")
  ;; Buffers
  "bb"  '(helm-buffers-list :which-key "buffers list")
  ;; Window
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wx"  '(delete-window :which-key "delete window")
  ;; Others
  "at"  '(ansi-term :which-key "open terminal")
))












;; final init

;; open agenda
;; (org-agenda nil "a")


