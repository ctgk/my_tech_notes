# AutoHotkey

```ahk
;================================================================
;auto hot key script for windows10
;----------------------------------------------------------------
;メモ
;#Win, !Alt, ^Ctrl, +Shift
;vk1C変換, vk1D無変換
;----------------------------------------------------------------
;================================================================

#InstallKeybdHook
#UseHook

;================================================================
;関数
;================================================================

;----------------------------------------------------------------
;キーバインドを無効にするウィンドウかどうか判断する
; ahk_classはauto hot key付属のAU3_Spy.exeを使用して調べる。
;  引数 なし
;  戻り値 1:キーバインドを無効にするウィンドウ
;         0:キーバインドを有効にするウィンドウ
;----------------------------------------------------------------
is_terminal_window()
{
	IfWinActive, ahk_exe Hyper.exe
	{
		return 1
	}
	IfWinActive, ahk_exe ubuntu1804.exe
	{
		return 1
	}
	IfWinActive,ahk_exe ConEmu64.exe
	{
		return 1
	}
	IfWinActive, ahk_exe pengwin.exe
	{
		return 1
	}
	return 0
}

;----------------------------------------------------------------
;キーを送信する
; キーバインドを無効にするウィンドウでは、送信されたキーをそのまま使用する
; キーバインドを有効にするウィンドウでは、送信されたキーを置き換える
;
;  引数 original_key:キーバインドを無効にするウィンドウの場合、送信するキー
;       replace_key:キーバインドを有効にするウィンドウの場合、送信するキー
;  戻り値 なし
;----------------------------------------------------------------
send_key(original_key,replace_key)
{
	if (is_terminal_window())
	{
		Send,%original_key%
		return
	}
	Send,%replace_key%
	return
}


;================================================================
;ahk_class independent remapping
; \ -> _
; 変換 -> ctrl
;================================================================
sc073::Send, _
vk1C::Control

;================================================================
;変換キーバインド
;================================================================

;----------------------------------------------------------------
;移動系（shiftキーとの同時押し対応）
;無変換 + n : down
;無変換 + p : up
;無変換 + f : right
;無変換 + b : left
;無変換 + a : Home
;無変換 + e : End
;----------------------------------------------------------------

vk1D & n::send,{Blind}{Down}
vk1D & p::send,{Blind}{Up}
vk1D & f::send,{Blind}{Right}
vk1D & b::send,{Blind}{Left}
vk1D & a::send,{Blind}{Home}
vk1D & e::send,{Blind}{End}

;----------------------------------------------------------------
;Editing
;無変換 + h : BackSpace
;無変換 + d : Delete
;無変換 + m : Enter
;無変換 + k : delete from here to the end of the line
;無変換 + u : delete from here to the start of the line
;無変換 + w : delete word left
;無変換 + l : delete word right
;----------------------------------------------------------------

vk1D & h::send,{BS}
vk1D & d::send,{Del}
vk1D & m::send,{Return}
vk1D & k::send_key("^k","+{End}{Del}")
vk1D & u::send_key("^u","+{Home}{BS}")
vk1D & w::send_key("^w","^{BS}")
vk1D & l::send,^{Del}

;----------------------------------------------------------------
;Mouse moves
;ctrl + alt + a : Move mouse to the center of the screen
;ctrl + alt + h : Move mouse 100pix left
;ctrl + alt + j : Move mouse 100pix down
;ctrl + alt + k : Move mouse 100pix up
;ctrl + alt + l : Move mouse 100pix right
;ctrl + alt + u : Left click
;ctrl + alt + o : Right click
;----------------------------------------------------------------
CoordMode, Mouse, Screen
^!a::MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2)
^!j::MouseMove,    0,  100, 0, R
^!k::MouseMove,    0, -100, 0, R
^!h::MouseMove, -100,    0, 0, R
^!l::MouseMove,  100,    0, 0, R
^!u::send,{LButton}
^!o::send,{RButton}
```

1. 上記をwindows10.ahkとして保存
1. ahkでwindows10.ahkをコンパイル
1. 出力されたwindows10.exeを実行

## 自動実行

1. ++win+r++
1. `shell:startup`と入力して実行
1. 表示されたフォルダにwindows10.exeへのショートカットを置いておく
