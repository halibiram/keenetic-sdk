# Keenetic V2Ray İstemcisi (Entware/OPKG Paketi)

Bu proje, Keenetic router'lar için Entware/OPKG aracılığıyla kurulabilen bir V2Ray istemcisi paketi içerir.

**Not:** Bu paket henüz geliştirme aşamasındadır. Çalışması için gerekli olan `xray` binary'sini ve varsayılan konfigürasyon dosyalarını içermez. Bu dosyaların manuel olarak `/opt/bin/` ve `/opt/etc/v2ray/` dizinlerine eklenmesi gerekmektedir.

## Paket Yapısı

Bu dizin, bir `.ipk` paketi oluşturmak için gereken standart yapıya sahiptir:

-   `CONTROL/`: Paket metadata'sını ve kurulum/kaldırma script'lerini içerir.
    -   `control`: Paket adı, versiyon, bağımlılıklar gibi bilgileri tanımlar.
    -   `postinst`: Paket kurulduktan sonra çalışacak script.
    -   `prerm`: Paket kaldırılmadan önce çalışacak script.
-   `opt/`: Router'ın `/opt` dizinine kopyalanacak olan asıl paket dosyalarını içerir.
    -   `opt/etc/init.d/S99v2ray`: Servisi yöneten init script'i.
    -   `opt/etc/ndm/...`: Keenetic web arayüzü entegrasyonu için gerekli dosyalar (gelecekte eklenecek).

## Paket Oluşturma

Bu paketi `.ipk` formatında derlemek için `opkg-utils` aracına ihtiyacınız vardır. Debian/Ubuntu tabanlı bir sistemde şu komutla kurabilirsiniz:

```bash
sudo apt-get update
sudo apt-get install opkg-utils
```

Kurulumdan sonra, bu projenin ana dizinindeyken aşağıdaki komutu çalıştırın:

```bash
opkg-build -o 101 -p 1 v2ray_opkg_package
```

Bu komut, `v2ray-keenetic_1.8.4-1_mipsel_24kc.ipk` (veya `control` dosyasında belirtilen mimariye göre) adında bir paket dosyası oluşturacaktır.

## Kurulum (Router Üzerinde)

1.  Oluşturulan `.ipk` dosyasını `scp` veya `WinSCP` gibi bir araçla router'ınızın `/tmp` dizinine kopyalayın.
2.  SSH ile router'ınıza bağlanın.
3.  Aşağıdaki komutu çalıştırarak paketi kurun:

    ```sh
    opkg install /tmp/v2ray-keenetic_*.ipk
    ```

4.  Kurulum tamamlandıktan sonra, V2Ray sunucu yapılandırmanızı `/opt/etc/v2ray/config.json` dosyasına ekleyin.
5.  Servisi başlatın:

    ```sh
    /opt/etc/init.d/S99v2ray start
    ```

Servisin başlangıçta otomatik olarak çalışması için `postinst` script'i gerekli ayarlamaları yapacaktır.