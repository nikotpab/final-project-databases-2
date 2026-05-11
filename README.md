# Music Festival Management System - INDIE FEST BOGOTÁ

## Project Overview
This repository contains the data persistence layer for a specialized management system designed for a large-scale music festival. The project implements a polyglot persistence architecture, leveraging the strengths of both relational and document-oriented database engines to handle complex transactional operations and flexible, high-volume data streams.

The selected domain is **INDIE FEST BOGOTÁ**, a public alternative music festival organized by the District Mayor's Office in Bogotá, Colombia. The system is designed to manage the logistical, financial, and artistic operations of a multi-day event with simultaneous performances across multiple stages.

## System Architecture
The architecture is divided into two primary layers to ensure data integrity and system scalability:

### 1. Transactional Core (PostgreSQL)
The relational engine handles structured data requiring strong consistency (ACID properties). This layer manages the primary business entities:
*   **Artistas & Contratos:** Legal agreements, payments (cachet), and artistic metadata.
*   **Escenarios & Presentaciones:** Physical venue management and precise scheduling (including timestamp-based conflict prevention).
*   **Boletería & Ventas:** Ticket inventory management, registration of attendees, and transactional records (even for free-access public events to maintain capacity control).
*   **Staff:** Human resource allocation and shift scheduling per stage.

### 2. Document Layer (MongoDB)
The document-oriented engine handles unstructured, semi-structured, or high-velocity data (BASE properties):
*   **Setlists:** Performance-specific repertoire with variable structures.
*   **Riders Técnicos:** Highly variable technical requirements per artist (audio, lighting, hospitality).
*   **Public Feedback:** High-volume sentiment analysis and textual reviews.
*   **Incident Reports:** Real-time logistical and security logs with polymorphic attributes.

## Festival Identity: INDIE FEST BOGOTÁ
*   **Focus:** Promotion of the Colombian alternative and independent music scene.
*   **Venue:** Parque Metropolitano El Tunal, Bogotá.
*   **Scale:** Approximately 60,000 estimated attendees.
*   **Infrastructure:** Three specialized stages (Frenchies, Hojas Verdes, and Principal).
*   **Lineup:** Exclusively national artists including Margarita Siempre Viva, Oh'laville, Nicolás y los Fumadores, among others.
*   **Access Model:** Public, free-entry (age 12+ restriction), requiring digital registration for capacity management.

## Technical Objectives
*   Design and implementation of a normalized Relational Model (3FN).
*   Development of advanced SQL logic including stored procedures and triggers for business rule enforcement.
*   Implementation of a Document Model utilizing embedding vs. referencing patterns where appropriate.
*   Integration script for cross-engine data aggregation and reporting.
*   Theoretical justification based on the CAP Theorem and ACID/BASE consistency models.

## 🚀 Guía de Puesta en Marcha (Avance 1 - Núcleo Relacional)

Para poner en funcionamiento el núcleo transaccional del festival **INDIE FEST BOGOTÁ**, siga estas instrucciones:

### 📋 Prerrequisitos
*   **PostgreSQL:** Versión 13 o superior.
*   **Cliente SQL:** `psql`, pgAdmin 4, DBeaver o similar.

### 🛠️ Pasos de Instalación
Los scripts deben ejecutarse en el siguiente orden para garantizar la integridad referencial:

1.  **Estructura:** Ejecute `ScriptEstructuraPrincipal.sql` para crear tablas, llaves y restricciones.
2.  **Datos:** Ejecute `Inserts.sql` para cargar los datos de prueba (mínimo 30 registros por entidad).
3.  **Lógica:** Ejecute `triggers.sql` para activar las validaciones de aforo, auditoría y control de horarios.
4.  **Consultas:** Utilice `Consultas.sql` para ejecutar los reportes de ingresos y ocupación.

### 📦 Entregables Avance 1
*   **Modelo ER & Relacional:** Disponibles en la carpeta `/er` y `/ModeloRelacional` (archivos `.dmd`).
*   **Diagrama PDF:** `DiagramaERNormalizado.drawio.pdf`.
*   **Triggers:** Implementados para validación de aforo, auditoría y prevención de solapamiento.
*   **Consultas:** Reportes significativos con JOINs y agregaciones.

## Development Team
*   Nicolas Barbosa Gualteros
*   Anderson Oswaldo Gamba Cubillos
*   David Santiago Ruiz Ávila
*   Daniel Andrés Medina Castrillón

## Institution
*   **University:** Universidad El Bosque
*   **Faculty:** Engineering
*   **Program:** Systems Engineering
*   **Course:** Databases 2
*   **Term:** 2026-1
