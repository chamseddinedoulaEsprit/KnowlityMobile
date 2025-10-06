# Configuration d'urgence Flutter CI/CD

# Ce fichier contient des commandes de diagnostic et de réparation
# à exécuter en cas de problème persistant avec le workflow GitHub Actions

## Diagnostic rapide local

# 1. Vérifier Flutter
flutter doctor -v
flutter --version
flutter config

# 2. Nettoyer complètement
flutter clean
flutter pub cache clean
rm -rf build/
rm -rf android/.gradle/
rm -rf android/app/build/

# 3. Réinstaller dépendances
flutter pub get

# 4. Test build minimal
flutter build apk --debug --verbose

## Commandes de réparation

# Si problème de configuration Flutter
flutter config --no-analytics
flutter config --enable-android
flutter config --enable-web

# Si problème de dépendances
flutter pub upgrade --major-versions
flutter pub get

# Si problème Android
cd android
./gradlew clean
./gradlew build
cd ..

## Variables d'environnement CI recommandées

export FLUTTER_ROOT=/opt/hostedtoolcache/flutter/stable-*-x64
export ANDROID_HOME=/usr/local/lib/android/sdk
export JAVA_HOME=/usr/lib/jvm/temurin-17-jdk-amd64
export PATH=$PATH:$FLUTTER_ROOT/bin:$ANDROID_HOME/cmdline-tools/latest/bin

## Secrets GitHub requis

# KEYSTORE - keystore base64 encodé
# STORE_PASSWORD - mot de passe keystore
# KEY_PASSWORD - mot de passe clé
# KEY_ALIAS - alias de la clé