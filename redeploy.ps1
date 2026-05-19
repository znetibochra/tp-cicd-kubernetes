# 1. Définition des variables
$imageName = "mon-image:latest"
$deploymentName = "mon-appli"

Write-Host "--- Début du redéploiement (Mode Direct) ---" -ForegroundColor Cyan

# 2. Construction de l'image Docker
# Puisque le terminal est lié à Minikube, l'image est créée DIRECTEMENT dedans.


# Remplace "docker build" par "docker.exe build"
Write-Host "[1/3] Construction de l'image dans Minikube : $imageName..." -ForegroundColor Yellow
docker.exe build -t $imageName .


# 3. Forcer Kubernetes à relancer les Pods
Write-Host "[2/3] Redémarrage du déploiement : $deploymentName..." -ForegroundColor Yellow
kubectl rollout restart deployment $deploymentName

# 4. Vérification
Write-Host "[3/3] Attente du redémarrage (5s)..." -ForegroundColor Yellow
Start-Sleep -Seconds 5
Write-Host "État actuel des Pods :" -ForegroundColor Cyan
kubectl get pods

Write-Host "--- Terminé ! Rafraîchissez votre navigateur ---" -ForegroundColor Green