; Caminho para o SoundVolumeView
SoundVol := "E:\imporantsim\Documentos\Ferramentas\soundvolumeview-x64\SoundVolumeView.exe"

; Nome exato dos dispositivos (como aparecem no Painel de Som)
headset := "Headset"
caixa := "Caixas de Som"

; Variável para lembrar último dispositivo
current := ""

; Função para mostrar notificação
ShowToast(msg) {
    TrayTip, Troca de Áudio, %msg%, 1
    ; Em AHK v1 o TrayTip some sozinho, no v2 pode usar MsgBox ou balão
}

; Tecla AppsKey alterna entre Headset e Caixas de Som
AppsKey::
if (current = headset) {
    Run, %SoundVol% /SetDefault "%caixa%" 1
    current := caixa
    ShowToast("🔊 Saída de áudio: Caixas de Som")
} else {
    Run, %SoundVol% /SetDefault "%headset%" 1
    current := headset
    ShowToast("🎧 Saída de áudio: Headset")
}
return