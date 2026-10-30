" RocqIDE-style lexical highlighting for Gallina and Ltac.
" Loaded only in Rocq/Coq source buffers by lua/rocqide/init.lua.
if exists('b:current_syntax')
  finish
endif
syntax case match
syntax iskeyword @,48-57,192-255,_,'

" Declare first, so names are recognized only immediately after declarations.
syntax match RocqIDEName contained /[[:alpha:]_][[:alnum:]_']*/
syntax match RocqIDENameList contained /[[:alpha:]_][[:alnum:]_']*/ nextgroup=RocqIDENameList skipwhite skipnl
syntax keyword RocqIDEDeclaration Definition Let Fixpoint CoFixpoint Function Inductive CoInductive Variant Record Structure Class Instance Theorem Lemma Fact Remark Corollary Proposition Property Example Ltac Ltac2 nextgroup=RocqIDEName skipwhite skipnl
syntax keyword RocqIDEDeclaration Variable Variables Hypothesis Hypotheses Axiom Axioms Parameter Parameters Conjecture Conjectures Symbol Symbols nextgroup=RocqIDENameList skipwhite skipnl

syntax keyword RocqIDECommand Section Module End nextgroup=RocqIDEName skipwhite skipnl
syntax match RocqIDECommandDot contained /\./
syntax keyword RocqIDECommand Proof Qed Defined Admitted Abort nextgroup=RocqIDECommandDot skipwhite skipnl
syntax keyword RocqIDECommand Save Goal
syntax keyword RocqIDECommand Local Global Polymorphic Monomorphic Program Obligation Obligations Next Final
syntax keyword RocqIDECommand Notation Infix Reserved Tactic Delimit Bind Open Close Scope
syntax keyword RocqIDECommand Require Import Export From Include
syntax keyword RocqIDECommand Hint Resolve Immediate Constructors Unfold Extern Create HintDb
syntax keyword RocqIDECommand Check Compute Eval Print About Search SearchPattern SearchRewrite Locate
syntax keyword RocqIDECommand Set Unset Add Remove Reset Back Undo Restart Focus Unfocus
syntax keyword RocqIDECommand Arguments Implicit Generalizable Canonical Coercion Identity Existing
syntax keyword RocqIDECommand Opaque Transparent Strategy Scheme Combined Universe Universes Constraint Constraints
syntax keyword RocqIDECommand Extraction Extract Recursive Separate Fail Succeed Timeout Time Redirect

" These lowercase words are green in the screenshots; ordinary tactics are black.
syntax keyword RocqIDEKeyword forall exists exists2 fun fix cofix let in if then else match with end as return for struct where

" Operators stay black, including :=, ->, =>, and Ltac goal patterns.
syntax match RocqIDEOperator /[:=<>|&+*\/\\~!?@{}\[\];,.%-]/

" Declare Scope is black in the supplied notation screenshot.
syntax match RocqIDEPlainCommand /\<Declare\_s\+Scope\>/

" Regions come last to keep command words inside strings/comments uncolored.
syntax region RocqIDEString start=+"+ skip=+""+ end=+"+
syntax region RocqIDEComment start=+(\*+ end=+\*)+ contains=RocqIDEComment,RocqIDEString,@Spell

" Default links keep this syntax readable while another theme is active.
highlight default link RocqIDEDeclaration Statement
highlight default link RocqIDECommand PreProc
highlight default link RocqIDECommandDot RocqIDECommand
highlight default link RocqIDEName Identifier
highlight default link RocqIDENameList RocqIDEName
highlight default link RocqIDEKeyword Keyword
highlight default link RocqIDEOperator Normal
highlight default link RocqIDEPlainCommand Normal
highlight default link RocqIDEString String
highlight default link RocqIDEComment Comment
syntax sync minlines=100
let b:current_syntax = 'rocqide'
