# Crowdfunding Database System

## 專案簡介（Project Overview）

本專案是「資料庫管理系統（Database Management Systems）」課程之期末專案，
以「回饋型群眾募資平台（Reward-based Crowdfunding Platform）」為情境進行資料庫系統設計與實作。

專案主要目標為：

* 練習關聯式資料庫 Schema 設計
* 建立完整 ER Model 與資料表關聯
* 使用 Stored Procedures 實作平台商業邏輯
* 驗證資料一致性與交易安全性（Transaction Handling）

---

## 系統情境（Scenario）

系統模擬一個回饋型群眾募資平台：

* 會員註冊與登入
* 提案（Proposal）建立與管理
* 提案選項（Proposal Option）設定
* 贊助紀錄（Sponsor Record）
* 評論與回覆（Review / Reply）
* 推薦提案（Recommendation）
* 提案追蹤（Follow Proposal）

平台具有完整的提案生命週期，例如：

* Pre-Publish
* Ongoing
* Expired
* Terminated

並包含募資期限延長、評論限制、購買數量限制等規則。

---

### 資料庫設計

* 關聯式資料庫建模（Relational Modeling）
* 正規化（Normalization）
* 外鍵關聯（Foreign Key Constraints）
* 唯一性限制（Unique Constraints）

主要資料表包含：

* Member
* Proposal
* Proposal Option
* Record（評論與評分）
* Sponsor Record（交易紀錄）
* Proposal Following
* Password Table

---

### Stored Procedure 商業邏輯實作

本專案使用 Stored Procedures 實作平台核心操作，例如：

* 會員註冊與登入流程
* 密碼更新機制（含 Salt / Hash 設計）
* 提案狀態管理
* 查詢未回覆評論
* 提案完成率過濾
* 提案選項平均評分統計
* 贊助紀錄建立
* 推薦提案查詢

推薦邏輯為簡化版協同過濾（Collaborative Filtering）：

* 找出「曾贊助相同提案的會員」也贊助過的其他提案
* 若無推薦結果，則回退為顯示瀏覽數最高之進行中提案

---

## Repository 結構

```
docs/                     → 專案情境說明與商業邏輯文件  
crowdfunding_database     → 資料庫 Schema、Sample Data、Stored Procedures  
crowdfunding_db_erd       → 資料表關聯圖（ER Diagram）  
crowdfunding_erd          → MySQL Workbench 建模檔  
```

---

## 學習成果（Learning Outcome）

透過本專案學習並實踐：

* 如何從業務情境推導資料庫結構
* 將商業規則轉換為 Stored Procedure 邏輯
* 撰寫多表 Join 與 Aggregation 查詢
* 使用 Temporary Table 設計推薦邏輯
* 設計可維護且具擴展性的資料模型

---

## Academic Context 說明

本專案為課程總作業成果，
實作內容依據授課需求與題目規格完成。

本專案僅用於學習與作品集展示用途。
