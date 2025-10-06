# 🔧 Guide de Résolution des Problèmes CI/CD - KnowlityMobile

## 🚨 Erreurs Communes et Solutions

### 1. Erreur "exit code 1" lors du build Flutter

**Symptômes :**
```
<asynchronous suspension>
Error: Process completed with exit code 1.
```

**Causes possibles :**
- Placeholders API non remplacés (`<VOTRE_CLE_*>`)
- Configuration Android incorrecte
- Problèmes de dépendances Flutter
- Erreurs de compilation Dart

**Solutions appliquées :**

#### ✅ Étape 1: Remplacement automatique des placeholders
Le workflow remplace maintenant automatiquement les placeholders d'API :
```bash
sed -i 's/<VOTRE_CLE_API_OPENROUTER>/test_openrouter_key/g' "$file"
```

#### ✅ Étape 2: Diagnostic étendu
- Test de build debug avant release
- Logs détaillés en cas d'erreur
- Vérification des outils Android

#### ✅ Étape 3: Configuration Android renforcée
- Acceptation automatique des licences SDK
- Configuration Gradle optimisée
- Permissions graduées correctement

---

## 🔍 Debug du Workflow

### Étapes de diagnostic ajoutées

1. **Validation pré-build**
   - `flutter doctor -v`
   - Vérification des dépendances
   - Test build debug

2. **Configuration environnement**
   - Setup Android SDK
   - Configuration Gradle
   - Permissions fichiers

3. **Build avec diagnostic**
   - Logs étendus en cas d'erreur
   - Recherche APK alternative
   - Affichage structure build

---

## 🛠️ Solutions par Type d'Erreur

### Erreur de clés API manquantes
```yaml
- name: Fix API key placeholders for CI build
  run: |
    # Remplace tous les placeholders par des valeurs de test
    find lib/custom_code/actions/ -name "*.dart" -type f | while read file; do
      sed -i 's/<VOTRE_CLE_API_OPENROUTER>/test_key/g' "$file"
    done
```

### Erreur de configuration Android
```yaml
- name: Setup Android environment
  run: |
    # Configure ANDROID_HOME et accepte les licences
    export ANDROID_HOME=$HOME/android-sdk
    yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses
```

### Erreur de dépendances Flutter
```yaml
- name: Fix pubspec dependencies conflicts
  run: |
    flutter pub upgrade --major-versions
    flutter pub get
```

---

## 🔧 Configuration des Secrets GitHub

### Secrets requis pour le build signé

1. **KEYSTORE** - Keystore encodé en base64
   ```bash
   base64 -i upload-keystore.jks | tr -d '\n'
   ```

2. **STORE_PASSWORD** - Mot de passe du keystore
3. **KEY_PASSWORD** - Mot de passe de la clé
4. **KEY_ALIAS** - Alias de la clé

### Configuration dans GitHub
1. Aller dans Settings → Secrets and variables → Actions
2. Ajouter chaque secret avec New repository secret

---

## 📊 Monitoring du Build

### Logs à surveiller

1. **Flutter doctor**
   ```
   ✅ Flutter (Channel stable, 3.x.x)
   ✅ Android toolchain
   ✅ Android Studio / IntelliJ
   ```

2. **Gradle build**
   ```
   ✅ APK créé avec succès
   ✅ Taille de l'APK: X MB
   ```

3. **Artifacts**
   ```
   ✅ app-release.apk uploaded
   ```

---

## 🚀 Amélirations du Workflow

### Fonctionnalités ajoutées

1. **Build multi-architecture**
   ```
   --target-platform android-arm64,android-arm,android-x64
   ```

2. **Diagnostic automatique**
   - Détection erreurs Gradle
   - Logs manifest merger
   - Recherche APK alternative

3. **Gestion des erreurs robuste**
   - Continuation sur erreurs non critiques
   - Fallback sur build debug
   - Messages d'erreur détaillés

---

## ⚡ Optimisations Performance

### Configuration Gradle
```properties
org.gradle.daemon=true
org.gradle.parallel=true
org.gradle.configureondemand=true
org.gradle.jvmargs=-Xmx4g
```

### Cache Flutter
```yaml
- name: Clear Flutter cache
  run: flutter clean
```

---

## 🔄 Workflow de Debug Local

Pour reproduire les erreurs localement :

```bash
# 1. Nettoyer l'environnement
flutter clean

# 2. Résoudre les dépendances
flutter pub get

# 3. Analyser le code
flutter analyze

# 4. Build avec logs détaillés
flutter build apk --release --verbose

# 5. Vérifier l'APK
ls -la build/app/outputs/flutter-apk/
```

---

## 📋 Checklist de Résolution

- [ ] Vérifier que tous les placeholders API sont remplacés
- [ ] Confirmer que les permissions Android sont correctes
- [ ] Valider la configuration Gradle (Java 1.8)
- [ ] Tester le build local avant push
- [ ] Vérifier les logs du workflow pour erreurs spécifiques
- [ ] Contrôler que les artifacts sont générés

---

## 📞 Support

- **Repository** : https://github.com/chamseddinedoulaEsprit/KnowlityMobile
- **Issues** : Ouvrir une issue avec les logs complets
- **Documentation** : Voir README_PROJET.md

**Note** : Ce guide est mis à jour avec chaque amélioration du workflow CI/CD.