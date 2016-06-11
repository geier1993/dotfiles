# Exit insert mode with alt-c
map global insert <a-c> <esc>

decl int tabstop 4
decl int indentwidth 4

# Brackets closing
#hook window InsertKey \( 'exec i)<left><esc>'
#hook window InsertChar \{ 'exec i}<left><esc>'
#hook window InsertChar \[ 'exec i]<left><esc>'
#hook buffer InsertChar \" 'exec i"<left><esc>'
#hook buffer InsertChar \' "exec i'<left><esc>"

#colorscheme base16

# clipboard...
## map to ,y ,p ,P and ,R for copy-pasting through the clipboard
%sh{
    if $(which xsel &>/dev/null); then
        # requires xsel to be installed
        echo 'map global user y %{<a-|>xsel -i<ret>:echo -color Information %{yanked to X clipboard}<ret>}'
        echo 'map global user p %{<a-!>xsel<ret>:echo -color Information %{pasted from X clipboard}<ret>}'
        echo 'map global user P %{!xsel<ret>:echo -color Information %{pasted from X clipboard}<ret>}'
        echo 'map global user R %{:reg w "%sh{xsel}"<ret>"wR:echo -color 
Information %{replaced from X clipboard }<ret>}'
        echo 'map global user <a-p> %{<a-!>xsel -b<ret>:echo -color Information %{pasted from X clipboard}<ret>}'
        echo 'map global user <a-P> %{!xsel -b<ret>:echo -color Information %{pasted from X clipboard}<ret>}'
        echo 'map global user <a-R> %{:reg w "%sh{xsel -b}"<ret>"wR:echo -color Information %{replaced from X clipboard }<ret>}'
    fi
}




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
map global user q %{:autowrap-selection<ret>}
# Remove new lines 
map global user Q %{s\s*\n<ret>c<space><esc>Xs(?<<>=\S)\s+(?=\S)<ret>c<space><esc><space>gla<ret><esc>kglX}


#number lines
hook global WinCreate .* %{addhl number_lines}


# clang...
hook global WinSetOption filetype=cpp %{ clang-enable-autocomplete; clang-enable-diagnostics # Add autowrap to 72 characters in git-commit
}


