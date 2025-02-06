# Chatbot RAG Domotique

Ce projet implémente un chatbot basé sur la recherche augmentée par génération (RAG) pour interagir avec un système domotique. Il utilise OpenAI pour générer des embeddings et PostgreSQL avec l'extension `vector` pour stocker et rechercher des textes similaires.

## Prérequis

- Python 3.8+
- PostgreSQL avec l'extension `vector`
- Bibliothèques Python : `psycopg`, `openai`, `numpy`, `python-dotenv`

## Installation

1. Clonez ce dépôt :
   ```sh
   git clone https://github.com/foolitud/chatbot_rag_domotik.git
   cd chatbot_rag_domotik
   ```

2. Installez les dépendances :
   ```sh
   pip install psycopg openai numpy python-dotenv
   ```

3. Configurez les variables d'environnement dans un fichier `.env` :
   ```ini
   OPENAI_API_KEY=your_openai_api_key
   DB_PASSWORD=your_database_password
   ```

## Structure du projet

- `main.py` : Contient le code principal pour créer les embeddings et répondre aux commandes.
- `data/domotik.txt` : Fichier contenant les commandes domotiques et leur description associée.

## Utilisation

1. Assurez-vous que votre base de données PostgreSQL est en cours d'exécution.
2. Exécutez le script principal :
   ```sh
   python main.py
   ```
3. Le chatbot analysera les commandes et les stockera sous forme d'embeddings dans la base de données.
4. Vous pouvez tester une commande en modifiant `user_message` dans `main.py`.

## Fonctionnement

1. **Lecture des commandes** :
   - Le fichier `domotik.txt` est lu et transformé en un dictionnaire `description -> commande`.
   
2. **Calcul des embeddings** :
   - Chaque description est convertie en embedding via l'API OpenAI et stockée dans PostgreSQL.
   
3. **Recherche des textes similaires** :
   - Lorsqu'un utilisateur envoie une commande, un embedding est généré.
   - L'algorithme effectue une recherche de proximité sur la base PostgreSQL pour retrouver la description la plus proche.
   - La commande correspondante est renvoyée en réponse.

## Exemple

Si le fichier `domotik.txt` contient :
```
allumer_lumiere_salon.py
Peux-tu allumer la lumière du salon ?
```

Alors l'appel suivant :
```python
user_message = "peux tu allumer la lumière de mon salon s'il te plaît"
response = generate_response(input_corpus=user_message, conversation_dict=conversation_dict)
print(response)
```
Affichera :
```
allumer_lumiere_salon.py
```

## Auteur

Laurent

## Licence

Ce projet est sous licence MIT.

