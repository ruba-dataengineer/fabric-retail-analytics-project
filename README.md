
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
<img width="1536" height="1024" alt="ChatGPT Image Mar 9, 2026, 05_52_06 PM" src="https://github.com/user-attachments/assets/3ea8ed7f-b335-4309-8317-a6ce8bed2252" />

