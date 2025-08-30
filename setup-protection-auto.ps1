# Script de Configuración Automática de Protección de Ramas
# OposIA v2.0 - IArteQ Desarrollos
# Fecha: 2025

Write-Host "?? Configurando Protección de Ramas Automáticamente..." -ForegroundColor Green

# Configuración del repositorio
$REPO_OWNER = "consultasiarteq-commits"
$REPO_NAME = "oposia"
$GITHUB_TOKEN = $env:GITHUB_TOKEN

Write-Host "?? Configuración:" -ForegroundColor Yellow
Write-Host "   Repositorio: $REPO_OWNER/$REPO_NAME" -ForegroundColor Cyan
Write-Host "   Token: $(if ($GITHUB_TOKEN) { 'Configurado' } else { 'No configurado' })" -ForegroundColor Cyan

# Función para configurar protección de rama
function Set-BranchProtection {
    param(
        [string]$BranchName,
        [hashtable]$ProtectionConfig
    )
    
    $headers = @{
        "Authorization" = "token $GITHUB_TOKEN"
        "Accept" = "application/vnd.github.v3+json"
        "User-Agent" = "OposIA-Protection-Script"
    }
    
    $body = $ProtectionConfig | ConvertTo-Json -Depth 10
    
    $uri = "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/branches/$BranchName/protection"
    
    try {
        $response = Invoke-RestMethod -Uri $uri -Method Put -Headers $headers -Body $body -ContentType "application/json"
        Write-Host "? Rama $BranchName protegida exitosamente" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "? Error protegiendo rama $BranchName`: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Configuración de protección para rama MAIN
$MAIN_PROTECTION = @{
    required_status_checks = @{
        strict = $true
        contexts = @()
    }
    enforce_admins = $false
    required_pull_request_reviews = @{
        required_approving_review_count = 1
        dismiss_stale_reviews = $true
        require_code_owner_reviews = $false
        require_last_push_approval = $false
    }
    restrictions = $null
    required_linear_history = $false
    allow_force_pushes = $false
    allow_deletions = $false
    block_creations = $false
    required_conversation_resolution = $false
}

# Configuración de protección para rama DEVELOP
$DEVELOP_PROTECTION = @{
    required_status_checks = @{
        strict = $false
        contexts = @()
    }
    enforce_admins = $false
    required_pull_request_reviews = $null
    restrictions = $null
    required_linear_history = $false
    allow_force_pushes = $true
    allow_deletions = $false
    block_creations = $false
    required_conversation_resolution = $false
}

Write-Host "?? Configurando protección para rama MAIN..." -ForegroundColor Yellow
$mainSuccess = Set-BranchProtection -BranchName "main" -ProtectionConfig $MAIN_PROTECTION

Write-Host "?? Configurando protección para rama DEVELOP..." -ForegroundColor Yellow
$developSuccess = Set-BranchProtection -BranchName "develop" -ProtectionConfig $DEVELOP_PROTECTION

# Resultado final
if ($mainSuccess -and $developSuccess) {
    Write-Host "?? ¡Configuración completada exitosamente!" -ForegroundColor Green
    Write-Host "? Rama MAIN: Protección máxima activada" -ForegroundColor Green
    Write-Host "? Rama DEVELOP: Protección media activada" -ForegroundColor Green
    Write-Host "?? Repositorio listo para desarrollo empresarial" -ForegroundColor Green
} else {
    Write-Host "?? Algunas configuraciones fallaron. Revisa los errores arriba." -ForegroundColor Yellow
}

Write-Host "?? Para verificar, ve a: https://github.com/$REPO_OWNER/$REPO_NAME/settings/branches" -ForegroundColor Cyan
