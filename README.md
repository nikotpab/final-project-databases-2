# Music Festival Management System - INDIE FEST BOGOTA

## Project Overview
This repository contains the data persistence layer for a specialized management system designed for a large-scale music festival. The project implements a polyglot persistence architecture, leveraging the strengths of both relational and document-oriented database engines to handle complex transactional operations and flexible, high-volume data streams.

The selected domain is **INDIE FEST BOGOTA**, a public alternative music festival organized by the District Mayor's Office in Bogota, Colombia. The system is designed to manage the logistical, financial, and artistic operations of a multi-day event with simultaneous performances across multiple stages.

## System Architecture
The architecture is divided into two primary layers to ensure data integrity and system scalability:

### 1. Transactional Core (PostgreSQL)
The relational engine handles structured data requiring strong consistency (ACID properties). This layer manages the primary business entities:
*   **Artists & Contracts:** Legal agreements, payments (cachet), and artistic metadata.
*   **Stages & Performances:** Physical venue management and precise scheduling (including timestamp-based conflict prevention).
*   **Ticketing & Sales:** Ticket inventory management, registration of attendees, and transactional records (even for free-access public events to maintain capacity control).
*   **Staff:** Human resource allocation and shift scheduling per stage.

### 2. Document Layer (MongoDB)
The document-oriented engine handles unstructured, semi-structured, or high-velocity data (BASE properties):
*   **Setlists:** Performance-specific repertoire with variable structures.
*   **Technical Riders:** Highly variable technical requirements per artist (audio, lighting, hospitality).
*   **Public Feedback:** High-volume sentiment analysis and textual reviews.
*   **Incident Reports:** Real-time logistical and security logs with polymorphic attributes.

## Festival Identity: INDIE FEST BOGOTA
*   **Focus:** Promotion of the Colombian alternative and independent music scene.
*   **Venue:** El Tunal Metropolitan Park, Bogota.
*   **Scale:** Approximately 60,000 estimated attendees.
*   **Infrastructure:** Three specialized stages (Frenchies, Hojas Verdes, and Principal).
*   **Lineup:** Exclusively national artists including Margarita Siempre Viva, Oh'laville, Nicolas y los Fumadores, among others.
*   **Access Model:** Public, free-entry (age 12+ restriction), requiring digital registration for capacity management.

## Technical Objectives
*   Design and implementation of a normalized Relational Model (3FN).
*   Development of advanced SQL logic including stored procedures and triggers for business rule enforcement.
*   Implementation of a Document Model utilizing embedding vs. referencing patterns where appropriate.
*   Integration script for cross-engine data aggregation and reporting.
*   Theoretical justification based on the CAP Theorem and ACID/BASE consistency models.

## Setup Guide (Milestone 1 - Relational Core)

To set up the transactional core of the **INDIE FEST BOGOTA** festival, follow these instructions:

### Prerequisites
*   **PostgreSQL:** Version 13 or higher.
*   **SQL Client:** `psql`, pgAdmin 4, DBeaver, or similar.

### Installation Steps
Scripts must be executed in the following order to ensure referential integrity:

1.  **Structure:** Run `ScriptEstructuraPrincipal.sql` to create tables, keys, and constraints.
2.  **Data:** Run `Inserts.sql` to load test data (minimum of 30 records per entity).
3.  **Logic:** Run `triggers.sql` to activate capacity validation, auditing, and schedule control.
4.  **Queries:** Use `Consultas.sql` to run revenue and occupancy reports.

### Milestone 1 Deliverables
*   **ER & Relational Model:** Available in the `/er` and `/ModeloRelacional` folders (`.dmd` files).
*   **PDF Diagram:** `DiagramaERNormalizado.drawio.pdf`.
*   **Triggers:** Implemented for capacity validation, auditing, and overlap prevention.
*   **Queries:** Significant reports with JOINs and aggregations.

## Development Team
*   Nicolas Barbosa Gualteros
*   Anderson Oswaldo Gamba Cubillos
*   David Santiago Ruiz Avila
*   Daniel Andres Medina Castrillon

## Institution
*   **University:** El Bosque University
*   **Faculty:** Engineering
*   **Program:** Systems Engineering
*   **Course:** Databases 2
*   **Term:** 2026-1
