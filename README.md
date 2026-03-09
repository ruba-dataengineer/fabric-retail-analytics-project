
# Microsoft Fabric Retail ETL Pipeline

## Overview
End-to-end ETL pipeline using Microsoft Fabric with Bronze, Silver, Gold layers and Power BI dashboard.

## Architecture
CSV Data → Fabric Data Pipeline → Lakehouse Bronze → Transformation → Silver → Gold → Power BI

## Tools
- Microsoft Fabric
- Power BI
- SQL
- Dataflow Gen2

## Steps
1. Ingest CSV files using Fabric Data Pipeline
2. Store raw data in Bronze tables
3. Transform data to Silver layer
4. Create fact/dimension tables in Gold layer
5. Build Power BI dashboard

## Architecture

Bronze Layer:
   bronze_orders
   bronze_products
   bronze_customers

        ↓

Silver Layer:
   silver_orders_vw
   silver_products_vw
   silver_customers_vw

        ↓

Gold Layer:
   dim_products
   dim_customers
   fact_sales

        ↓

Dashboard
   Power BI
