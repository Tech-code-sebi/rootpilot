#!/bin/bash

# ────────────────
#  RootPilot OS
#  by Sebastian
# ────────────────

clear
echo "────────────────────────────────────────────"
echo      "██████╗  ██████╗  ██████╗ ████████╗██████╗ ██╗     ████████╗"
echo      "██╔══██╗██╔═══██╗██╔════╝ ╚══██╔══╝██╔══██╗██║     ╚══██╔══╝"
echo      "██████╔╝██║   ██║██║  ███╗   ██║   ██████╔╝██║        ██║"
echo      "██╔═══╝ ██║   ██║██║   ██║   ██║   ██╔═══╝ ██║        ██║"
echo      "██║     ╚██████╔╝╚██████╔╝   ██║   ██║     ███████╗   ██║"
echo      "╚═╝      ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚══════╝   ╚═╝"
echo                 "RootPilot OS by Sebastian"
echo
echo "Willkommen zu deinem persönlichen RootPilot OS Setup!"
sleep 2

if ! command -v whiptail &>/dev/null; then
  echo "❌ whiptail nicht gefunden. Bitte installiere es: sudo apt install whiptail"
  exit 1
fi

OPTIONS=(
  1 "Debian Minimal System"
  2 "CasaOS (Home Server)"
  3 "Nextcloud (Private Cloud)"
  4 "Datenbank (MariaDB)"
  5 "Docker & Docker Compose"
  6 "WireGuard VPN"
  7 "TOR Browser (temporär)"
  8 "Minecraft Server"
  9 "Passwort Manager (Bitwarden Script)"
  10 "Emulatoren (RetroArch)"
  11 "Installiere .NET SDK (C#)"
  12 "Cybersecurity Tools (nmap, wireshark)"
  13 "API Tools (Postman Alternative)"
  14 "Cloud-Installationstool"
  15 "NAS-Zugriff vom Handy (Samba, FTP)"
  16 "Benutzerverwaltung"
  17 "System-Backup erstellen"
  18 "System-Monitor Tools (htop etc)"
  19 "Updates & Upgrade"
  20 "Credits anzeigen"
  21 "Nur Terminal öffnen"
)

while true; do
  CHOICE=$(whiptail --title "RootPilot OS – MultiInstaller Menü" --menu "Wähle eine Option:" 25 75 15 "${OPTIONS[@]}" 3>&1 1>&2 2>&3)

  case $CHOICE in
    1) echo "Debian Minimal wird installiert..." ;;
    2) curl -fsSL https://get.casaos.io | bash ;;
    3) echo "Nextcloud wird installiert..." ;;
    4) apt install -y mariadb-server ;;
    5) curl -fsSL https://get.docker.com | sh && apt install -y docker-compose ;;
    6) apt install -y wireguard ;;
    7) apt install -y tor browser-launcher && browser-launcher ;;
    8) echo "Installiere Minecraft Server..." ;;
    9) echo "Bitwarden Script wird eingerichtet..." ;;
    10) apt install -y retroarch ;;
    11) wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && apt update && apt install -y dotnet-sdk-8.0 ;;
    12) apt install -y nmap wireshark ;;
    13) echo "Installiere HTTPie & REST Tools..." && apt install -y httpie ;;
    14) echo "Starte Cloud-Install Wizard..." ;;
    15) apt install -y samba vsftpd ;;
    16) echo "Füge Benutzer & Gruppenverwaltung hinzu..." ;;
    17) echo "System wird gesichert..." ;;
    18) apt install -y htop glances ;;
    19) apt update && apt upgrade -y ;;
    20) whiptail --msgbox "RootPilot OS by Sebastian\nGitHub: https://github.com/Tech-code-sebi/rootpilot" 10 60 ;;
    21) bash ;;
    *) break ;;
  esac
done
