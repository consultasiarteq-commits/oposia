# Configuración de Protección de Ramas

## Rama Main - Protección Crítica

### Configuración Aplicada:
- **Branch name pattern:** main
- **Require a pull request before merging:** ?
- **Require approvals:** 1 (mínimo)
- **Dismiss stale PR approvals when new commits are pushed:** ?
- **Require status checks to pass before merging:** ?
- **Require branches to be up to date before merging:** ?

### Estado de Protección:
- **Color:** VERDE
- **Protección:** ACTIVA
- **GitFlow:** SEGURO

### Flujo de Trabajo:
1. **Desarrollo:** Rama develop
2. **Pull Request:** develop ? main
3. **Aprobación:** Mínimo 1 reviewer
4. **Checks:** Todos deben pasar
5. **Merge:** Solo después de aprobación

---
*Configurado automáticamente por Cursor AI*
*Proyecto: OposIA v2.0 - IArteQ Desarrollos*
*Fecha: 2025*
