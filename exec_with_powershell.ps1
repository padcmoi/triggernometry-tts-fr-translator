# This PowerShell script automates Docker Desktop installation (if needed),
# then builds and runs the translation container.
# To be used on Windows, at the project root.

# Check if Docker Desktop is installed
$dockerPath = (Get-Command docker -ErrorAction SilentlyContinue).Source
if (-not $dockerPath) {
    Write-Host "Docker Desktop n'est pas installé. Ouverture de la page de téléchargement..." -ForegroundColor Yellow
    Start-Process "https://www.docker.com/products/docker-desktop/"
    Write-Host "Merci d'installer Docker Desktop, puis de relancer ce script."
    pause
    exit 1
}

# Check if Docker Desktop is running
$dockerInfo = docker info 2>$null
if (-not $dockerInfo) {
    Write-Host "Démarrage de Docker Desktop..." -ForegroundColor Yellow
    Start-Process "Docker Desktop"
    Write-Host "Merci d'attendre que Docker soit prêt (icône verte dans la barre des tâches), puis appuyez sur une touche."
    pause
}

# Build Docker image
Write-Host "Construction de l'image Docker..." -ForegroundColor Cyan
docker build -t triggernometry-translator .

# Run the container (mount local folders)
Write-Host "Exécution du conteneur..." -ForegroundColor Cyan
docker run --rm -it -v ${PWD}/en:/app/en -v ${PWD}/fr:/app/fr triggernometry-translator

Write-Host "Traduction terminée. Les fichiers traduits sont dans le dossier 'fr'." -ForegroundColor Green
pause
