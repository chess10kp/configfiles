;;; config.el --- DOOMDIR
;;; $DOOMDIR/config.efjwoeijoeifjwoil -*- lexical-binding: t;-*-

(setq doom-leader-key ";"
      doom-localleader-key ";")
(setq doom-theme 'custom-gruvbox)
(define-key doom-leader-map (kbd "t") tab-prefix-map)
(define-key doom-leader-map (kbd "x") ctl-x-map)
(setq doom-font "Iosevka Term:style=Bold")
(setq display-line-numbers-type 'relative)

;; dired
(setq dired-kill-when-opening-new-dired-buffer t)

(setq org-directory "~/projects/notes/org/")
(setq org-agenda-files (quote ("~/projects/notes/todo.org")))
(setq org-agenda-files
      (append '("~/projects/notes/todo.org")
              (directory-files-recursively "~/projects/notes/org/" "\\.org$")
              ))
(setq org-roam-directory "~/projects/notes")

(setq evil-insert-state-cursor 'box)
(setq default-tab-width 8)
(setq select-enable-clipboard nil)
(setq corfu-auto-delay 0.2)
(after! org-download
  (setq org-download-method 'directory)
  (setq org-download-image-dir (concat (file-name-sans-extension (buffer-file-name)) "-img"))
  (setq org-download-image-org-width 600)
  (setq org-download-link-format "[[file:%s]]\n"
        org-download-abbreviate-filename-function #'file-relative-name)
  (setq org-download-link-format-function #'org-download-link-format-function-default))



(use-package! lsp-bridge
  :config
  (setq lsp-bridge-enable-log t)
  (global-lsp-bridge-mode))

;; org
(setq org-todo-keywords '((sequence "TODO(t)" "CONFIG(c)" "NEXT(n)" "STEP(s)" "INFO(f)" "PROGRESS(i)" "CLASS(c)" "PROJ(p)" "LOOP(r)" "WAIT(w)" "EVENT(e)" "HOLD(h)" "EMAIL(m)"  "IDEA(i)" "|""DONE(d)" "KILL(k)" "[X](X)")))
(setq org-time-stamp-custom-formats '( "%H:%M>"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/projects/notes/todo.org" "Todos")
         "* TODO %?\n  %i\n  %a")
        ("r" "refile" entry (file+headline "~/projects/notes/refile.org" "Todos")
         "* TODO %?\n  %i\n  %a TIL: ")
        ("r" "refile" entry (file+headline "~/projects/notes/refile.org" "Todos")
         "* TODO %?\n  %i refile: ")
        ("l" "today I learnt" entry (file+headline "~/projects/notes/today-i-learnt.org" "Todos")
         "* TODO %i TIL: %? ")
        ("c" "Config" entry (file+headline "~/projects/notes/config.org" "Configuration")
         "* CONFIG %i %? ")
        ))
(setq org-superstar-headline-bullets-list '("•" "○"))
(setq org-highlight-latex-and-related nil)
(setq tex-fontify-script t)
(setq org-log-done 'time)
(setq org-clock-idle-time 10)
(add-to-list 'org-modules "org-habit")

(setq split-width-threshold nil)
(setq split-height-threshold 100)

(map! :leader :n "es" #'er/expand-region)
(map! :leader :n "fb" #'ido-switch-buffer)
(map! :leader :n "cc" #'compile)
(map! :leader :n "fk" #'ido-kill-buffer)
(map! :leader :n "nrf" #'org-roam-node-find)
(map! :leader :n "nri" #'org-roam-node-insert)
(map! :leader :n "nro" #'org-roam-node-open)
(map! :leader :n "mt" #'org-todo)
(map! :leader :n "mci" #'org-clock-in)
(map! :leader :n "mco" #'org-clock-out)
(map! :leader :n "mcl" #'org-clock-in-last)
(map! :map 'override "M-x" #'smex)
(map! :leader :n "fr" #'ido-recentf-open)
(map!  :n "g]" 'lsp-bridge-diagnostic-jump-next)
(map!  :n "g[" 'lsp-bridge-diagnostic-jump-prev)
(map! :nv "L" 'evil-end-of-line)
(map! :nv "H" 'evil-beginning-of-line)
(map! :leader :nv "s" 'avy-goto-char-timer )
(map! :leader :map  'override "fP" 'org-capture)
(map! :ni "C-'" 'evil-mc-make-and-goto-next-match)
(keymap-global-set "C-c C-c C-v" #'clipboard-yank)
(keymap-global-set "C-c C-c C-c" #'clipboard-kill-region)


(defun chess/search-wiki (query)
  "Search Wikipedia for QUERY."
  (interactive "sSearch: ")
  (eww (format "https://en.wikipedia.org/w/index.php?search=%s" query)))

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :config (setq copilot-indent-offset-warning-disable t)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(setq lsp-bridge-python-lsp-server "basedpyright")
(setq lsp-bridge-python-multi-lsp-server "basedpyright_ruff")
(setq lsp-bridge-enable-hover-diagnostic t)
(setq acm-menu-length 5)

(setq flycheck-disabled-checkers nil)
(setq evil-collection-setup-minibuffer nil)
(setq avy-timeout-seconds 0.1)

;; ido
(setq smex-save-file "~/.config/emacs/.local/cache/smex-items")
(setq smex-history-length 10)
(setq smex-prompt-string "M-x ")
(require 'ido)
(ido-mode t)
(ido-everywhere 1)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file."
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))
(require 'icomplete)
(icomplete-mode 1)
(use-package! ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))


(defun chess/check-rich ()
  "Check if rich."
  (interactive)
  (progn
    (message "Checking for money...")
                                        ; check if checking-for-money exists
    (when (get-buffer "*checking-for-money*")
      (kill-buffer "*checking-for-money*"))
    (start-process "checking-for-money" "*checking-for-money*" "git" "-C" (expand-file-name "~/projects/repos/Summer2025-Internships") "pull")
    (set-process-sentinel (get-process "checking-for-money")
                          (lambda (_ event)
                            (when (string= "finished\n" event)
                              (with-current-buffer "*checking-for-money*"
                                (goto-char (point-min))
                                (if (re-search-forward "Already up to date" nil t)
                                    (message "Nothing found, keep working hard")
                                  (progn
                                    (message "You should be rich")
                                    (find-file (expand-file-name "~/projects/repos/Summer2025-Internships/README.md"))
                                    (find-file (expand-file-name "~/projects/notes/applications.org"))))))))))


(defun chess/bookman ()
  "Open URL."
  (interactive)
  (let ((url (completing-read "URL: " (split-string (with-temp-buffer
                                                      (insert-file-contents (expand-file-name "~/.bookmarks"))
                                                      (buffer-string))))))
    (progn
      (split-window-right)
      (eww url)
      )))

;; (desktop-save-mode 1)
;;(desktop-read)

(provide 'config)
(setq compilation-scroll-output nil)

;; ;; make the modeline only show the name of the current buffer
;; ;; and nothing else

;; (setq mode-line-format '("%b"))


;; https://stackoverflow.com/questions/3860028/customizing-emacs-gdb

(setq gdb-many-windows nil)

(defun set-gdb-layout(&optional c-buffer)
  (if (not c-buffer)
      (setq c-buffer (window-buffer (selected-window)))) ;; save current buffer

  ;; from http://stackoverflow.com/q/39762833/846686
  (set-window-dedicated-p (selected-window) nil) ;; unset dedicate state if needed
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows) ;; clean all

  (let* (
         (w-source (selected-window)) ;; left top
         (w-gdb (split-window w-source nil 'right)) ;; right bottom
         (w-locals (split-window w-gdb nil 'above)) ;; right middle bottom
         (w-stack (split-window w-locals nil 'above)) ;; right middle top
         (w-breakpoints (split-window w-stack nil 'above)) ;; right top
         (w-io (split-window w-source (floor(* 0.9 (window-body-height)))
                             'below)) ;; left bottom
         )
    (set-window-buffer w-io (gdb-get-buffer-create 'gdb-inferior-io))
    (set-window-dedicated-p w-io t)
    (set-window-buffer w-breakpoints (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    (set-window-dedicated-p w-breakpoints t)
    (set-window-buffer w-locals (gdb-get-buffer-create 'gdb-locals-buffer))
    (set-window-dedicated-p w-locals t)
    (set-window-buffer w-stack (gdb-get-buffer-create 'gdb-stack-buffer))
    (set-window-dedicated-p w-stack t)

    (set-window-buffer w-gdb gud-comint-buffer)

    (select-window w-source)
    (set-window-buffer w-source c-buffer)
    ))
(defadvice gdb (around args activate)
  "Change the way to gdb works."
  (setq global-config-editing (current-window-configuration)) ;; to restore: (set-window-configuration c-editing)
  (let (
        (c-buffer (window-buffer (selected-window))) ;; save current buffer
        )
    ad-do-it
    (set-gdb-layout c-buffer))
  )
(defadvice gdb-reset (around args activate)
  "Change the way to gdb exit."
  ad-do-it
  (set-window-configuration global-config-editing))

(add-hook 'after-init-hook 'org-agenda-list)
;;; config.el ends here

(add-hook 'org-mode-hook
          (lambda ()
            (setq-local yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))



(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))
