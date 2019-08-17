;; auto use lsp for rust files
(add-hook 'rust-mode-hook #'lsp)

;; enable backtraces for rust
(setq cargo-process--enable-rust-backtrace t)

;; always company
(global-company-mode)

;; my org todo keywords/states
(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                          (sequence "QUESTION(q/@)" "|" "ANSWERED(a@)")
                          (sequence "WAITING(w@/!)" "|")))

;; disable auto symlink-chasing
(setq find-file-visit-truename nil)
