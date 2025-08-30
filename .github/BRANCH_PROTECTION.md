# Configuraci�n de Protecci�n de Ramas

## Rama Main - Protecci�n Cr�tica

### Configuraci�n Aplicada:
- **Branch name pattern:** main
- **Require a pull request before merging:** ?
- **Require approvals:** 1 (m�nimo)
- **Dismiss stale PR approvals when new commits are pushed:** ?
- **Require status checks to pass before merging:** ?
- **Require branches to be up to date before merging:** ?

### Estado de Protecci�n:
- **Color:** VERDE
- **Protecci�n:** ACTIVA
- **GitFlow:** SEGURO

### Flujo de Trabajo:
1. **Desarrollo:** Rama develop
2. **Pull Request:** develop ? main
3. **Aprobaci�n:** M�nimo 1 reviewer
4. **Checks:** Todos deben pasar
5. **Merge:** Solo despu�s de aprobaci�n

---
*Configurado autom�ticamente por Cursor AI*
*Proyecto: OposIA v2.0 - IArteQ Desarrollos*
*Fecha: 2025*
