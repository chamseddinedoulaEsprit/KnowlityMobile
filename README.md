# KnowlityMobile - Application Flutter d'Éducation

## 📱 Vue d'ensemble

**KnowlityMobile** est une application mobile Flutter développée avec FlutterFlow pour la gestion de l'éducation et de l'apprentissage. Elle propose des fonctionnalités de quiz, de gestion de cours, de chapitres, et d'évaluation avec intégration d'IA.

### 🎯 Fonctionnalités principales

- **Gestion des cours et chapitres** : Création, modification et consultation
- **Système de quiz interactifs** : Création et participation à des quiz
- **Évaluation automatisée** : Notation automatique via IA (GPT/Gemini)
- **Blog intégré** : Publication et consultation d'articles
- **Authentification utilisateurs** : Étudiants, enseignants, administrateurs
- **Génération PDF** : Rapports de quiz, certificats, plannings
- **Intégration IA** : Filtrage de contenu, génération de texte, détection de mots inappropriés

---

## 🛠️ Configuration et Installation

### Prérequis

- **Flutter SDK** : version stable (>=3.0.0)
- **Dart SDK** : >=2.17.0
- **Firebase Project** configuré
- **Clés API** pour les services externes (OpenAI, Google Gemini, Resend)

### Installation

1. **Cloner le projet**
```bash
git clone https://github.com/chamseddinedoulaEsprit/KnowlityMobile.git
cd KnowlityMobile
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Configuration Firebase**
```bash
# Suivre les instructions Firebase pour ajouter votre projet
# Remplacer les fichiers de configuration :
# - android/app/google-services.json
# - ios/Runner/GoogleService-Info.plist
# - Mettre à jour lib/backend/firebase/firebase_config.dart
```

4. **Configuration des clés API** (voir section Sécurité)

### 🚨 Résolution des Problèmes CI/CD

Pour les erreurs de build GitHub Actions, consultez le **[Guide de Troubleshooting CI/CD](CI_CD_TROUBLESHOOTING.md)** qui contient :
- Solutions aux erreurs "exit code 1"
- Configuration des secrets GitHub
- Debug du workflow
- Optimisations de performance

---

## 🔧 Corrections et Améliorations Récentes

### ✅ Actions personnalisées sécurisées

Les actions FlutterFlow personnalisées ont été auditées et corrigées :

#### **Sécurité API**
- ❌ **Avant** : Clés API en dur dans le code source
- ✅ **Après** : Placeholders sécurisés avec commentaires d'usage

**Fichiers modifiés :**
- `lib/custom_code/actions/filtrer_avec_g_p_t.dart`
- `lib/custom_code/actions/gemin_api.dart` 
- `lib/custom_code/actions/gemini_api_bad_words.dart`
- `lib/custom_code/actions/noter_reponse.dart`
- `lib/custom_code/actions/send_test_email.dart`
- `lib/backend/gemini/gemini.dart`
- `lib/backend/firebase/firebase_config.dart`

#### **Compatibilité multi-plateforme**
- ❌ **Avant** : Import direct de `dart:html` (erreurs sur mobile)
- ✅ **Après** : Imports conditionnels avec helpers web

**Nouveaux fichiers :**
- `lib/custom_code/actions/web_helper_stub.dart` (stub pour mobile)
- `lib/custom_code/actions/web_helper_web.dart` (implémentation web)

#### **Robustesse du code**
- ✅ Parsing JSON défensif avec gestion d'erreurs
- ✅ Valeurs de retour null-safe
- ✅ Logging d'erreurs amélioré

---

## 🔐 Configuration Sécurisée des API

### Étapes obligatoires avant utilisation

1. **Créer un fichier de configuration local** (non versionné)
```bash
# Créer .env à la racine du projet
touch .env
```

2. **Ajouter vos clés API dans .env**
```env
# OpenRouter (pour filtrage GPT et notation)
OPENROUTER_API_KEY=sk-or-v1-votre_cle_ici

# Google Gemini
GOOGLE_GEMINI_API_KEY=AIzaSy_votre_cle_gemini_ici

# Resend (pour emails)
RESEND_API_KEY=re_votre_cle_resend_ici

# Firebase (si nécessaire pour web)
FIREBASE_WEB_API_KEY=AIzaSy_votre_cle_firebase_ici
```

3. **Ajouter .env au .gitignore**
```gitignore
# Secrets
.env
*.env
```

### Remplacer les placeholders

Dans les fichiers d'actions personnalisées, remplacez :
```dart
// AVANT (placeholder)
final apiKey = '<VOTRE_CLE_API_OPENROUTER>'; 

// APRÈS (chargement sécurisé)
final apiKey = dotenv.env['OPENROUTER_API_KEY'] ?? '';
```

**Ajouter la dépendance flutter_dotenv :**
```yaml
dependencies:
  flutter_dotenv: ^5.0.2
