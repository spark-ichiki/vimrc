##  Vimパッケージ管理
vim 8.0になるまでは、NeoBundleを使用し、それ以降はdein.vimに移行する予定


####  NeoBundleの手順
```
[...]$ mkdir -p ~/.vim/bundle
[...]$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
[...]$ mkdir ~/.vim/tmp
[...]$ chmod 777 ~/.vim/tmp
```

その後、この管理されているvimrcファイルをハードリンクする。
```
[...]$ cd vimrc
[...]$ ln vimrc /home/<user>/.vimrc
```
もし、Perlだったら、CPANでPerltidyを入れて、vimで設定すると、整形できる。
```
[...]$ cpanm Perl::Tidy
```
その後、.perltidyrcファイルを設定
```
-l=78   # Max line width is 78 cols
-i=4    # Indent level is 4 cols
-ci=4   # Continuation indent is 4 cols
#-st     # Output to STDOUT
-se     # Errors to STDERR
-vt=2   # Maximal vertical tightness
-cti=0  # No extra indentation for closing brackets
-pt=1   # Medium parenthesis tightness
-bt=1   # Medium brace tightness
-sbt=1  # Medium square brace tightness
-bbt=1  # Medium block brace tightness
-nsfs   # No space before semicolons
-nolq   # Don't outdent long quoted strings
-wbb="% + - * / x != == >= <= =~ !~ < > | & >= < = **= += *= &= <<= &&= -= /= |= >>= ||= .= %= ^= x="
        # Break before all operators
```
