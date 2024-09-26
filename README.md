## Gnome Eklenti Yükleme Rehberi

Bu script `my_extension.txt` dosyasındaki `gnome eklentilerini` yükler.

Kullandığınz eklentileri Aşağıdaki komut ile listeleyebilirsiniz.

```bash
gnome-extensions list
```

Repoyu klonlamak için git yüklü olmalı. Bilgisayarınızda `git` yüklü değilse aşağıdaki komut ile git yükleyebilirsiniz.

```bash
sudo apt install git -y
```

Aşağıdaki komut scriptin içinde olup eklentileri kullanabilmek için kuruluyor.

```bash
sudo apt install gnome-browser-connector -y
```

Scripti klonlamak için aşağıdaki komutu terminale yapıştırın :

> **Uyarı!**: Script çalıştıktan sonra bilgisayarı yeniden başlatacaktır.

```bash
git clone https://github.com/kaankaltakkiran/Gnome_extension_installaion.git && cd Gnome_extension_installaion
```

Scripti çalıştırmak için aşağıdaki komutu terminale yapıştırın :

```bash
./install_gnome_extensions.sh
```

Daha sonra [Gnome Extension Web Sitesinden](https://extensions.gnome.org/local/) veya `extension` uygulamasından eklentileri aktif hale getirebilirsiniz.
