-- =============================================================================
-- BATS IoT — Migración v1.1
-- Añade columna manual_override a estado_alumno_dia.
--
-- Permite que una edición manual de asistencia persista aunque el scanner
-- vuelva a correr. El scanner respeta el flag y no sobrescribe el estado.
-- Al final del día el flag se resetea junto con el resto de la tabla.
--
-- Ejecutar:
--   docker compose exec db mariadb -u root -p${MYSQL_ROOT_PASSWORD} \
--     control_asistencia < db/scripts/migrate_v1_1.sql
-- =============================================================================

ALTER TABLE estado_alumno_dia
    ADD COLUMN manual_override TINYINT(1) NOT NULL DEFAULT 0
    AFTER notificado;
