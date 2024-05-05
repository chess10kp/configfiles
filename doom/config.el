;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Nitin Shankar Madhu"
      user-mail-address "nmadhu@umich.edu")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
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

(setq doom-theme 'doom-gruvbox)

(setq doom-font (font-spec :family "Iosevka" :size 20))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)




;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/projects/notes/org/")
(setq org-agenda-files (quote ("~/projects/notes/todo.org")))
(setq org-agenda-files
      (append '("~/projects/notes/todo.org")
              (directory-files-recursively "~/projects/notes/org/" "\\.org$")
              ))
(setq org-roam-directory "~/projects/notes")

(setq display-line-numbers-type 'relative)
(setq org-startup-folded t)

;; Whenever figure a package, make sure to wrap your config in an
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
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how

;; they are implemented.

(setq default-tab-width 8)
(setq x-select-enable-clipboard nil)

(add-hook 'haskell-mode-hook #'hident-mode)

(setq doom-leader-key ";"
      doom-localleader-key ";")

;; copy-paste support

;; org-roam graph view server
(use-package! websocket
    :after org-roam)
(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
        :hook (after-init . org-roam-ui-mode)
        :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; Customize timestamp format
(after! org
  (setq org-time-stamp-custom-formats '( "%H:%M>")))

;; Preview the time on completion
(setq org-log-done 'time)
(set-default 'preview-scale-function 1.0)

(define-key global-map (kbd "C-x a a") 'org-agenda)

(setq
org-superstar-headline-bullets-list '("◆" "•" "✸" "○")
 )
(setq tex-fontify-script t)


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/projects/notes/todo.org" "Todos")
         "* TODO %?\n  %i\n  %a")
        ("j" "journal" entry (file+datetree "~/projects/notes/journal.org")
            "* %U %i ")
        ("r" "refile" entry (file+datetree "~/projects/notes/refile.org")
            "* %U %i ")
         ))


(require 'ido)
(ido-mode t)

(setq vertico-count 10)

(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)


(with-eval-after-load 'org (global-org-modern-mode))

(setq org-agenda-custom-commands
      '(("v" "upgraded view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done)))
                ((org-agenda-overriding-header "#A"))
                )
        (agenda "")
        (alltodo "")
         )))
      )

;; customize doom-gruvbox
(custom-set-faces! '(default  :background "#0e1419"))
(custom-set-faces! '(mode-line :background "#0e1419"))
(custom-set-faces! '(fringe :background "#0e1419"))

(use-package! org
  :config
  (setq org-todo-keywords '((sequence "TODO(t)" "INFO(f)" "PROGRESS(i)" "PROJ(p)" "LOOP(r)" "WAIT(w)" "EVENT(e)" "HOLD(h)" "EMAIL(m)"  "IDEA(i)" "|""DONE(d)" "KILL(k)")))
  )


(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
