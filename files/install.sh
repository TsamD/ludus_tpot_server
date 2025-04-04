#!/bin/bash

set -e

echo "=== T-Pot Installation Automatisée (Interface Auto) ==="

# Détection automatique de l'interface par défaut
TPOT_IFACE=$(ip route | grep default | awk '{print $5}' | head -n1)

if [ -z "$TPOT_IFACE" ]; then
  echo "❌ Impossible de détecter l'interface réseau par défaut. Abandon."
  exit 1
fi

echo "➡️ Interface détectée : $TPOT_IFACE"

# Configuration d'installation
export DEBIAN_FRONTEND=noninteractive
export INSTALL_MODE=STANDARD
export INSTALL_LANGUAGE=en

# Lancer le script officiel
#cd /opt/tpotce/iso/installer/
cd /root/tpot/iso/installer/


echo "==> Installation avec :"
echo "  - Mode      : $INSTALL_MODE"
echo "  - Interface : $TPOT_IFACE"
echo "  - Langue    : $INSTALL_LANGUAGE"

./install.sh "$INSTALL_MODE" --type "$INSTALL_MODE" --iface "$TPOT_IFACE" --lang "$INSTALL_LANGUAGE" --yes

