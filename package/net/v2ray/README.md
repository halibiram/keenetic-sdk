# Keenetic V2Ray Client

Bu paket, Keenetic router'lar için tam donanımlı bir V2Ray istemcisi sağlar. Keenetic'in web arayüzü ile entegre çalışır ve gelişmiş özellikler sunar.

**Not:** Bu paket henüz geliştirme aşamasındadır. Fonksiyonel değildir.

## Özellikler (Planlanan)

- Keenetic web arayüzüne tam entegrasyon.
- VMess, VLESS, Shadowsocks, Trojan protokolleri desteği.
- Transparent Proxy (Tüm cihazların trafiğini yönlendirme).
- Gelişmiş yönlendirme kuralları.
- DPI (Derin Paket İncelemesi) engelleme teknikleri.
- Web arayüzü üzerinden sunucu ve abonelik yönetimi.

## Kurulum

Bu paket Keenetic SDK kullanılarak firmware'e dahil edilmek üzere tasarlanmıştır.

1.  **SDK'yı Hazırlayın:** Keenetic SDK'yı kurun ve firmware'inizi `unpack` komutu ile açın.
2.  **Paketi Kopyalayın:** Bu `v2ray` paket dizinini, SDK'nın `package/net/` dizinine kopyalayın.
3.  **Firmware'i Derleyin:** SDK ana dizininde `make` komutunu çalıştırarak yeni firmware'i oluşturun.
4.  **Firmware'i Yükleyin:** Oluşturulan `.bin` dosyasını Keenetic router'ınızın web arayüzünden yükleyin.

## Kullanım

Kurulum tamamlandıktan sonra, Keenetic web arayüzünde "Uygulamalar" veya "VPN" menüsü altında "V2Ray Client" seçeneğini bulabilirsiniz. Tüm yapılandırma ve kontrol işlemleri bu arayüz üzerinden yapılacaktır.