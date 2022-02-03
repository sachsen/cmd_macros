# What's this? これは何？
This app for setting Command Prompt Macros for my own sake, so don't expect too much.

Windowsのコマンドプロンプトのマクロを設定するプログラムです。自分用に作ったものなので動作等期待しないでください。

It can backup macros automatically to OneDrive　when you open cmd.exe.

起動時にOneDriveにマクロをバックアップする機能があります。

複数台のPCでマクロを共有したいがため作りました。

# How to use　使用方法

## Initial Settings 初期設定
move cmd_macros folder to C:\Users\usename\

cmd_macrosフォルダをC:\Users\ユーザー名\直下に置きます。

open init.bat and follow instruction.　

init.batを実行し、書いてある通りにします。

## Write Macros　マクロの記述
open macrolist.bat　with texteditor and write macros in "Macro Definition Field".　

macrolist.batをテキストエディタで開けばマクロが定義できます。

## Using macros マクロの使用
open command prompt and type macro which is defined in macrolist.bat.

コマンドプロンプトを立ち上げてマクロのコードを打てば実行されます。

# 追記
プログラムでsecretmacros.batを参照しているのは、そこに個人情報を載せたマクロを用意しているからで、公開にあたってgitignoreしてます。
