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
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ======== General Config ========

(setq doom-localleader-key ",")

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(select-frame-set-input-focus (selected-frame))

(setq doom-theme 'doom-laserwave)

(setq doom-fae-floss-brighter-modeline nil
      doom-fae-floss-brighter-comments nil
      doom-fae-floss-comment-bg nil)


(setq read-process-output-max (* 1024 1024)
       ;; doom-font (font-spec :family "Fira Code" :size 14) which would help you to change the font and size.
       projectile-project-search-path '("~/dev/nu" "~/projects")
       projectile-enable-caching nil)

;; ======== Keybindings ========

(map! :map evil-normal-state-map
      "Q" #'mark-whole-buffer)

(map! :leader
        doom-leader-key                           #'execute-extended-command
        "`"                                       #'+vertico/switch-workspace-buffer
        "TAB"                                     #'other-window
        "'"                                       #'comment-line
        "H"                                       help-map
        "h"                                       #'+tabs:previous-or-goto
        "l"                                       #'+tabs:next-or-goto
        "]"                                       #'+workspace/switch-right
        "["                                       #'+workspace/switch-left)

(map! :leader
        "c '"                                     #'comment-line)

(map! :leader :map evil-normal-state-map
        "b h"                                     #'previous-buffer
        "b l"                                     #'next-buffer
        "b s"                                     #'doom/switch-to-scratch-buffer
        "b S"                                     #'doom/open-scratch-buffer)

(map! :leader :map evil-normal-state-map
        :desc "Display tab bar"           "y TAB" #'+workspace/display
        :desc "Switch workspace"          "y ."   #'+workspace/switch-to
        :desc "Switch to last workspace"  "y `"   #'+workspace/other
        :desc "New workspace"             "y n"   #'+workspace/new
        :desc "New named workspace"       "y N"   #'+workspace/new-named
        :desc "Load workspace from file"  "y l"   #'+workspace/load
        :desc "Save workspace to file"    "y s"   #'+workspace/save
        :desc "Kill session"              "y x"   #'+workspace/kill-session
        :desc "Kill this workspace"       "y d"   #'+workspace/kill
        :desc "Delete saved workspace"    "y D"   #'+workspace/delete
        :desc "Rename workspace"          "y r"   #'+workspace/rename
        :desc "Restore last session"      "y R"   #'+workspace/restore-last-session
        :desc "Next workspace"            "y ]"   #'+workspace/switch-right
        :desc "Previous workspace"        "y ["   #'+workspace/switch-left
        :desc "Switch to 1st workspace"   "y 1"   #'+workspace/switch-to-0
        :desc "Switch to 2nd workspace"   "y 2"   #'+workspace/switch-to-1
        :desc "Switch to 3rd workspace"   "y 3"   #'+workspace/switch-to-2
        :desc "Switch to 4th workspace"   "y 4"   #'+workspace/switch-to-3
        :desc "Switch to 5th workspace"   "y 5"   #'+workspace/switch-to-4
        :desc "Switch to 6th workspace"   "y 6"   #'+workspace/switch-to-5
        :desc "Switch to 7th workspace"   "y 7"   #'+workspace/switch-to-6
        :desc "Switch to 8th workspace"   "y 8"   #'+workspace/switch-to-7
        :desc "Switch to 9th workspace"   "y 9"   #'+workspace/switch-to-8
        :desc "Switch to final workspace" "y 0"   #'+workspace/switch-to-final)

;; ======== Packages config ========

(use-package! lsp-mode
  :commands lsp
  :config
  (setq lsp-semantic-tokens-enable t)
  (add-hook 'lsp-after-apply-edits-hook (lambda (&rest _) (save-buffer)))) ;; save buffers after renaming

(after! treemacs
  (treemacs-follow-mode))

(defun +my-centaur-tabs-buffers ()
  (seq-filter (lambda (b)
                (cond ((eq (current-buffer) b) b)
                      ((doom-temp-buffer-p b) nil)
                      ((doom-unreal-buffer-p b) nil)
                      ((buffer-file-name b) b)
                      ((buffer-live-p b) b)))
              (persp-buffer-list)))


(defun +my-centaur-tabs-groups ()
  (list "Common"))

(after! centaur-tabs
        (setq centaur-tabs-style "bar")
        (setq centaur-tabs-buffer-list-function #'+my-centaur-tabs-buffers)
        (setq centaur-tabs-buffer-groups-function #'+my-centaur-tabs-groups)
        (setq centaur-tabs-set-bar 'under)
        (setq x-underline-at-descent-line t)

        (centaur-tabs-headline-match))

;; (centaur-tabs-change-fonts "Roboto" 160)

;; (add-hook 'clojure-mode-hook #'cider-mode)
