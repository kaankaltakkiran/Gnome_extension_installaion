#!/bin/bash

# Gerekli paketleri yükleyin (gnome-browser-connector)
echo "Gerekli paket yükleniyor:gnome-browser-connector"
sudo apt update
sudo apt install gnome-browser-connector -y

# GNOME Shell version number
GNOME_VERSION=$(gnome-shell --version | awk '{print $3}' | cut -d. -f1,2)

# Eklenti dosyasının yolu (GitHub'dan klonladığınız dizinde yer alır)
EXTENSION_FILE="./my_extension.txt"

# Dosya var mı kontrol et
if [ ! -f "$EXTENSION_FILE" ]; then
    echo "Eklenti dosyası bulunamadı: $EXTENSION_FILE"
    exit 1
fi

# Eklenti dosyasından eklentileri okuyun
EXTENSIONS=()
while IFS= read -r line; do
    # Boş satırları atla
    if [ -n "$line" ]; then
        EXTENSIONS+=("$line")
    fi
done < "$EXTENSION_FILE"

# Gerekli dizinlerin varlığını kontrol edin ve oluşturun
EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions"
mkdir -p "$EXTENSION_DIR"

# GNOME Eklentilerini indir ve yükle
for EXTENSION in "${EXTENSIONS[@]}"; do
    echo "Yükleniyor: $EXTENSION"
    
    # Eğer zip dosyası varsa URL'den indir
    wget -O /tmp/$EXTENSION.zip "https://extensions.gnome.org/download-extension/$EXTENSION.shell-extension.zip?shell_version=$GNOME_VERSION"

    # Eklentiyi çıkar ve ilgili dizine taşı
    unzip /tmp/$EXTENSION.zip -d "$EXTENSION_DIR/$EXTENSION"
    
    # Eğer schemas dizini varsa, şemaları derle
    SCHEMA_DIR="$EXTENSION_DIR/$EXTENSION/schemas"
    if [ -d "$SCHEMA_DIR" ]; then
        echo "Şemalar derleniyor: $EXTENSION"
        glib-compile-schemas "$SCHEMA_DIR"
    fi

    # GNOME'a eklentiyi etkinleştirmesini söyle
    gnome-extensions enable "$EXTENSION"

    echo "$EXTENSION başarıyla yüklendi ve etkinleştirildi."
done

# Yükleme tamamlandıktan sonra bilgisayarı yeniden başlat
echo "--------------------------------------------"
echo "Değişikliklerin etkili olması için bilgisayarınızı yeniden başlatın."
echo "--------------------------------------------------------------"
read -p "Bilgisayarınızı yeniden başlatmak ister misiniz? (E/H): " REPLY

if [ "$REPLY" == "E" ] || [ "$REPLY" == "e" ]; then
    sudo reboot
else
    echo "Otamatik yeniden başlatma iptal edildi. Bilgisayarınızı manuel olarak yeniden başlatın."
    exit 1
fi

