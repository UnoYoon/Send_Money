-- 테이블 삭제
DROP TABLE user; 

-- 테이블 생성
CREATE TABLE user (
    email VARCHAR(50),               -- 이메일 (예: [username]@[domain].[tld])
    ssn VARCHAR(9),                  -- 주민번호 (예: 123456-1)
    account_number VARCHAR(16) PRIMARY KEY, -- 계좌번호 (예: 123-456-789012) PK
    phone_number VARCHAR(15),         -- 전화번호 (예: 010-1234-5678)
    user_name VARCHAR(16),            -- 사용자 이름 (예: 홍길동) 
    bank_name VARCHAR(21),            -- 거래 은행 (예: 우리은행)
    zipcode VARCHAR(6)               -- 우편번호 (예: 12345)
);

-- 정규표현식 형식에 맞는 데이터 삽입
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

SELECT * FROM user;