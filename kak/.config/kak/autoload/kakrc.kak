# Exit insert mode with alt-c
map global insert <a-c> <esc>

decl int tabstop 2
decl int indentwidth 2

#hook global WinCreate .* %{addhl show_whitespaces}
hook global WinCreate .* %{hook window InsertChar \t %{ exec -draft h@}}

hook global WinCreate .* %{addhl show_matching }

# match brackets with m
#hook global InsertChar \( "exec i)<left><esc>" 
#hook global InsertChar \[ "exec i]<left><esc>" 
#hook global InsertChar \{ "exec i}<left><esc>" 

#hook global InsertChar \( "exec <backspace><esc>i(<esc>a)<esc>Ha" #wrapping selected text  
#hook global InsertChar \[ "exec <backspace><esc>i[<esc>a]<esc>Ha" #wrapping selected text  
#hook global InsertChar \{ "exec <backspace><esc>i{<esc>a}<esc>Ha" #wrapping selected text  

hook global InsertChar \( "exec )<left>" 
hook global InsertChar \[ "exec ]<left>" 
hook global InsertChar \{ "exec }<left>" 

#coloerscheme base16

## clipboard...
### map to ,y ,p ,P and ,R for copy-pasting through the clipboard
#%sh{
#    if $(which xsel &>/dev/null); then
#        # requires xsel to be installed
#        echo 'map global user y %{<a-|>xsel -b  -i<ret>:echo Information %{yanked to clipboard}<ret>}'
#        echo 'map global user Y %{<a-|>xsel -P  -i<ret>:echo Information %{yanked to clipboard}<ret>}'
#        echo 'map global user p %{<a-!>xsel -b <ret>:echo Information %{pasted from clipboard}<ret>}'
#        echo 'map global user P %{<a-!>xsel -p <ret>:echo Information %{pasted from clipboard}<ret>}'
##        echo 'map global user P %{!xsel -b <ret>:echo Information %{pasted from X clipboard}<ret>}'
#        echo 'map global user r %{:reg w "%sh{xsel -b}"<ret>"wR:echo Information %{replaced from X clipboard }<ret>}'
#        echo 'map global user R %{:reg w "%sh{xsel -p}"<ret>"wR:echo Information %{replaced from X clipboard }<ret>}'
#        #echo 'map global user <a-y> %{<a-|>xsel -b -i<ret>:echo -color Information %{yanked to X clipboard}<ret>}'
#        #echo 'map global user <a-p> %{<a-!>xsel -b<ret>:echo -color Information %{pasted from X clipboard}<ret>}'
#        #echo 'map global user <a-P> %{!xsel -b<ret>:echo -color Information %{pasted from X clipboard}<ret>}'
#        #echo 'map global user <a-R> %{:reg w "%sh{xsel -b}"<ret>"wR:echo -color Information %{replaced from X clipboard }<ret>}'
#    fi
#}

#https://github.com/mawww/kakoune/wiki/Registers---Clipboard
# <a-|> xsel --input --clipboard <ret>
# 
# <a-|> pipes each selection through the given external filter program and ignore its output.
# 
# You may want to use the following hook to automate the dialog with the system clipboard, on each y, d or c operations:
hook global NormalKey y|d|c %{ nop %sh{
  printf %s "$kak_main_reg_dquote" | myClipCopy
}}

# ! xsel --output --clipboard <ret>
# 
# ! inserts program output before selection while <a-!> inserts program output after selection.
# 
# Therefore you can add the following mappings:
# Paste before
map global user P '!myClipPaste<ret>' -docstring 'Insert: Paste from clipboard'
# Paste after
map global user p '<a-!>myClipPaste<ret>' -docstring 'Append: Paste from clipboard'

map global user y '<a-|>myClipCopy<ret>' -docstring 'Copy to clipboard'
map global user Y '<a-|>myClipCopy<ret>' -docstring 'Copy to clipboard'

#hook global InsertChar [^\n] %{exec -draft "Ghs.{0,79}<ret><a-;>bi<ret><esc><space>i<backspace><esc>"}

#map global user q %{<a-i>ps\s*\n\s*<ret>c<space><esc><a-i>ps.{0,80}<ret>bi<ret><esc><space>i<backspace><esc>a<ret><esc>b}
#map global user q %{<a-i>ps[\s\n]+\s*<ret>c<space><esc><a-i>ps.{0,79}[^\s-]*[\s-]\b<ret>i<ret><esc><space>gla<ret><esc><a-i>p<a-;>i<backspace><esc><a-i>pl}
#map global user q %{<a-i>ps[\s\n]+<ret>c<space><esc>Xs.{0,70}[^\s-]*[\s-]<ret>a<ret><esc><space>k<a-i>pl}
#map global user q %{<a-i>ps[\s\n]+<ret>c<space><esc>Xs\S.*\S<ret>"adGHd"aPhXs.{0,70}[^\s-]*[\s-]<ret>a<ret><esc><space>k<a-i>pl}

#rm beg
#map global user q %{<a-i>ps[\s\n]+<ret>c<space><esc>ghi<space><esc>Xs^\s*<ret>dXs.{0,70}[^\s-]*[\s-]<ret>a<ret><esc><space>k<a-i>ps\s*\n<ret>c<ret><esc><space>kgl}
#map global user q %{<a-i>ps\s*\n<ret>c<space><esc>Xs.{0,70}[^\s-]*[\s-]<ret>a<ret><esc><space>k<a-i>ps\s*\n<ret>c<ret><esc><space>kgl}
#

#Selection wrapping
#map global user q %{:autowrap-selection<ret>} -docstring "Autowrap selection"
#map global user q %{s([^\n]{0,70})(?:\b\s*|\n)<ret>a<ret><esc>} -docstring "Autowrap selection"
map global user q %{s([^\n]{0,120})(?:\b\s*|\n)<ret><a-K>[\n]<ret><left>a<ret><esc><a-x>} -docstring "Autowrap selection"

# Remove new lines 
#map global user Q %{s\s*\n<ret>c<space><esc>Xs(?<<>=\S)\s+(?=\S)<ret>c<space><esc><space>gla<ret><esc>kglX} -docstring "Remove newlines"
#map global user Q %{s\n\W*<ret>d} -docstring "Remove newlines"
map global user Q %{<a-s><a-j>} -docstring "Remove newlines"

#Addition and substraction
#map global user a %{<a-a>n|awk '{print $1+1}'<ret>}
map global user i %{<left>/\d<ret><a-a>n|awk '{print $1+1}'<ret>b}  -docstring "Increment next number"
map global user <a-i> %{<right><a-/>\d<ret><a-a>n|awk '{print $1+1}'<ret>b} -docstring "Increment previous number"
#map global user a %{<a-a>n|xargs -I{} dc -e "{} 1+pq"<ret>}
map global user d %{<left>/\d<ret><a-a>n|awk '{print $1-1}'<ret>b}  -docstring "Decrement next number"
map global user <a-d> %{<right><a-/>\d<ret><a-a>n|awk '{print $1-1}'<ret>b}   -docstring "Decrement previous number"
map global user I %{<left>/\d<ret><a-a>n|awk '{print $1}'b} -docstring "Arbitrary math operation with awk"
map global user <a-I> %{<right><a-/>\d<ret><a-a>n|awk '{print $1}'b}  -docstring "Arbitrary math operation with awk"

map global normal '#' :comment-line<ret> -docstring 'comment line'
map global normal '<a-#>' :comment-block<ret> -docstring 'comment block'

#number lines
add-highlighter global/ number-lines
add-highlighter global/ show-whitespaces


# clang...
hook global WinSetOption filetype=(c|cpp) %{ 
  clang-enable-autocomplete; 
  clang-enable-diagnostics # Add autowrap to 72 characters in git-commit
}