```

---

## 📂 Structure du Projet

```
lib/
├── auth/                    # Authentification Firebase
├── backend/                 # Configuration backend
│   ├── firebase/           # Config Firebase
│   ├── gemini/            # Intégration Gemini AI
│   └── schema/            # Modèles de données
├── custom_code/            # Actions FlutterFlow personnalisées
│   └── actions/           
├── flutter_flow/          # Utilitaires FlutterFlow
├── gestion_cours/         # Gestion des cours
├── gestion_quiz/          # Système de quiz
├── chapitre/              # Gestion des chapitres
├── blog/                  # Système de blog
├── user_components/       # Composants utilisateur
├── evaluation/            # Système d'évaluation
└── main.dart             # Point d'entrée

android/                   # Configuration Android
ios/                      # Configuration iOS  
web/                      # Configuration Web
assets/                   # Ressources (images, fonts, etc.)
```

---

## 🚀 Développement et Tests

### Commandes utiles

```bash
# Analyse du code
flutter analyze

# Tests
flutter test

# Build pour différentes plateformes
flutter build apk          # Android
flutter build ios          # iOS  
flutter build web          # Web

# Run en mode debug
flutter run -d chrome      # Web
flutter run -d android     # Android
flutter run -d ios         # iOS
```

### Debugging des actions personnalisées

```bash
# Vérifier les logs des actions personnalisées
flutter run --verbose
```

---

## 🔧 Fonctionnalités Clés

### Actions IA Intégrées

1. **Filtrage de contenu** (`filtrerAvecGPT`)
   - Censure automatique de mots inappropriés
   - Utilise OpenRouter/GPT-3.5

2. **Notation automatique** (`noterReponse`) 
   - Évaluation des réponses textuelles via IA
   - Conversion de notes sur échelles personnalisées

3. **Génération de contenu** (`geminApi`, `geminiApiBadWords`)
   - Génération de texte via Google Gemini
   - Détection de contenu inapproprié

4. **Génération PDF** (`newCustomAction`, `generateSchedulePDF`)
   - Création de quiz, certificats, plannings
   - Compatible web et mobile

### Fonctionnalités Métier

- **Quiz multi-formats** : QCM, questions ouvertes, évaluations
- **Gestion utilisateurs** : Rôles étudiant/enseignant/admin
- **Planning intelligent** : Génération automatique via IA
- **Blog éducatif** : Publication d'articles
- **Notifications** : Emails et SMS (Twilio/Resend)

---

## ⚠️ Points d'Attention

### Sécurité
- ❗ **Ne jamais committer de clés API**
- ❗ Utiliser HTTPS pour tous les appels API
- ❗ Valider toutes les entrées utilisateur
- ❗ Configurer les règles Firestore correctement

### Performance
- 📊 Optimiser les requêtes Firestore (index, limits)
- 🎯 Lazy loading pour les listes longues
- 💾 Mise en cache des données fréquentes

### Maintenance
- 🔄 Mettre à jour régulièrement les dépendances
- 🧪 Tester sur différentes plateformes
- 📝 Documenter les nouvelles actions personnalisées

---

## 🐛 Résolution de Problèmes

### Erreurs communes

**1. Erreur `dart:html` sur mobile :**
```bash
# Solution : Vérifier les imports conditionnels
import 'web_helper_stub.dart' if (dart.library.html) 'web_helper_web.dart';
```

**2. Clés API manquantes :**
```bash
# Vérifier le fichier .env et les placeholders remplacés
```

**3. Erreurs Firebase :**
```bash
# Re-télécharger les fichiers de configuration
# Vérifier les règles de sécurité Firestore
```

### Debug avancé

```bash
# Logs détaillés
flutter run --verbose

# Analyse des performances
flutter run --profile

# Build en mode release pour test
flutter run --release
```

---

## 📞 Support et Contribution

### Contact
- **Développeur** : Chamseddine Doula
- **Email** : chamseddinedoula7@gmail.com
- **Repository** : https://github.com/chamseddinedoulaEsprit/KnowlityMobile

### Contribution
1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/AmazingFeature`)
3. Commit les changements (`git commit -m 'Add AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

---

## 📄 Licence

Ce projet est sous licence [MIT](LICENSE) - voir le fichier LICENSE pour plus de détails.

---

## 🔄 Changelog

### v1.1.0 (Octobre 2025)
- ✅ Sécurisation des actions personnalisées
- ✅ Correction des imports multi-plateformes  
- ✅ Amélioration de la robustesse du parsing JSON
- ✅ Documentation complète du projet

### v1.0.0 (Version initiale)
- 🚀 Implémentation des fonctionnalités de base
- 🎯 Intégration FlutterFlow
- 📱 Support multi-plateformes

---

**Développé avec ❤️ par l'équipe KnowlityMobile**