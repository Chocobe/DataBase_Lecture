# Database

* [Database Plan](#database-plan)


* [Install Oracle Database EX](#install-oracle-database-ex)


* [Start](#start)


* [19_07_19](#19_07_19_select)

---

### Database Plan

#### 데이터베이스 설계

* 추상화

	* 모델(Model) : 복잡한 현실세계를 개념화, 단순화 시킨 것

	* 모델링(Modeling) : 모델을 만드는 과정

	* 추상화 : 현실세계를 모델링 하는 것

---

* 훌륭한 소프트웨어 엔지니어란?

	* 코딩 능력도 중요하지만, 가장 중요한 것은 모델링 능력이 높은 사람이다.

---

* 데이터베이스 설계란?

	* 테이블, 뷰 등의 구조의 디자인

	* 기본키, 외래키, 인덱스 등의 요소를 계획

---

* 데이터베이스의 저장 데이터

	* 개체(현실세계에 존재하는 객체)에 대한 정보

	* 개체들의 행위, 사건은 반영할 수 없다.

	* ``TRIGGER``는 데이터베이스의 조건 동작일 뿐이고, 개체에 대한 동작은 아니다.

---

* 소프트웨어 개발 방법

	* 폭포수 모델 개발론

		* 요구사항 분석

		* 설계

		* 구현

		* 통합 및 테스트

		* 유지보수

	* 폭포수 모델은 각 단계를 완벽히 끝내고 다음 단계로 넘어가는 방식이기 때문에, 새로운 요구사항 반영 또는 변경이 어렵다.

---

* 데이터베이스 기반의 정보시스템 구축 절차

	1. 정보전략 계획 수립 (ISP : Information Strategic Planning - 정보전략계획)

	1. 업무 분석

	1. 데이터 모델링

	1. 프로세스 모델링

	1. 상관 모델링

	1. 물리적 DB 설계

	1. 데이터베이스 구축

	1. 데이터베이스 튜닝

	1. 유지보수

:camel:[Top](#database)

---
---

### Install Oracle Database EX

#### Oracle Database EX 설치

1. ``Oracle Database EX`` 다운받기

	1. ``www.oracle.com`` -> ``Downloads``

	1. ``Database`` -> 아무 버전 선택

	1. ``Oracle Database Express Edition``의 ``Oracle Database 11g Release 2 Express Edition for Windows 64``선택

	1. 약관 동의 -> ``Oracle Database 11gR2 Express Edition for Windows x64``를 다운로드

1. ``Oracle Database EX`` 설치하기

---

#### SQL Developer 설치 (GUI 환경 만들기)

1. ``SQL Developer`` 다운받기

	1. ``www.oracle.com`` -> ``Downloads``

	1. ``Developer Tools`` -> ``SQL Developer``

	1. 약관 동의 -> ``Windows 32-bit/64bit`` 다운로드

1. ``SQL Developer`` 설치하기

	1. 압축 해제

	1. ``sqldeveloper.exe`` 실행

	1. 경로설정 : JAVA 설치 폴더의 JDK 폴더 까지 (src파일 전까지)

	1. 설치중 이전버전의 환경파일 불러오기가 뜨는데, ``아니오`` 선택

	1. 설치 완료

:camel:[Top](#database)

---
---

### Start

#### 시작하기

1. ``sqldeveloper.exe`` 실행하기

	1. 첫 실행시, ``DBA`` 개정으로 접속하여, 사용자를 만들어야 한다.

		1. ``Oracle 접속`` 클릭 -> 새 접속

		1. ``Name``에는 원하는 이름 입력

		1. ``사용자 이름``에 ``sys`` 입력

		1. ``롤``에 ``SYSDBA`` 선택

		1. ``비밀번호``는 첫 시작시 저장한 비밀번호를 입력

		1. ``테스트`` 실행

		1. 결과가 ``상태 : 성공`` 이면 성공한 것이다.

		1. ``접속`` 실행 -> 시작완료

1. 현재 접속된 계정은 DBA계정으로, 사용자를 생성해야 SQL 쿼리를 사용할 수 있다.

	1. ``CREATE USER SCOTT IDENTIFIED BY TIGER`` (아이디 : scott, 비밀번호 : tiger)

	1. 성공 멘트 확인

1. ``SCOTT``계정의 권한 부여하기

	1. ``GRANT CONNECT, RESOURCE TO SCOTT`` (접속권한, 테이블 생성 삭제 권한 부여)

1. 사용자 계정 ``scott``으로 접속하기

	1. ``Oracle 접속`` 클릭 -> 새 접속

	1. ``Name``에 원하는 이름 입력

	1. ``사용자 이름``에 ``scott``

	1. ``비밀번호``에 ``tiger``

	1. 테스트

	1. ``상태 : 성공`` 확인 후, 접속

:camel:[Top](#database)

---
---

### 19_07_19_select

1. [4] 테이블 생성하기
	
	* 가변문자열 : ``VARCHAR2``
	
	* (msSQL에서는 ``VARCHAR``)

1. [17] 튜플 삽입하기

1. [24] ``DATE``타입의 데이터 입력하기

	* ``TO_DATE('1981-02-20', 'YYYY-MM-DD')``

	* ``DATA``타입의 저장 형식을 지정하여 값을 저장한다

1. [90] 튜플 삭제하기

1. [124] 출력창에 해당 테이블을 구성하는 전체 속성 출력하기

	* ``DESC 테이블명``

1. [128] 산술 표현식 사용하기 (연산)

1. [132] 산술 표현식에 NULL값 사용시 -> 값도 NULL

1. [137] NVL 함수
	
	* NULL값을 특정한 값으로 변환하는데 사용

	* ``NVL(속성명, 바꿀값)``

	* 사용가능한 자료형 : ``날짜``, ``숫자``, ``문자``

	* 바꿀 값은 해당 속성의 자료형과 일치해야만 한다.

	* NVL : Null Value??

1. [144] Alias(열 별칭)

	* 열의 이름을 바꿔서 출력

	* ``SELECT 테이블명 속성명 AS 열별칭``

	* ``AS``는 생략 가능

	* 열별칭에 ``공백``, ``영문 대문자``, ``특수문자``가 포함된다면, ""를 사용해야 한다.

1. [159] 연결 연산자 ``||``

	* 

:camel:[Top](#database)