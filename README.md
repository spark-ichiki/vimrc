##  Vimパッケージ管理
vim 8.0になるまでは、NeoBundleを使用し、それ以降はdein.vimに移行する予定


####  NeoBundleの手順
```
[...]$ mkdir -p ~/.vim/bundle
[...]$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

その後、この管理されているvimrcファイルをハードリンクする。
```
[...]$ cd vimrc
[...]$ ln vimrc /home/<user>/.vimrc
```

