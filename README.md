# Gnome Eklenti Yükleme Rehberi

Bu script `my_extension.txt` dosyasındaki `gnome eklentilerini` yükler.

Kullandığınz eklentileri Aşağıdaki komut ile listeleyebilirsiniz.

```bash
gnome-extensions list
```

Aşağıdaki komut scriptin içinde olup eklentileri kullanabilmek için kuruluyor.

```bash
sudo apt install gnome-browser-connector -y
```

## Yükleme Adımları

1.  Repoyu Klonlamak İçin Git Yüklemek

Repoyu klonlamak için git yüklü olmalı. Bilgisayarınızda `git` yüklü değilse aşağıdaki komut ile git yükleyebilirsiniz.

```bash
sudo apt install git -y
```

2. ### Scripti Klonlamak

Scripti klonlamak için aşağıdaki komutu terminale yapıştırın :

```bash
git clone https://github.com/kaankaltakkiran/Gnome_extension_installaion.git && cd Gnome_extension_installaion
```

3. ### Scripti Çalıştırmak

Scripti çalıştırmak için aşağıdaki komutu terminale yapıştırın :

```bash
./install_gnome_extensions.sh
```

> **Uyarı!**: Script çalıştıktan sonra bilgisayarı yeniden başlatacaktır.

4. ### Eklentileri Etkin Hale Getirmek

Daha sonra [Gnome Extension Web Sitesinden](https://extensions.gnome.org/local/) veya `extension` uygulamasından eklentileri aktif hale getirebilirsiniz.
