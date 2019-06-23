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
	;gvim
	; IfWinActive,ahk_class VirtualConsoleClass
	; {
	; 	return 1
	; }
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
SC073::_
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
;編集系
;無変換 + h : BackSpace
;無変換 + d : Delete
;無変換 + m : Enter
;無変換 + k : カーソルから行末まで削除
;無変換 + u : カーソかから行頭まで削除
;無変換 + w : delete word left
;無変換 + l : delete word right
;----------------------------------------------------------------

vk1D & h::send,{BS}
vk1D & d::send,{Del}
vk1D & m::send,{Return}
vk1D & k::send_key("^k","+{End}{Del}")
vk1D & u::send_key("^u","+{Home}{BS}")
vk1D & w::send_key("^w","^{BS}")
vk1D & l::send_key("^l","^{Del}")

;----------------------------------------------------------------
;マウス系
;ctrl + alt + h : マウス左移動
;ctrl + alt + j : マウス下移動
;ctrl + alt + k : マウス上移動
;ctrl + alt + l : マウス右移動
;ctrl + alt + u : 左クリック
;ctrl + alt + o : 右クリック
;----------------------------------------------------------------

^!j::MouseMove,   0,  10, 0, R
^!k::MouseMove,   0, -10, 0, R
^!h::MouseMove, -10,   0, 0, R
^!l::MouseMove,  10,   0, 0, R
^!u::send,{LButton}
^!o::send,{RButton}

;----------------------------------------------------------------
;自動リロード保存
;----------------------------------------------------------------

; #IfWinActive, ahk_exe Code.exe

; ~^s::
;     ScriptName := "windows10.ahk"
;     IfWinActive, %ScriptName%
;     {
;         Reload
;     }
; return
```

1. 上記をwindows10.ahkとして保存
1. ahkでwindows10.ahkをコンパイル
1. 出力されたwindows10.exeを実行

## 自動実行

1. ++win+r++
1. `shell:startup`と入力して実行
1. 表示されたフォルダにwindows10.exeへのショートカットを置いておく