<aside>

---
# Project 💸Send money💸

### 목차

0. [**프로젝트 소개**](#developers)  

1. [**DB 원격 연결 설정 💿**](#1-db-원격-연결-설정)  
2. [**테이블 생성 및 예제 데이터 👤**](#2-테이블-생성-및-예제-데이터-)  
3. [**정규표현식 연습용 SQL 문제 📝**](#3-정규표현식-연습용-sql-문제-)  

   3.1 [문제 1: 우편번호 확인](#문제-1-우편번호-확인) 

   3.2 [문제 2: 송금인 이름 확인](#문제-2-송금인-이름-확인) 

   3.3 [문제 3: 전화번호 형식 검증](#문제-3-전화번호-형식-검증) 

   3.4 [문제 4: 계좌번호 형식 검증](#문제-4-계좌번호-형식-검증) 

   3.5 [문제 5: 거래 은행 이름 검증](#문제-5-거래-은행-이름-검증)  

   3.6 [문제 6: 주민등록번호 형식 검증](#문제-6-주민등록번호-형식-검증)  

   3.7 [문제 7: 이메일 형식 검증](#문제-7-이메일-형식-검증)  

4. [**트러블슈팅 💥**](#4-트러블슈팅)  

   4.1 [문제 설명](#-문제-설명-problem-statement)  

   4.2 [문제 분석](#%EF%B8%8F-문제-분석-root-cause-analysis)  

   4.3 [해결 과정](#-해결-과정-troubleshooting-steps)  

   4.4 [해결 방법](#-해결-방법-solution)  

5. [**프로젝트 고찰 🤔**](#5-고찰)


## Developers
| <img src="https://github.com/imhaeunim.png" width="200px"> | <img src="https://github.com/letmeloveyou82.png" width="200px"> | <img src="https://github.com/andytjdqls.png" width="200px"> | <img src="https://github.com/unoYoon.png" width="200px"> |
| :---: | :---: | :---: | :---: |
| [임하은](https://github.com/imhaeunim) | [최윤정](https://github.com/letmeloveyou82) | [이성빈](https://github.com/andytjdqls) | [윤원호](https://github.com/unoYoon) |


### **개요**
데이터베이스와의 원격 접속을 통해 실제 환경에서의 데이터 처리 경험을 제공하고 정규표현식을 이해하기 위해 프로젝트 설계

### **목적**

정규표현식 이해 및 숙련도 향상 및 DB 원격 호출을 통해 패턴 중심 데이터 활용

<br>

## **1. DB 원격 연결 설정💿**
> MySQL 원격 협업 구조

![image6](https://github.com/user-attachments/assets/67cd7a2d-24f5-47f9-85b9-f127ee136e7e)

> DB connect process

![image7](https://github.com/user-attachments/assets/97fe0d8c-554a-4af3-ace9-bb516c170f14)


## **2. 테이블 생성 및 예제 데이터 👤**

>Table 설계

![image](https://github.com/user-attachments/assets/5fd0e34f-c662-44e0-9fbd-3c53dc89d53a)


```sql
CREATE TABLE user (
    email VARCHAR(50),               -- 이메일 (예: [username]@[domain].[tld])
    ssn VARCHAR(9),                  -- 주민번호 (예: 123456-1)
    account_number VARCHAR(16) PRIMARY KEY, -- 계좌번호 (예: 123-456-789012) PK
    phone_number VARCHAR(15),         -- 전화번호 (예: 010-1234-5678)
    user_name VARCHAR(16),            -- 사용자 이름
    bank_name VARCHAR(21),            -- 거래 은행
    zipcode VARCHAR(6)               -- 우편번호 (예: 12345)
);

```

```sql
INSERT INTO user (email, ssn, account_number, phone_number, user_name, bank_name, zipcode) VALUES
('john.doe@example.com', '700101-1', '1234-567-890123', '010-1234-5678', '김철수', '신한은행', '12345'),
('test_user123@company.co.kr', '880214-3', '2345-678-901234', '010-9876-5432', '이민수', '국민은행', '54321'),
('alice.smith@domain.com', '920301-2', '3456-789-012345', '010-2468-1357', '박지은', '농협은행', '98765'),
('bob.jones@sample.net', '750507-1', '4567-890-123456', '010-1357-2468', '최지훈', '우리은행', '11111'),
('mary.jane@abc.org', '800619-3', '5678-901-234567', '010-9876-1234', '홍길동', '하나은행', '22222'),
('james.brown@xyz.com', '850715-2', '6789-012-345678', '010-4321-8765', '김민정', '신한은행', '33333'),
('emily.white@domain.co.kr', '900205-4', '7890-123-456789', '010-6789-1234', '이상민', '국민은행', '44444'),
('john.doe123@company.com', '810324-1', '8901-234-567890', '010-2468-9753', '김지혜', '농협은행', '55555'),
('linda.green@company.org', '870413-2', '9012-345-678901', '010-1357-8642', '박준수', '우리은행', '66666'),
('charles.black@web.net', '710522-3', '0123-456-789012', '010-3579-8642', '한지민', '하나은행', '77777');

```

<br>

---

## **3. 정규표현식 연습용 SQL 문제 📝**

### **문제 1: 우편번호 확인**

우편번호는 5글자 숫자입니다. 이에 맞게 where 절에 정규표현식을 작성하세요.

정규표현식 : 

```sql
SELECT *
FROM user
WHERE zipcode REGEXP
-- 우편번호 (예: 12345)
```

---

### **문제 2: 송금인 이름 확인**

송금인 이름은 2글자 이상 5글자 이하인 한글입니다. 이에 맞게 where 절에 정규표현식을 작성하세요.

**정규표현식**: 

```sql
SELECT *
FROM user
WHERE user_name REGEXP 
-- 사용자 이름 (예: 홍길동) 
```

---

### **문제 3: 전화번호 형식 검증**

전화번호 형식 `010-####-####` 에 맞게 where 절에 정규표현식을 작성하세요.

단, `#` 에 들어갈 번호는 모두 숫자여야만 합니다.

**정규표현식**: 

```sql
SELECT *
FROM user
WHERE phone_number REGEXP 
-- 전화번호 (예: 010-1234-5678)
```

---

### **문제 4: 계좌번호 형식 검증**

계좌번호 형식 `####-###-######` 에 맞게 where 절에 정규표현식을 작성하세요.

단, `#` 에 들어갈 번호는 모두 숫자여야만 합니다.

- 우리은행 계좌번호 형식 참고 : [금융결제원 참가기관별 CMS 계좌번호체계 우리은행 (기준일 : 2024. 8.6.)](https://www.cmsedi.or.kr/cms/board/workdata)
![image2](https://github.com/user-attachments/assets/9f4c916d-cc3a-4ac7-9efb-1f7aaa1c065c)

    

**정규표현식**: 

```sql
SELECT *
FROM user
WHERE account_number REGEXP 
-- 계좌번호 (예: 123-456-789012)
```

---

### **문제 5: 거래 은행 이름 검증**

은행 이름은 신한, 국민, 농협, 우리, 하나 중 1개입니다. 이에 맞게 where 절에 정규표현식을 작성하세요.

**정규표현식**: 

```sql
SELECT *
FROM user
WHERE bank_name REGEXP 
-- 거래 은행 (예: 우리은행)
```

---

### **문제 6:** 주민등록번호 **형식 검증**

주민등록번호 형식(예: `######-#`)에 맞게 where 절에 정규표현식을 작성하세요.

단, 주민등록번호는 앞에서 7글자까지만 검증합니다.

힌트 : (1,2 = 각 0 ~ 9) (3,4 = 01 ~ 12) (5,6 = 01 ~ 31) - (7 = 1 ~4)

**정규표현식**: 

```sql
SELECT *
FROM user
WHERE ssn REGEXP 
-- 주민번호 (예: 123456-1)
```

---

### **문제 7: 이메일 형식 검증**

이메일 형식에 맞게 정규표현식을 작성하세요.

<aside>

### **이메일 형식:**

1. *영문 소문자(`a-z`), 대문자(`A-Z`), 숫자(`0-9`), 특수문자(`._%+-`)**로 아이디를 구성할 수 있음.

2. 아이디(`@` 앞부분)는 **한 글자 이상**이어야 함.
3. `@` 기호가 반드시 포함되어야 함.
4. 도메인(`@` 뒷부분)은 **영문 소문자(`a-z`), 대문자(`A-Z`), 숫자(`0-9`), 점(`.`)**만 사용 가능.
5. 도메인의 마지막 부분(최상위 도메인, `.com`, `.net` 등)은 **2글자 이상**이어야 함.
</aside>

**정규표현식**: 

```sql 
SELECT *
FROM user
WHERE email REGEXP
-- 이메일 (예: [username]@[domain].[tld]) 
```

---

</aside>

## 4. 트러블슈팅💥 

### ❓ **문제 설명 (Problem Statement)**

<img src="https://github.com/user-attachments/assets/f24b834c-4e33-49cd-ac76-ae07347ef121" width="600px">
<img src="https://github.com/user-attachments/assets/5d2b2a8b-7a20-4320-a473-c59017e43fd8" width="600px">

- **문제**: VirtualBox 안에 설치된 Ubuntu에서 MySQL을 실행하고, DBeaver로 원격 접속을 시도했으나 연결되지 않음.

- **이슈**: 기존 사용자(user01)로는 MySQL에 접속되지만, 새로 생성한 사용자로는 접속이 되지 않음.
---
### ✏️ **문제 분석 (Root Cause Analysis)**

1. 기존 사용자(user01)로는 접속이 되지만 **새로운 사용자**는 접속되지 않음.
 
2. 접속 실패의 원인:
    - 새 사용자로의 연결은 올바른 IP로 연결되지 않음.
   
    - 호스트의 Ubuntu에 3306 포트가 열려 있지만, 일부 네트워크 설정이 잘못되었음.
---
### 💡 **해결 과정 (Troubleshooting Steps)**

1. **Ubuntu에서 MySQL 3306 포트 허용**
    - Ubuntu의 MySQL 설정에서 3306 포트를 허용하는 작업을 수행.
        
        ```bash
        sudo ufw allow 3306/tcp
        ```
        
2. **새 사용자 생성 및 권한 부여 확인**
    - 쿼리문을 다시 한 번 검토했으나, 사용자 권한 부여에 문제가 없음을 확인.
3. **기존 사용자(**user01**)로 연결되는 현상 분석**
    - **원인**: 다른 사용자의 이더넷 IP로 연결되었기 때문에 기존 사용자(user01)로는 접속이 가능했음.
   
    - 새로 생성한 사용자가 올바른 IP에서 접속하려면 추가 설정이 필요함.
4. **DB 접속 시 연결 IP 확인**
    - 새 사용자도 접속할 수 있도록, 호스트 및 Ubuntu의 IP와 포트 포워딩 설정이 필요함.
---

### ✅ **해결 방법 (Solution)**

1. **접속하려는 사용자는 포트 포워딩이 필요 없다**.
   
2. **호스트 시스템에서 포트 포워딩 설정**:
   
    - 호스트 Windows와 Ubuntu 간의 **포트 포워딩**을 설정해야 하며, Ubuntu에서 3306 포트를 허용해야 함.

     <img src="https://github.com/user-attachments/assets/a0136e48-fb40-4cdb-be39-8fcf0564486b" width="600px">

3. **Ubuntu IP와 호스트 IP를 연결하여 포트 포워딩 설정**:
   
    - 새로운 사용자가 **호스트 IP**를 통해 접속할 수 있도록 포트 포워딩 설정이 완료되면, 모든 사용자가 문제 없이 연결 가능.

    <img src="https://github.com/user-attachments/assets/a5d7d16b-6e96-409a-a321-454f872b2ad5" width="600px">
---


## 5. 고찰🤔 

- 다양한 데이터 검증 문제를 해결하면서 정규표현식의 문법을 깊이 이해함. 특히 복잡한 패턴을 간결하게 표현할 수 있는 정규표현식의 효율성을 실감함.

- 하나의 MySQL에 4명이 동시에 사용할 수 있도록 원격 환경을 구축하면서 포트포워딩, 방화멱 설정, 계정 권한 부여 등 실제 네트워크 환경에서 발생할 수 있는 문제 해결 경험을 쌓음.

    <img src="https://github.com/user-attachments/assets/f639fab5-5c97-4215-89de-23f76ab72682" width="600px">
