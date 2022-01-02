function qrcode -d 'Generate a qrcode'
    if test -n "$argv"
        qrencode -o /tmp/qr.png "$argv"
    else
        read -z input
        qrencode -o /tmp/qr.png "$input"
    end
    feh /tmp/qr.png
end
