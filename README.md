
```markdown
# Device Tree for Doogee S97 Pro (s97pro)

![Doogee S97 Pro](https://fdn2.gsmarena.com/vv/pics/doogee/doogee-s97-pro-1.jpg)

## 📱 Device specifications
- **SoC:** MediaTek Helio G95 (MT6785)
- **CPU:** Octa-core (2x Cortex-A76 @ 2.05GHz + 6x Cortex-A55 @ 2.0GHz)
- **GPU:** Mali-G76 MC4
- **RAM:** 8 GB
- **Storage:** 128 GB
- **Display:** 6.39" IPS LCD, 720 x 1560 pixels
- **Battery:** 8500 mAh, 33W fast charging
- **Rear Camera:** 48 MP (wide) + 8 MP (ultrawide) + 2 MP (macro) + 2 MP (depth)
- **Front Camera:** 16 MP
- **OS shipped:** Android 11

---

## 📂 Repository structure
- `rootdir/` → init scripts e fstab  
- `sepolicy/` → regras SELinux ajustadas para s97pro  
- `proprietary-files.txt` → blobs essenciais (Wi-Fi, Fingerprint, Vibrator, NFC)  
- `rro_overlays/` → overlays corrigidos para s97pro  
- `vintf/` → manifest XML do device  

---

## ✅ Status
- Boot: ✔️  
- Recovery: ✔️  
- Wi-Fi: ✔️  
- Fingerprint: ✔️  
- Vibrator: ✔️  
- NFC: ✔️  
- Audio: ✔️  
- Camera: ⚠️ (WIP)  
- DT2W: ❌ (desativado por enquanto)

---

## ⚡ How to build
```bash
# Initialize repo
repo init -u https://github.com/YourOrg/android_manifest.git -b lineage-20.0
repo sync

# Clone device tree
git clone https://github.com/YourOrg/android_device_doogee_s97pro.git device/doogee/s97pro

# Build recovery
. build/envsetup.sh
lunch lineage_s97pro-eng
mka recoveryimage
```

---

## 🙌 Credits
- **LineageOS Team** – base do AOSP/Lineage  
- **Doogee** – device  
- **Comunidade Android** – patches e suporte  
- **Gabriel** – manutenção e adaptação para o S97 Pro  

---
