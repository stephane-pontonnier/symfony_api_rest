# Symfony API REST
Cette application est un exemple d'API REST construite avec **Symfony**, **API Platform** et **LexikJWTAuthenticationBundle** pour l'authentification JWT. Le projet inclut une configuration Docker pour faciliter le démarrage.
## Prérequis
* [Docker](https://www.docker.com/get-started) et [Docker Compose](https://docs.docker.com/compose/)
* PHP >= 8.2
## Installation
1. **Cloner le dépôt :**
```bash
git clone https://github.com/stephane-pontonnier/symfony_api_rest.git
cd symfony_api_rest
```
2. **Démarrer les containers Docker :**
```bash
docker-compose up -d
```
 Ce qui lance :
 * PHP + Symfony
 * Nginx
 * MySQL 8.0
 * PhpMyAdmin

3. Aller dans le conteneur et installer les dépendances PHP via Composer
```bash
docker exec -it symfony-api bash
composer install
```

4. générer les clés JWT (LexikJWTAuthenticationBundle) :
```bash
php bin/console lexik:jwt:generate-keypair
```
# Utilisation
1. Accéder à l'API :
   ```bash
   http://localhost:8000/api
   ``
3. Authentification JWT :
* Endpoint pour obtenir un token : POST /api/auth
