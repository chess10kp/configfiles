;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)
(setq doom-font (font-spec :family "Iosevka" :size 20))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Ifyou use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-directory "~/projects/notes/org/")
(setq org-agenda-files (quote ("~/projects/notes/todo.org")))
(setq org-agenda-files
      (append '("~/projects/notes/todo.org")
              (directory-files-recursively "~/projects/notes/org/" "\\.org$")
              ))
(setq org-roam-directory "~/projects/notes")
(setq evil-insert-state-cursor 'box)

(setq default-tab-width 8)
(setq x-select-enable-clipboard nil)

(setq doom-leader-key ";"
      doom-localleader-key ";")

(setq corfu-auto-delay 0.2)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see hows
;; they are implemented.

(after! org
  (setq org-time-stamp-custom-formats '( "%H:%M>"))
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "STEP(s)" "INFO(f)" "PROGRESS(i)" "PROJ(p)" "LOOP(r)" "WAIT(w)" "EVENT(e)" "HOLD(h)" "EMAIL(m)"  "IDEA(i)" "|""DONE(d)" "KILL(k)" "[X](X)")))
  )

(after! company-mode
  (setq company-idle-delay 0.01))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/projects/notes/todo.org" "Todos")
         "* TODO %?\n  %i\n  %a")
        ("r" "refile" entry (file+headline "~/projects/notes/refile.org" "Todos")
                "* TODO %?\n  %i\n  %a TIL: ")
        ("r" "refile" entry (file+headline "~/projects/notes/refile.org" "Todos")
                "* TODO %?\n  %i refile: ")
        ("l" "today I learnt" entry (file+headline "~/projects/notes/today-i-learnt.org" "Todos")
                "* TODO %i TIL: %? ")
      ))
(setq
org-superstar-headline-bullets-list '("◆" "•" "✸" "○")
 )
(setq org-highlight-latex-and-related nil)
(setq tex-fontify-script t)


;; ORG
;; show time when completing task
(setq org-log-done 'time)
(set-default 'preview-scale-function 1.0)


(require 'ido)
(ido-everywhere 1)
(ido-mode t)
;; (ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(ido-ubiquitous-mode 1)

(setq split-width-threshold nil)
(setq split-height-threshold 100)

(map!
 :leader
 :n "fb" #'ido-switch-buffer)

(map!
 :leader
 :n "cc" #'compile)

(map!
 :leader
 :n "fk" #'ido-kill-buffer)

(map!
 :leader
 :n "nrf" #'org-roam-node-find)

(map!
 :leader
 :n "nri" #'org-roam-node-insert)

(map!
 :leader
 :n "nro" #'org-roam-node-open)

(map!
 :leader
 :n "mt" #'org-todo)

(keymap-global-set "C-c C-c C-v" #'clipboard-yank)
(keymap-global-set "C-c C-c C-c" #'clipboard-kill-region)

(setq haskell-interactive-popup-errors nil)

;; customize doom-gruvbox
(custom-set-faces! '(default  :background "#0e1419"))
(custom-set-faces! '(mode-line :background "#0e1419"))
(custom-set-faces! '(org-block :background "#0e1419"))
(custom-set-faces! '(fringe :background "#0e1419"))


