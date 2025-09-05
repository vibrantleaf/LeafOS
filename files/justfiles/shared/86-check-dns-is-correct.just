# Check DNS Is Correct
check-dns-is-correct:
    #!/usr/bin/env bash
    zenity --info --text="Press OK, to check if you default dns server is correct it should show that you are using cloudflare"
    xdg-open "https://dnscheck.tools/"